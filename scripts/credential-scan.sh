#!/usr/bin/env bash
# credential-scan v1
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
  -h|--help) sed -n '2,25p' "$0"; exit 0 ;;
  *) echo "usage: $0 [--staged|--tracked|--history]" >&2; exit 2 ;;
esac

git rev-parse --git-dir >/dev/null 2>&1 || { echo "credential-scan: not a git repository" >&2; exit 2; }
cd "$(git rev-parse --show-toplevel)" || exit 2

# ---------------------------------------------------------------------------
# Credential classes (ERE). Each is a candidate filter; values are checked
# against PLACEHOLDER below inside awk and never written to output.
# ---------------------------------------------------------------------------
RE_MM_KEY='(^|[^A-Za-z0-9_])(mm_(ro|rw|admin|recorder|witness|sensor|live)_|mmw_([a-z]+_)?)[A-Za-z0-9]{16,}'
RE_MM_HEADER='x-mindmeld-token["'"'"']?[[:space:]]*[:=][[:space:]]*["'"'"']?[A-Za-z0-9_-]{16,}'
RE_BEARER='authorization["'"'"']?[[:space:]]*[:=][[:space:]]*["'"'"']?bearer[[:space:]]+[A-Za-z0-9._~+/=-]{16,}'
RE_AWS='(^|[^A-Z0-9])(AKIA|ASIA)[A-Z0-9]{16}([^A-Z0-9]|$)'
RE_PRIVKEY='-----BEGIN ([A-Z0-9]+ )*PRIVATE KEY-----'
RE_GENERIC_QUOTED='(api[_-]?key|apikey|secret[_-]?key|client[_-]?secret|app[_-]?password|access[_-]?key|password|passwd)["'"'"']?[[:space:]]*[:=][[:space:]]*["'"'"'][^"'"'"'[:space:]$<{]{12,}["'"'"']'
RE_GENERIC_ENV='^[[:space:]]*(export[[:space:]]+)?[A-Za-z0-9_]*(api_?key|secret|password|passwd|private_key|access_key|_token)[A-Za-z0-9_]*[[:space:]]*=[[:space:]]*["'"'"']?[^"'"'"'[:space:]$<{#]{8,}'

# Values that are obviously placeholders (checked case-insensitively).
PLACEHOLDER='example|env_var|placeholder|changeme|change_me|your[_-]|<[a-z_-]+>|xxxxxxxx|redacted|dummy|sample|fake|[*][*][*][*]|0000000000000000|process[.]env|os[.]environ|getenv'

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
    n=$(git log -p --all --no-color --format= -- . "${EXCLUDES[@]}" 2>/dev/null \
        | grep '^+' | grep -v 'credential-scan:allow' | grep $gflag -e "$re" \
        | grep -viE -e "$PLACEHOLDER" | grep -c .)
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

# filter_hits CLASS: reads git grep "path:line:content", drops allow-marked and
# placeholder lines, prints path:line:class. Content is discarded here.
filter_hits() {
  awk -v cls="$1" -v ph="$PLACEHOLDER" '{
    i = index($0, ":"); if (i == 0) next
    path = substr($0, 1, i - 1); rest = substr($0, i + 1)
    j = index(rest, ":"); if (j == 0) next
    ln = substr(rest, 1, j - 1); content = substr(rest, j + 1)
    if (index(content, "credential-scan:allow")) next
    if (tolower(content) ~ ph) next
    print path ":" ln ":" cls
  }'
}

# scan CLASS GREPFLAGS REGEX [PATH_ERE]
scan() {
  file_list "${4:-}" \
    | xargs -0 -r git grep --cached -I -n "$2" -e "$3" -- "${EXCLUDES[@]}" 2>/dev/null \
    | filter_hits "$1"
}

ENV_FILES='(^|/)(\.env|\.env\.[^/]+|[^/]+\.env|\.myENV|[^/]+\.(sh|ini|cfg|conf|properties|toml))$'

scan mindmeld_key            -E  "$RE_MM_KEY"                       >> "$FIND_TMP"
scan mindmeld_header_literal -iE "$RE_MM_HEADER"                    >> "$FIND_TMP"
scan bearer_literal          -iE "$RE_BEARER"                       >> "$FIND_TMP"
scan aws_access_key          -E  "$RE_AWS"                          >> "$FIND_TMP"
scan generic_api_key         -iE "$RE_GENERIC_QUOTED"               >> "$FIND_TMP"
scan generic_api_key         -iE "$RE_GENERIC_ENV"    "$ENV_FILES"  >> "$FIND_TMP"

# Private keys: a BEGIN ... PRIVATE KEY line followed within 3 lines by a base64 body.
file_list \
  | xargs -0 -r git grep --cached -I -l -z -E -e "$RE_PRIVKEY" -- "${EXCLUDES[@]}" 2>/dev/null \
  | tr '\0' '\n' | sort -u | while IFS= read -r p; do
      [ -n "$p" ] || continue
      git show ":$p" 2>/dev/null | awk -v p="$p" -v re="$RE_PRIVKEY" '
        $0 ~ re { if (index($0, "credential-scan:allow") == 0) { begin = NR } ; next }
        begin && NR - begin <= 3 {
          line = $0; gsub(/[[:space:]]/, "", line)
          if (length(line) >= 40 && line ~ /^[A-Za-z0-9+\/=]+$/) { print p ":" begin ":private_key"; begin = 0 }
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
