# Governance Protocol

**How dispositions are made on the Agent Governance Scorecard.**

---

## Authority

Dispositions on proposed changes to the Scorecard are made by the named maintainer (James Ford, Equilateral AI). Authority is explicit and singular — there is no committee, vote, or community adjudication mechanism.

This is deliberate: governance standards require traceable authority. Every disposition names the person who made it, the evidence considered, and the reasoning. Anonymous or collective authority cannot be audited.

---

## Raknor Does Not Comment

Raknor — the independent assessor that evaluates platforms against this scorecard — is explicitly excluded from commenting on framework revisions during public comment periods.

**Why:** The assessor's credibility depends on independence from the framework it evaluates. If Raknor shapes the criteria, its assessments against those criteria carry a conflict of interest. The disposition log's credibility requires this separation.

Raknor operates the adjudication infrastructure (venue) but holds no authority over scorecard content (docket).

---

## Disposition Types

Every substantive comment receives one of four dispositions:

| Disposition | Meaning |
|-------------|---------|
| **Accepted** | Change adopted into the scorecard; rationale and affected criteria recorded |
| **Accepted in Principle** | The concern is valid but the proposed change needs rework; direction accepted, specific text deferred |
| **Rejected** | Change declined; rationale recorded with evidence considered |
| **Deferred** | Change has merit but is out of scope for this version; logged for future consideration |

---

## Process

1. **Comment submitted** — via any intake channel (GitHub issue, MCP, email)
2. **Comment logged** — assigned a case identifier; original text preserved verbatim
3. **Evidence gathered** — maintainer investigates the claim independently
4. **Disposition issued** — one of the four types above, with:
   - The claim as stated
   - Evidence considered (for and against)
   - The ruling
   - Rationale (why this disposition, not another)
   - Affected criteria (if Accepted)
5. **Disposition published** — recorded in [DISPOSITIONS.md](DISPOSITIONS.md) and the canonical governance ledger

---

## What Counts

- **Falsification pressure** matters more than volume — one correct challenge outweighs popular incorrect ones
- **Evidence** is required — assertions without supporting evidence receive Deferred, not Accepted
- **Attribution strength** (verified identity, claimed identity, pseudonymous, anonymous) is recorded as a property of the comment but does not gate entry or standing
- **Independence** relative to framework publication is recorded — pre-publication convergence is weighted stronger than post-publication corroboration

---

## Transparency

- All dispositions are public
- The complete event sequence (comment → evidence → ruling → rationale → change) is preserved
- No comments are deleted; rejected comments and their rationale remain in the record
- The disposition log is append-only

---

## Contact

- **Issues:** [GitHub Issues](https://github.com/Equilateral-AI/agent-governance-scorecard/issues)
- **Email:** scorecard@equilateral.ai
