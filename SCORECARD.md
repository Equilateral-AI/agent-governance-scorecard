# Agent Governance Scorecard

**21 criteria across 6 dimensions for evaluating AI agent platform governance.**

---

## How to Use

1. Rate each criterion: **Yes** | **Partial** | **No**
2. Evidence required — demos, docs, or live system access
3. Roadmaps don't count — only current capabilities

---

## 1. Control Towers

| # | Criterion | Y/P/N | Evidence |
|---|-----------|-------|----------|
| 1.1 | Central orchestration authority — single point of coordination with power to direct, constrain, or halt agents | | |
| 1.2 | Agent registry — all agents registered, identified, and trackable to responsible parties | | |
| 1.3 | Dependency-aware execution — system understands agent interdependencies and manages cascading effects | | |
| 1.4 | Real-time oversight — live visibility into agent activity with ability to intervene | | |

---

## 2. Decision Integrity

| # | Criterion | Y/P/N | Evidence |
|---|-----------|-------|----------|
| 2.1 | Decision reasoning preserved — why the agent decided, not just what | | |
| 2.2 | Reasoning survives handoffs — context transfers between agents; lineage maintained | | |
| 2.3 | Alternatives recorded — what options were considered, not just what was chosen | | |
| 2.4 | Confidence represented — agents express uncertainty; humans can calibrate trust | | |

---

## 3. Observability

| # | Criterion | Y/P/N | Evidence |
|---|-----------|-------|----------|
| 3.1 | Complete action coverage — every agent action is logged | | |
| 3.2 | Unified audit trail — same audit system for human and AI actions | | |
| 3.3 | Tamper-evident records — audit logs cannot be modified without detection | | |

---

## 4. Governance Enforcement

| # | Criterion | Y/P/N | Evidence |
|---|-----------|-------|----------|
| 4.1 | Runtime enforcement — rules enforced during execution, not just at design time | | |
| 4.2 | Non-bypassable controls — agents cannot circumvent governance through any means | | |
| 4.3 | Pre-execution blocking — unauthorized actions prevented before they occur | | |

---

## 5. Human-in-the-Loop

| # | Criterion | Y/P/N | Evidence |
|---|-----------|-------|----------|
| 5.1 | Confidence-based escalation — low-confidence decisions automatically escalate | | |
| 5.2 | Pre-harm intervention — humans can intervene before damage occurs | | |
| 5.3 | Blocking approval — critical actions require explicit human authorization | | |

---

## 6. System Evolution

| # | Criterion | Y/P/N | Evidence |
|---|-----------|-------|----------|
| 6.1 | Scoped learning boundaries — agent learning is bounded; cannot self-modify beyond limits | | |
| 6.2 | Auditable behavioral change — changes in agent behavior logged with attribution | | |
| 6.3 | Reversible evolution — agent behavior can be reverted to previous states | | |
| 6.4 | Drift detection — system detects when agent behavior deviates from baseline | | |

---

## Scoring

| Score | Criteria Met |
|-------|--------------|
| **Governed** | 19-21 Yes |
| **Partial** | 14-18 Yes |
| **Gaps** | 9-13 Yes |
| **Not Ready** | 0-8 Yes |

---

## Evidence Standard

> Roadmap items, planned features, or policy statements do not constitute evidence.
> If a criterion cannot be met without architectural redesign, mark **No**.

---

**License:** [CC BY 4.0](https://creativecommons.org/licenses/by/4.0/) — Attribute to Equilateral AI

**Framework:** Based on [enterprise AI governance principles](FRAMEWORK.md) by Tracy Bannon (MITRE)
