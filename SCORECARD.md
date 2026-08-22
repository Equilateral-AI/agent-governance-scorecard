<!-- div.nav-logo -->
[]
- []
- []
- []
- []
- [][]
# 

<!-- div.hero-buttons -->
[][]
<!-- div.gallery-inner -->

## The Framework at a Glance

Six dimensions every enterprise should measure before deploying AI agents.

<!-- div.collateral-grid -->

<!-- div.scope-box -->

### Scope of Applicability

**This scorecard applies to collaborative agentic systems** where humans and AI agents share responsibility for value-laden decisions—including recommendations, prioritization, risk assessment, and action selection.

It is **domain-agnostic**: applicable to software delivery, enterprise operations, regulated environments, and mission-oriented decision support (e.g., C2-style workflows).

The standard is **evidence-first**: observable behavior and enforceable controls—not intent or roadmaps.

> 
            Roadmap items, planned features, aspirational designs, future commitments, or policy statements do not constitute evidence. If a criterion cannot be met without architectural redesign, it must be marked "No".
        
## Why This Exists

AI agents are moving from experimental tools to production systems. But most platforms lack the architectural foundations for enterprise governance:

- **No central oversight** — Agents operate without accountability
- **No audit trails** — "The AI did it" is not an acceptable answer
- **No permission boundaries** — Agents inherit full user privileges
- **No human intervention points** — Autonomous systems with no guardrails

The result: AI agents that can't be audited, can't be controlled, and can't be trusted in regulated environments.

**This scorecard provides objective criteria for evaluating any AI agent platform's governance readiness.**

## The Six Dimensions

<!-- div.dimension-card -->

### 1 Control Towers

"Organizations must establish control towers for AI — treating agents as organizational resources that need management and accountability."

Control towers provide centralized authority over agent operations — including the authority to intervene, constrain, or halt agent execution. Visibility alone is insufficient; control towers must have operational power.

| Criterion | Description |
| Central orchestration authority | Single point of coordination for agent activities with power to direct, constrain, or halt |
| Agent registry and accountability | All agents registered, identified, and trackable to responsible parties |
| Dependency-aware execution | System understands agent interdependencies and can manage cascading effects |
| Real-time execution oversight | Live visibility into what agents are doing with ability to intervene |
<!-- div.dimension-card -->

### 2 Decision Integrity

"Complete visibility into agent actions and decisions."

When AI agents make or influence decisions — including recommendations, prioritizations, and risk assessments — the reasoning must be preserved and traceable. The key question: "Why was this recommendation made, and who accepted it?"

| Criterion | Description |
| Decision reasoning preserved | Why the agent made each decision is recorded (not just what) |
| Reasoning survives agent handoffs | Context transfers when work moves between agents; lineage is not lost |
| Alternatives explicitly recorded | What options were considered, not just what was chosen |
| Confidence explicitly represented | Agents express uncertainty; humans can calibrate trust accordingly |
<!-- div.dimension-card -->

### 3 Observability

"Traceability over blind trust."

Every agent action must be visible, recorded, and auditable. Human and AI actions should flow through the same audit infrastructure—no separate systems, no gaps in lineage.

| Criterion | Description |
| Complete action coverage | Every agent action is logged |
| Unified human + agent audit trail | Same audit system for human and AI actions |
| Tamper-evident records | Audit logs cannot be modified without detection |
<!-- div.dimension-card -->

### 4 Governance Enforcement

"Governance isn't bureaucracy. Governance is scaffolding."

Governance must be enforced at runtime, not merely documented in policy. Controls must be architectural — agents cannot bypass them regardless of prompt engineering, configuration changes, or emergent behavior.

| Criterion | Description |
| Runtime governance enforcement | Rules enforced during execution, not just at design time or deployment |
| Non-bypassable controls | Agents cannot circumvent governance mechanisms through any means (architectural, not policy-based) |
| Pre-execution blocking | Unauthorized actions prevented before they occur, not logged after the fact |
<!-- div.dimension-card -->

