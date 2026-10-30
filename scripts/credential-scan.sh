#!/usr/bin/env bash
# credential-scan v2
#
# Canonical copy: Equilateral-AI/equilateral-common, tools/credential-scan/credential-scan.sh
# Adopting repos vendor this file unchanged at scripts/credential-scan.sh, plus
# .githooks/pre-commit and .github/workflows/credential-scan.yml from the same folder.
# Enable the hook once per clone:  git config core.hooksPath .githooks
#
# Ruling (2026-10-29): tokens and keys live only in the MindMeld-governed store,
# never in GitHub. This check fails a commit or a CI run when a tracked or staged
# file holds a credential, or when a machine-local config path is tracked.
#
# Usage:
#   credential-scan.sh --staged    files staged for commit (pre-commit hook)
#   credential-scan.sh --tracked   every file in the index (CI; default)
#   credential-scan.sh --history   count credential-shaped added lines across all refs
#                                  (generic_api_key and forbidden_path are not counted;
#                                  private_key_header counts headers, an upper bound)
#
# Output is path:line:class only. Matched values are never printed.
# Exit status: 0 clean, 1 findings, 2 usage error.
#
# v2 (2026-10-29): placeholder detection is value-shaped. Each match is judged on
# its own extracted value (key body, header/bearer literal, quoted or assigned
# value), never on other words elsewhere on the line, so a real credential on a
# line that also says "example", "sample" or "placeholder" is still flagged.
# A value is a placeholder only when the value itself is a ${VAR}/$VAR/{{..}}/<..>
# reference, an env-var name, a process.env/os.environ/getenv reference, a run of
# one character or of x/X/*/0, or is built from placeholder words (your_...,
# changeme, example, sample, placeholder, redacted, dummy, fake, xxx, ...).
# AWS documented example keys (ending in EXAMPLE) stay excluded.
#
# Suppression:
#   .credential-scan-ignore   one git pathspec glob per line (fixtures, vendored code)
#   credential-scan:allow     marker on a line skips that line (use for documented placeholders)
#
# Dependencies: bash 3.2+, git, grep, awk.

set -u
export LC_ALL=C

MODE="${1:---tracked}"
case "$MODE" in
  --staged|--tracked|--history) ;;
  -h|--help) sed -n '2,36p' "$0"; exit 0 ;;
  *) echo "usage: $0 [--staged|--tracked|--history]" >&2; exit 2 ;;
esac

git rev-parse --git-dir >/dev/null 2>&1 || { echo "credential-scan: not a git repository" >&2; exit 2; }
cd "$(git rev-parse --show-toplevel)" || exit 2

# ---------------------------------------------------------------------------
# Credential classes (ERE). Each is a candidate filter; each matched value is judged
# by JUDGE_AWK below (value-shaped placeholder rule) and never written to output.
# ---------------------------------------------------------------------------
RE_MM_KEY='(^|[^A-Za-z0-9_])(mm_(ro|rw|admin|recorder|witness|sensor|live)_|mmw_([a-z]+_)?)[A-Za-z0-9]{16,}'
RE_MM_HEADER='x-mindmeld-token["'"'"']?[[:space:]]*[:=][[:space:]]*["'"'"']?[A-Za-z0-9_-]{16,}'
RE_BEARER='authorization["'"'"']?[[:space:]]*[:=][[:space:]]*["'"'"']?bearer[[:space:]]+[A-Za-z0-9._~+/=-]{16,}'
RE_AWS='(^|[^A-Z0-9])(AKIA|ASIA)[A-Z0-9]{16}([^A-Z0-9]|$)'
RE_PRIVKEY='-----BEGIN ([A-Z0-9]+ )*PRIVATE KEY-----'
RE_GENERIC_QUOTED='(api[_-]?key|apikey|secret[_-]?key|client[_-]?secret|app[_-]?password|access[_-]?key|password|passwd)["'"'"']?[[:space:]]*[:=][[:space:]]*["'"'"'][^"'"'"'[:space:]$<{]{12,}["'"'"']'
RE_GENERIC_ENV='^[[:space:]]*(export[[:space:]]+)?[A-Za-z0-9_]*(api_?key|secret|password|passwd|private_key|access_key|_token)[A-Za-z0-9_]*[[:space:]]*=[[:space:]]*["'"'"']?[^"'"'"'[:space:]$<{#]{8,}'

