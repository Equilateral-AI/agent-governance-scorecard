# Agent Governance Scorecard

**A framework for evaluating whether AI agent systems are governable by design.**

[![License: CC BY 4.0](https://img.shields.io/badge/License-CC%20BY%204.0-lightgrey.svg)](https://creativecommons.org/licenses/by/4.0/)

---

## Why This Exists

AI agents are moving from experimental tools to production systems. But most platforms lack the architectural foundations for enterprise governance:

- **No central oversight** — Agents operate without accountability
- **No audit trails** — "The AI did it" is not an acceptable answer
- **No permission boundaries** — Agents inherit full user privileges
- **No human intervention points** — Autonomous systems with no guardrails

The result: AI agents that can't be audited, can't be controlled, and can't be trusted in regulated environments.

**This scorecard provides objective criteria for evaluating any AI agent platform's governance readiness.**

---

## The Evidence Standard

> **Roadmap items, planned features, aspirational designs, future commitments, or policy statements do not constitute evidence.**
>
> **If a criterion cannot be met without architectural redesign, it must be marked "No".**

This scorecard is deliberately strict. Governance must be architectural, not aspirational.

---

## Scope

This scorecard applies to **collaborative agentic systems** in which humans and AI agents share responsibility for value-laden decisions, requiring transparency, traceability, and enforceable governance by design.

It is designed for evaluating platforms where:
- AI agents make or influence consequential decisions
- Human oversight is required (regulatory, ethical, or operational)
- Audit trails must survive legal or compliance scrutiny
- Agent behavior must be explainable after the fact

---

## The Six Dimensions

### 1. Control Towers

*"Organizations must establish control towers for AI — treating agents as organizational resources that need management and accountability."*

Control towers provide centralized authority over agent operations — including the authority to intervene, constrain, or halt agent execution. Visibility alone is insufficient; control towers must have operational power.

| Criterion | Description |
|-----------|-------------|
| Central orchestration authority | Single point of coordination for agent activities with power to direct, constrain, or halt |
| Agent registry and accountability | All agents registered, identified, and trackable to responsible parties |
| Dependency-aware execution | System understands agent interdependencies and can manage cascading effects |
| Real-time execution oversight | Live visibility into what agents are doing with ability to intervene |

---

### 2. Decision Integrity

*"Preserve the why, not just the what."*

When AI agents make or influence decisions — including recommendations, prioritizations, and risk assessments — the reasoning must be preserved and traceable. The key question: "Why was this recommendation made, and who accepted it?"

| Criterion | Description |
|-----------|-------------|
| Decision reasoning preserved | Why the agent made each decision is recorded (not just what) |
| Reasoning survives agent handoffs | Context transfers when work moves between agents; lineage is not lost |
| Alternatives explicitly recorded | What options were considered, not just what was chosen |
| Confidence explicitly represented | Agents express uncertainty; humans can calibrate trust accordingly |

---

### 3. Observability

*"Coverage, correlation, tamper evidence."*

| Criterion | Description |
|-----------|-------------|
| Complete action coverage | Every agent action is logged |
| Unified human + agent audit trail | Same audit system for human and AI actions |
| Tamper-evident records | Audit logs cannot be modified without detection |

---

### 4. Governance Enforcement

*"Governance isn't bureaucracy. Governance is scaffolding."*

Governance must be enforced at runtime, not merely documented in policy. Controls must be architectural — agents cannot bypass them regardless of prompt engineering, configuration changes, or emergent behavior.

| Criterion | Description |
|-----------|-------------|
| Runtime governance enforcement | Rules enforced during execution, not just at design time or deployment |
| Non-bypassable controls | Agents cannot circumvent governance mechanisms through any means (architectural, not policy-based) |
| Pre-execution blocking | Unauthorized actions prevented before they occur, not logged after the fact |

---

### 5. Human-in-the-Loop (Calibrated Trust)

*"Calibrated trust means knowing when to trust AI and when to intervene."*

| Criterion | Description |
|-----------|-------------|
| Confidence-based escalation | Low-confidence decisions automatically escalate |
| Pre-harm intervention | Humans can intervene before damage occurs |
| Blocking human approval | Critical actions require explicit human authorization |

---

### 6. System Evolution & Drift

*Derived from principles for operating agentic systems safely at scale.*

Agent behavior changes over time — through retraining, prompt updates, model swaps, or emergent drift. In governed systems, evolution must be auditable, changes must be attributable, and rollback must be operationally real (not theoretical).

| Criterion | Description |
|-----------|-------------|
| Scoped learning boundaries | Agent learning is bounded and controlled; cannot self-modify beyond defined limits |
| Auditable behavioral change | Changes in agent behavior are logged with attribution (who, what, when, why) |
| Reversible evolution / rollback | Agent behavior can be reverted to previous states within operational timeframes |
| Drift detection over time | System actively detects when agent behavior deviates from baseline (not just performance metrics) |

---

## The Scorecard

See **[SCORECARD.md](SCORECARD.md)** for the evaluation grid.

---

## How to Use

### For Evaluating Vendors

1. Use [SCORECARD.md](SCORECARD.md) as your evaluation grid
2. For each criterion, assess: **Yes**, **Partial**, or **No**
3. Require evidence — demos, architecture docs, or live system access
4. Remember: Roadmaps don't count. Only current capabilities.

### For Self-Assessment

1. Be honest — the scorecard is only useful if accurate
2. Document your evidence in the scorecard
3. Identify gaps and prioritize architectural improvements
4. Reassess periodically as your platform evolves

### For RFPs and Procurement

Include scorecard criteria in your evaluation matrix:

```
Section 7: AI Agent Governance Requirements

7.1 The vendor shall demonstrate central orchestration authority
    for all AI agent activities.

7.2 The vendor shall provide tamper-evident audit trails for
    all agent decisions and actions.

7.3 The vendor shall implement non-bypassable governance controls
    that cannot be circumvented by agents.

[... continue for all criteria]
```

---

## Framework Attribution

This scorecard operationalizes enterprise AI governance principles based on the published research and public statements of **Tracy Bannon**, Senior Principal Software Architect and Researcher at MITRE Corporation, where she leads the ArchAITecture initiative and AI research collaborations (A²RC) focused on integrating AI into the software development lifecycle.

> **Note:** This interpretation was compiled by Equilateral AI from publicly available sources. It is not written or endorsed by Tracy Bannon or MITRE.

### The Bannon Framework

Tracy Bannon envisions an "agentic future" where AI systems evolve from tools to teammates — active participants in software development. But she's equally clear that this future requires **governance infrastructure**, not just better models.

> "AI should be treated not as magic, but as software and data — meaning it must be governed by proper software architecture and engineering practices, not guesswork."

> "Organizations must establish 'control towers' for AI — treating agents as organizational resources that need management and accountability, rather than as uncontrolled experiments."

> "Traceability over blind trust."

### The Three Pillars

To manage fleets of AI agents at scale, Bannon identifies three critical governance factors:

| Pillar | Requirement |
|--------|-------------|
| **Interoperability** | Avoid vendor lock-in; ensure agents work across different tools and platforms |
| **Observability** | Complete visibility into agent actions and decisions (monitorable, auditable) |
| **Governance** | Strict controls over data access and permissions; enforced policies |

### Calibrated Trust

Bannon advocates for "calibrated trust" — knowing when to trust AI output and when to intervene. This means:

- Human/machine teaming at the code level
- Checkpoints for human review
- Automated validation pipelines
- AI fluency training for teams

> "We don't just need people who use AI. We need people who design for AI and with AI."

### The Infrastructure Imperative

Bannon notes that "the agentic future isn't coming — it's already here," with organizations running thousands of AI agents in production. But she warns that success requires more than sophisticated models:

> "Realizing this future at scale will require more than just sophisticated AI models; it demands new infrastructure, frameworks, and cultural shifts."

This scorecard is part of that infrastructure — providing objective criteria to evaluate whether platforms are ready for governed agentic operations.

### Sources

- [Tracy Bannon on LinkedIn](https://www.linkedin.com/in/tracylbannon/)
- [Research on the Human/Machine Frontier](https://devops.com/research-on-the-human-machine-frontier-unleashing-generative-ai-in-software-engineering/) (DevOps.com)
- [MITRE ArchAITecture Initiative](https://www.mitre.org/)
- All Day DevOps 2024 — AI in SDLC presentation

---

## Versioning

| Version | Date | Changes |
|---------|------|---------|
| v1.0 | January 2026 | Initial release |

We anticipate updates as enterprise AI governance practices mature. Major version changes will reflect significant criteria additions or modifications.

---

## Contributing

This scorecard is intended to serve the industry. Contributions are welcome:

- **Suggest criteria** — Open an issue with proposed additions
- **Share assessments** — PRs with anonymized vendor assessments help establish benchmarks
- **Report ambiguities** — If criteria are unclear, help us improve the language
- **Translations** — Help make this accessible globally

See [CONTRIBUTING.md](CONTRIBUTING.md) for guidelines.

---

## License

This work is licensed under [Creative Commons Attribution 4.0 International (CC BY 4.0)](https://creativecommons.org/licenses/by/4.0/).

**You are free to:**
- Share — copy and redistribute in any medium or format
- Adapt — remix, transform, and build upon the material for any purpose

**Under the following terms:**
- **Attribution** — You must give appropriate credit, provide a link to the license, and indicate if changes were made.

### How to Attribute

**Full citation:**
```
Agent Governance Scorecard v1.0, Equilateral AI, 2026.
https://github.com/Equilateral-AI/agent-governance-scorecard
```

**Short citation:**
```
Based on the Agent Governance Scorecard by Equilateral AI
```

---

## About

The Agent Governance Scorecard is developed and maintained by [Equilateral AI](https://equilateral.ai), a governed AI agent orchestration platform.

We built this scorecard because we needed objective criteria to evaluate our own platform — and found nothing comprehensive existed. We're releasing it publicly because the industry needs shared standards for AI agent governance.

**This is not a marketing document.** Use it to evaluate us. Use it to evaluate our competitors. Use it to evaluate your own internal platforms. The goal is better governance across the industry.

---

## Related Resources

- [Tracy Bannon on LinkedIn](https://www.linkedin.com/in/tracylbannon/) — Framework source
- [MITRE AI Research](https://www.mitre.org/) — Enterprise AI governance research
- [NIST AI Risk Management Framework](https://www.nist.gov/itl/ai-risk-management-framework) — Complementary standards

---

## Questions?

- **Issues:** [GitHub Issues](https://github.com/Equilateral-AI/agent-governance-scorecard/issues)
- **Email:** scorecard@equilateral.ai
- **Web:** [equilateral.ai/scorecard](https://equilateral.ai/scorecard)
