# Agent Governance Scorecard v1.1-draft

**25 criteria across 6 dimensions for evaluating AI agent platform governance.**

> This is a draft for public comment. See [GOVERNANCE.md](GOVERNANCE.md) for the disposition process and [DISPOSITIONS.md](DISPOSITIONS.md) for the comment log.

---

## How to Use

1. Rate each criterion: **Yes** | **Partial** | **No**
2. Evidence required — demos, docs, or live system access
3. Roadmaps don't count — only current capabilities
4. Each dimension is non-compensable — strength in one dimension cannot offset weakness in another; governance fidelity is bounded by the weakest link in the chain

---

## 1. Control Towers

*"Organizations must establish control towers for AI — treating agents as organizational resources that need management and accountability."*

Control towers provide centralized authority over agent operations — including the authority to intervene, constrain, or halt agent execution. Visibility alone is insufficient; control towers must have operational power.

| # | Criterion | Y/P/N | Evidence |
|---|-----------|-------|----------|
| SC-1.1 | Central orchestration authority — single point of coordination with power to direct, constrain, or halt agents | | |
| SC-1.2 | Agent registry — all agents registered, identified, and trackable to responsible parties | | |
| SC-1.3 | Dependency-aware execution — system understands agent interdependencies and manages cascading effects | | |
| SC-1.4 | Real-time oversight — live visibility into agent activity with ability to intervene | | |
| SC-1.5 | External backpressure response — agents read and respond to external resource pressure signals by throttling, deferring, or shedding load | | |

---

## 2. Decision Integrity

*"Preserve the why, not just the what."*

When AI agents make or influence decisions — including recommendations, prioritizations, and risk assessments — the reasoning must be preserved and traceable. The key question: "Why was this recommendation made, and who accepted it?"

| # | Criterion | Y/P/N | Evidence |
|---|-----------|-------|----------|
| SC-2.1 | Decision reasoning preserved — why the agent decided, not just what; captured externally at decision time, not reconstructed post-hoc | | |
| SC-2.2 | Reasoning survives handoffs — context transfers between agents; lineage maintained across agent-to-agent delegation | | |
| SC-2.3 | Alternatives recorded — what options were considered and rejected, not just what was chosen | | |
| SC-2.4 | Confidence represented — agents express uncertainty explicitly; humans can calibrate trust accordingly | | |

---

## 3. Observability

*"Coverage, correlation, tamper evidence."*

| # | Criterion | Y/P/N | Evidence |
|---|-----------|-------|----------|
| SC-3.1 | Complete action coverage — every agent action is logged | | |
| SC-3.2 | Unified audit trail — same audit system for human and AI actions | | |
| SC-3.3 | Tamper-evident records — audit logs cannot be modified without detection | | |

---

## 4. Governance Enforcement

*"Governance isn't bureaucracy. Governance is scaffolding."*

Governance must be enforced at runtime, not merely documented in policy. Controls must be architectural — agents cannot bypass them regardless of prompt engineering, configuration changes, or emergent behavior.

| # | Criterion | Y/P/N | Evidence |
|---|-----------|-------|----------|
| SC-4.1 | Runtime governance enforcement — rules enforced during execution, not just at design time or deployment | | |
| SC-4.2 | Non-bypassable controls — agents cannot circumvent governance mechanisms through any means (architectural, not policy-based) | | |
| SC-4.3 | Pre-execution blocking — unauthorized actions prevented before they occur, not logged after the fact | | |
| SC-4.4 | Effective authority bounded per task — agent authority is computed and scoped to the task at hand, not inherited from the operating credential or the invoking user's full privilege set | | |
| SC-4.5 | Delegation-boundary enforcement — when an agent creates or invokes sub-agents, governance controls apply to the delegate; identity-scoped prohibitions cannot be circumvented by spawning a new identity | | |

---

## 5. Human-in-the-Loop (Calibrated Trust)

*"Calibrated trust means knowing when to trust AI and when to intervene."*

| # | Criterion | Y/P/N | Evidence |
|---|-----------|-------|----------|
| SC-5.1 | Confidence-based escalation — low-confidence decisions automatically escalate | | |
| SC-5.2 | Pre-harm intervention — humans can intervene before damage occurs | | |
| SC-5.3 | Blocking human approval — critical actions require explicit human authorization | | |
| SC-5.4 | Earned autonomy — agent autonomy expands against demonstrated conformance over a trailing window and contracts on decline; the system calibrates trust dynamically rather than granting fixed permission levels | | |