# Value-shaped placeholder judge (awk). Input lines are "path:line:match" where
# match is the text the class regex matched (git grep -o). The value is extracted
# per class and judged on its own; the rest of the line is never consulted.
# Prints path:line:class for every match whose value is not placeholder-shaped.
# Written without regex intervals so it runs on mawk, gawk and BSD awk.
JUDGE_AWK='
function is_placeholder(v,   lv, t, n, i, tk, c, same) {
  lv = tolower(v)
  if (length(v) == 0) return 1
  # References in value position.
  if (lv ~ /^[$%<]/ || index(lv, "${") || index(lv, "{{") || index(lv, "<")) return 1
  if (index(lv, "process.env") || index(lv, "os.environ") || index(lv, "getenv")) return 1
  # Environment-variable NAME used as the value (e.g. bearer_token_env_var = SOME_TOKEN_NAME).
  if (v ~ /^[A-Z][A-Z0-9]*(_[A-Z0-9]+)+$/) return 1
  # Masking runs: only x, *, 0, #, ., -, _ characters.
  t = lv; gsub(/[x*0#._-]/, "", t); if (t == "") return 1
  # One repeated character.
  c = substr(lv, 1, 1); same = 1
  for (i = 2; i <= length(lv); i++) if (substr(lv, i, 1) != c) { same = 0; break }
  if (same) return 1
  # Placeholder words forming the value.
  if (lv ~ /^your/ || index(lv, "change_me") || index(lv, "change-me")) return 1
  n = split(lv, tk, /[^a-z0-9]+/)
  for (i = 1; i <= n; i++) {
    if (tk[i] in PW) return 1
    if (length(tk[i]) >= 3 && tk[i] ~ /^x+$/) return 1
  }
  return 0
}
function value_of(cls, m,   v, k) {
  v = m
  if (cls == "mindmeld_key") { sub(/^.*_/, "", v); return v }
  if (cls == "aws_access_key") { gsub(/[^A-Z0-9]/, "", v); return v }
  if (cls == "bearer_literal") { sub(/^.*[ \t]/, "", v); return v }
  if (cls == "mindmeld_header_literal") { sub(/^[^:=]*[:=][ \t]*["\047]?/, "", v); return v }
  if (cls == "generic_quoted") { sub(/^.*[:=][ \t]*["\047]/, "", v); sub(/["\047]$/, "", v); return v }
  if (cls == "generic_env") {
    k = index(v, "="); v = substr(v, k + 1)
    sub(/^[ \t]*["\047]?/, "", v); return v
  }
  return v
}
BEGIN {
  split("example examples sample samples placeholder changeme redacted dummy fake your yours replaceme replace_me insert here todo tbd", a, " ")
  for (i in a) PW[a[i]] = 1
  if (allow != "") while ((getline l < allow) > 0) A[l] = 1
}
{
  i = index($0, ":"); if (i == 0) next
  path = substr($0, 1, i - 1); rest = substr($0, i + 1)
  j = index(rest, ":"); if (j == 0) next
  ln = substr(rest, 1, j - 1); m = substr(rest, j + 1)
  if ((path ":" ln) in A) next
  if (cls == "aws_access_key") { v = value_of(cls, m); if (v ~ /EXAMPLE$/) next }
  if (is_placeholder(value_of(cls, m))) next
  print path ":" ln ":" outcls
}'

# Machine-local paths that must never be tracked unless named *.example, *.template or *.sample.
RE_FORBIDDEN_PATH='(^|/)(\.mcp\.json|\.codex/config\.toml|\.env|\.env\.[^/]+|\.myworld\.json|\.claude/settings\.local\.json|\.mindmeld/.*)$'

EXCLUDES=( ':(exclude,glob)**/credential-scan.sh' ':(exclude).credential-scan-ignore'
           ':(exclude,glob)**/node_modules/**' ':(exclude,glob)**/vendor/**'
           ':(exclude,glob)**/package-lock.json' ':(exclude,glob)**/yarn.lock' ':(exclude,glob)**/pnpm-lock.yaml'
           ':(exclude,glob)**/Cargo.lock' )
if [ -f .credential-scan-ignore ]; then
  while IFS= read -r g || [ -n "$g" ]; do
    case "$g" in ''|'#'*) continue ;; esac
    EXCLUDES+=( ":(exclude,glob)$g" )
  done < .credential-scan-ignore
fi

# ---------------------------------------------------------------------------
# History mode: counts only, per class, over added lines in all refs.
# ---------------------------------------------------------------------------
if [ "$MODE" = "--history" ]; then
  total=0
  for spec in "mindmeld_key|$RE_MM_KEY|" "mindmeld_header_literal|$RE_MM_HEADER|i" \
              "bearer_literal|$RE_BEARER|i" "aws_access_key|$RE_AWS|" \
              "private_key_header|$RE_PRIVKEY|"; do
    cls="${spec%%|*}"; rest="${spec#*|}"; re="${rest%|*}"; flag="${rest##*|}"
    if [ "$flag" = i ]; then gflag=-iE; else gflag=-E; fi
    if [ "$cls" = private_key_header ]; then
      n=$(git log -p --all --no-color --format= -- . "${EXCLUDES[@]}" 2>/dev/null \
          | grep '^+' | grep -v 'credential-scan:allow' | grep $gflag -e "$re" | grep -c .)
    else
      n=$(git log -p --all --no-color --format= -- . "${EXCLUDES[@]}" 2>/dev/null \
          | grep '^+' | grep -v 'credential-scan:allow' | grep -o $gflag -e "$re" \
          | sed 's/^/h:0:/' | awk -v cls="$cls" -v outcls="$cls" -v allow= "$JUDGE_AWK" | grep -c .)
    fi
    echo "history:$cls:$n"
    total=$((total + n))
  done
  [ "$total" -eq 0 ]; exit $?
fi

# ---------------------------------------------------------------------------
# Select the file set. Content is always read from the index, so working-tree
# edits that are not staged are never scanned or printed.
# ---------------------------------------------------------------------------
FILES_TMP=$(mktemp "${TMPDIR:-/tmp}/credscan.XXXXXX") || exit 2
FIND_TMP=$(mktemp "${TMPDIR:-/tmp}/credscan.XXXXXX") || exit 2
trap 'rm -f "$FILES_TMP" "$FIND_TMP"' EXIT

if [ "$MODE" = "--staged" ]; then
  git diff --cached --name-only --diff-filter=ACMR -z > "$FILES_TMP"
else
  git ls-files -z > "$FILES_TMP"
fi
[ -s "$FILES_TMP" ] || exit 0

# Path rules.
tr '\0' '\n' < "$FILES_TMP" | grep -E "$RE_FORBIDDEN_PATH" | grep -vE '\.(example|template|sample)$' \
  | while IFS= read -r p; do echo "$p:0:forbidden_path"; done >> "$FIND_TMP"

# file_list [ERE]: NUL-separated file list for this mode, optionally filtered by path ERE.
file_list() {
  if [ -n "${1:-}" ]; then
    tr '\0' '\n' < "$FILES_TMP" | grep -E "$1" | tr '\n' '\0'
  else
    tr '\0' '\n' < "$FILES_TMP" | grep -v '^$' | tr '\n' '\0'
  fi
}

# Lines carrying the credential-scan:allow marker, as path:line, for this file set.
ALLOW_TMP=$(mktemp "${TMPDIR:-/tmp}/credscan.XXXXXX") || exit 2
trap 'rm -f "$FILES_TMP" "$FIND_TMP" "$ALLOW_TMP"' EXIT
file_list \
  | xargs -0 -r git grep --cached -I -n -F -e 'credential-scan:allow' -- "${EXCLUDES[@]}" 2>/dev/null \
  | awk '{ i = index($0, ":"); p = substr($0, 1, i - 1); r = substr($0, i + 1); j = index(r, ":"); print p ":" substr(r, 1, j - 1) }' \
  > "$ALLOW_TMP"

# scan CLASS JUDGECLASS GREPFLAGS REGEX [PATH_ERE]
# git grep -o yields one "path:line:match" per match, so each value on a line is
# judged separately; the awk judge discards the matched text and prints path:line:class.
scan() {
  file_list "${5:-}" \
    | xargs -0 -r git grep --cached -I -n -o "$3" -e "$4" -- "${EXCLUDES[@]}" 2>/dev/null \
    | awk -v cls="$2" -v outcls="$1" -v allow="$ALLOW_TMP" "$JUDGE_AWK"
}

ENV_FILES='(^|/)(\.env|\.env\.[^/]+|[^/]+\.env|\.myENV|[^/]+\.(sh|ini|cfg|conf|properties|toml))$'

scan mindmeld_key            mindmeld_key            -E  "$RE_MM_KEY"                      >> "$FIND_TMP"
scan mindmeld_header_literal mindmeld_header_literal -iE "$RE_MM_HEADER"                   >> "$FIND_TMP"
scan bearer_literal          bearer_literal          -iE "$RE_BEARER"                      >> "$FIND_TMP"
scan aws_access_key          aws_access_key          -E  "$RE_AWS"                         >> "$FIND_TMP"
scan generic_api_key         generic_quoted          -iE "$RE_GENERIC_QUOTED"              >> "$FIND_TMP"
scan generic_api_key         generic_env             -iE "$RE_GENERIC_ENV"   "$ENV_FILES"  >> "$FIND_TMP"

# Private keys: a BEGIN ... PRIVATE KEY line followed within 3 lines by a base64 body.
file_list \
  | xargs -0 -r git grep --cached -I -l -z -E -e "$RE_PRIVKEY" -- "${EXCLUDES[@]}" 2>/dev/null \
  | tr '\0' '\n' | sort -u | while IFS= read -r p; do
      [ -n "$p" ] || continue
      git show ":$p" 2>/dev/null | awk -v p="$p" -v re="$RE_PRIVKEY" '
        $0 ~ re { if (index($0, "credential-scan:allow") == 0) { begin = NR } ; next }
        begin && NR - begin <= 3 {
          line = $0; gsub(/[[:space:]]/, "", line)
          if (length(line) >= 40 && line ~ /^[A-Za-z0-9+\/=]+$/) {
            # Value-shaped placeholder body: a run of x/X/*/0 or of one character.
            t = tolower(line); gsub(/[x0=]/, "", t); c = substr(line, 1, 1); s = line; gsub(/[=]/, "", s)
            same = 1; for (k = 2; k <= length(s); k++) if (substr(s, k, 1) != c) { same = 0; break }
            if (t != "" && !same) { print p ":" begin ":private_key"; begin = 0 }
          }
        }
        begin && NR - begin > 3 { begin = 0 }'
    done >> "$FIND_TMP"

if [ -s "$FIND_TMP" ]; then
  sort -u "$FIND_TMP"
  echo "credential-scan: $(sort -u "$FIND_TMP" | grep -c .) finding(s)." \
       "Move the value to the MindMeld-governed store and reference it by env var," \
       "untrack machine-local files (git rm --cached), or mark a documented placeholder with credential-scan:allow." >&2
  echo "credential-scan: counts by class:" >&2
  sort -u "$FIND_TMP" | awk -F: '{ print $NF }' | sort | uniq -c >&2
  exit 1
fi
exit 0
