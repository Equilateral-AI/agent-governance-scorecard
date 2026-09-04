# Disposition Log

**Record of all public comment dispositions on the Agent Governance Scorecard.**

See [GOVERNANCE.md](GOVERNANCE.md) for the disposition process.

---

## Format

Each entry records:

| Field | Description |
|-------|-------------|
| **ID** | Case identifier (e.g., DISP-001) |
| **Date** | Disposition date |
| **Disposition** | Accepted / Accepted in Principle / Rejected / Deferred |
| **Claim** | The comment as submitted (verbatim or summarized with original preserved) |
| **Evidence** | Evidence considered for and against |
| **Ruling** | The decision |
| **Rationale** | Why this disposition, not another |
| **Affected Criteria** | Criteria changed (if Accepted) |
| **Attribution** | Comment source (verified/claimed/pseudonymous/anonymous) |

---

## v1.1 Comment Window

*Comment window not yet open. Entries will appear here as dispositions are issued.*

---

## Pre-Window Deferred Items

The following items were identified during v1.1 drafting and deferred to the disposition process rather than included in the draft. They are the first entries in the log.

### DISP-PRE-001 — Peer-Influence Criteria

**Date:** 2026-09-04
**Disposition:** Deferred
**Claim:** Add criteria evaluating whether platforms detect and mitigate peer-influence dynamics in multi-agent systems (agents reinforcing each other's errors or biases).
**Evidence:** Observed in multi-agent deployments; limited architectural solutions currently exist.
**Ruling:** Deferred to post-window evaluation.
**Rationale:** The criterion is valid but the evidence standard — how to evaluate "Yes" vs "Partial" vs "No" — is not sufficiently defined. Needs community input on what constitutes architectural support for peer-influence mitigation.
**Affected Criteria:** None (deferred).
**Attribution:** Internal (maintainer).

### DISP-PRE-002 — Evidence Format Portability

**Date:** 2026-09-04
**Disposition:** Deferred
**Claim:** Add criteria requiring governance evidence to be emitted in a published, versioned, openly licensed schema — portable across platforms and verifiable by third parties without proprietary tooling.
**Evidence:** Analogous to SARIF standardization for static analysis; addresses vendor lock-in of governance records. Related to Agent Baseline OBS-07 proposal (if adopted).
**Ruling:** Deferred to post-window evaluation.
**Rationale:** Depends on whether a credible open evidence schema emerges (from the Baseline process or elsewhere). Premature to require a schema that does not yet exist. If OBS-07 is adopted by the Baseline, this criterion gains a natural reference standard.
**Affected Criteria:** None (deferred).
**Attribution:** Internal (maintainer).