---

## 6. System Evolution & Drift

*Derived from principles for operating agentic systems safely at scale.*

Agent behavior changes over time — through retraining, prompt updates, model swaps, or emergent drift. In governed systems, evolution must be auditable, changes must be attributable, and rollback must be operationally real (not theoretical).

| # | Criterion | Y/P/N | Evidence |
|---|-----------|-------|----------|
| SC-6.1 | Scoped learning boundaries — agent learning is bounded; cannot self-modify beyond limits | | |
| SC-6.2 | Auditable behavioral change — changes in agent behavior logged with attribution | | |
| SC-6.3 | Reversible evolution — agent behavior can be reverted to previous states within operational timeframes | | |
| SC-6.4 | Drift detection — system actively detects when agent behavior deviates from baseline (not just performance metrics) | | |

---

## Scoring

| Score | Criteria Met |
|-------|--------------|
| **Governed** | 23-25 Yes |
| **Partial** | 18-22 Yes |
| **Gaps** | 11-17 Yes |
| **Not Ready** | 0-10 Yes |

Each dimension is non-compensable: a platform scoring "Yes" on all criteria in five dimensions but "No" across an entire dimension is not "Governed" — it has an unaddressed governance surface.

---

## Theoretical Basis

This scorecard's six dimensions — Control Towers, Decision Integrity, Observability, Governance Enforcement, Human-in-the-Loop, and System Evolution — are derived from Governance Fidelity Theory (GFT).

GFT models governance as a fidelity chain: governing intent (what the principal wants enforced) passes through successive transformations — specification, encoding, injection, interpretation, execution, observation — and each transformation can degrade the signal. Governance fidelity is bounded by the weakest link in this chain, not by the average. A system with perfect observability but no enforcement has zero governance fidelity at the enforcement link, regardless of its observability score.

The six dimensions map to the surfaces where fidelity loss is observable and measurable:

| Dimension | Fidelity Surface |
|-----------|-----------------|
| Control Towers | Authority specification and coordination |
| Decision Integrity | Reasoning preservation across transformations |
| Observability | Observation fidelity — can the principal verify what happened? |
| Governance Enforcement | Encoding and runtime enforcement fidelity |
| Human-in-the-Loop | Feedback channel from observation back to authority |
| System Evolution | Temporal fidelity — does governance hold as the system changes? |

The non-compensable scoring model follows directly: because fidelity is bounded by the minimum, strength in one dimension cannot offset weakness in another.

> **Reference:** J. Ford, "Toward a Theory of Governance Fidelity in Foundation Model Agentic Systems," working paper, Equilateral AI, 2026. CC BY 4.0.

---

## Relationship to Agent Baseline

Earned autonomy (SC-5.4) is symmetric with the Agent Baseline's AUT-10 control ("Autonomy is earned through demonstrated conformance, not granted by default"). The Baseline addresses autonomy from the control-specification side; the Scorecard evaluates whether a platform architecturally supports the earned-autonomy pattern. A platform can satisfy SC-5.4 without adopting the Baseline, and vice versa — the criterion is structural, not policy-prescriptive.

---

## Evidence Standard

> Roadmap items, planned features, or policy statements do not constitute evidence.
> If a criterion cannot be met without architectural redesign, mark **No**.

---

## Changes from v1.0

| Change | Criteria | Rationale |
|--------|----------|-----------|
| Inherited-credential and delegation-boundary criteria added | SC-4.4, SC-4.5 | Documented incidents where governance gates existed but credential paths routed around them (the Kiro/PocketOS class); a gate that can be bypassed by spawning a new identity is not a gate |
| Earned autonomy made first-class | SC-5.4 | Fixed permission levels do not model real-world trust calibration; symmetric with Agent Baseline AUT-10 |
| Theoretical basis section added | — | GFT provides the structural justification for why these six dimensions, and why non-compensable scoring |
| Criteria numbered as SC-x.y | All | Stable references for public comment; "criterion 4.2" is unambiguous across versions |
| Scoring thresholds updated | Scoring | Adjusted for 25 criteria (from 22) |

---

**License:** [CC BY 4.0](https://creativecommons.org/licenses/by/4.0/) — Attribute to Equilateral AI

**Framework:** Based on [enterprise AI governance principles](FRAMEWORK.md) by Tracy Bannon (MITRE)