### 5 Human-in-the-Loop (Calibrated Trust)

"Calibrated trust means knowing when to trust AI and when to intervene."

Humans must be able to intervene at the right moments—before harm occurs, not after. This requires systems designed for calibrated trust, not blind automation or post-hoc review.

| Criterion | Description |
| Confidence-based escalation | Low-confidence decisions automatically escalate |
| Pre-harm intervention | Humans can intervene before damage occurs |
| Blocking human approval | Critical actions require explicit human authorization |
<!-- div.dimension-card -->

### 6 System Evolution & Drift

"Derived from principles for operating agentic systems safely at scale."

Agent behavior changes over time — through retraining, prompt updates, model swaps, or emergent drift. In governed systems, evolution must be auditable, changes must be attributable, and rollback must be operationally real (not theoretical).

| Criterion | Description |
| Scoped learning boundaries | Agent learning is bounded and controlled; cannot self-modify beyond defined limits |
| Auditable behavioral change | Changes in agent behavior are logged with attribution (who, what, when, why) |
| Reversible evolution / rollback | Agent behavior can be reverted to previous states within operational timeframes |
| Drift detection over time | System actively detects when agent behavior deviates from baseline |
## Download the Scorecard

Use these tools to evaluate any AI agent platform — including ours.

<!-- div.downloads-grid -->

<!-- div.download-card -->

#### Governance Scorecard

The complete evaluation framework with all 6 dimensions and 20 criteria
[View Scorecard]
<!-- div.download-card -->

#### Governance Framework

Full framework background, principles, and attribution
[View Framework]
<!-- div.download-card -->

#### GitHub Repository

Full documentation, contributing guidelines, and community assessments
[View on GitHub]
## How to Use

### For Evaluating Vendors

1. Download the worksheet
2. For each criterion, assess: **Yes**, **Partial**, or **No**
3. Require evidence — demos, architecture docs, or live system access
4. Remember: Roadmaps don't count. Only current capabilities.
### For Self-Assessment

1. Be honest — the scorecard is only useful if accurate
2. Document your evidence in the worksheet
3. Identify gaps and prioritize architectural improvements
4. Reassess periodically as your platform evolves
### For RFPs and Procurement

Include scorecard criteria in your evaluation matrix. Use these criteria to ensure both AI actions and human approvals are attributable within the same audit trail.

Sample RFP language is available in the [GitHub repository].

<!-- div.section-content -->

## Public Anchors

For transparency on sources and influences

This scorecard is anchored to publicly stated enterprise AI governance principles discussed by **Tracy Bannon** (Senior Principal, MITRE Corporation) and others in the governance community.

**No endorsement by MITRE or any individual is implied.** This is an independent governance instrument maintained by Equilateral AI.

> 
                "AI should be treated not as magic, but as software and data — meaning it must be governed by proper software architecture and engineering practices, not guesswork."
                — Tracy Bannon, MITRE Corporation
> 
                "Organizations must establish 'control towers' for AI — treating agents as organizational resources that need management and accountability, rather than as uncontrolled experiments."
                — Tracy Bannon, MITRE Corporation

For the complete framework background, see [FRAMEWORK.md] in the GitHub repository.

## About This Scorecard

The Agent Governance Scorecard is developed and maintained by [Equilateral AI], a governed AI agent orchestration platform.

We built this scorecard because we needed objective criteria to evaluate our own platform — and found nothing comprehensive existed. We're releasing it publicly because the industry needs shared standards for AI agent governance.

**This is not a marketing document.** Use it to evaluate us. Use it to evaluate our competitors. Use it to evaluate your own internal platforms. The goal is better governance across the industry.

Licensed under [Creative Commons Attribution 4.0 International (CC BY 4.0)].

<!-- div.scorecard-footer-content -->

<!-- div.scorecard-meta -->

### 

[]

[]

<!-- div.downloads -->

#### 

- []
- []
- []
<!-- div.links -->

#### 

- []
- []
- []
- []
<!-- div.footer-bottom -->

[]