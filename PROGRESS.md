# Contribution progress

**Verified snapshot: 2026-10-05.** This register captures our AgentBaseline contributions, our proposals in this repository, and the follow-up work created by external responses. It is a progress record, not a disposition log or a change to normative criteria.

The v1.1 proposal window is open against published v1.0, with a proposed close of 2026-11-30. The README announcement was published in [commit 559807f](https://github.com/Equilateral-AI/agent-governance-scorecard/commit/559807f8db41576ccaaeb4bd332b0efce670c002). [Window announcement](https://github.com/Equilateral-AI/agent-governance-scorecard/issues/3).

## Our issues in this repository

| Issue | Progress | Remaining work |
|---|---|---|
| [#3 Public comment period](https://github.com/Equilateral-AI/agent-governance-scorecard/issues/3) | Filed September 29; open; README now explicitly announces the window and provides participation links. | Maintain announced dates and publish dispositions through the contribution process. |
| [#4 Observability evidence field set](https://github.com/Equilateral-AI/agent-governance-scorecard/issues/4) | Filed September 29 by JamesFordAI; open. Cross-linked from AgentBaseline #26 and #33. September 30 external comment adds commitment timing. | Deliver the promised field set/crosswalk and address the timing proposal; no criterion change or adoption yet. |

The [timing comment on #4](https://github.com/Equilateral-AI/agent-governance-scorecard/issues/4#issuecomment-5902785102) asks for independently checkable pre-outcome commitment. Hashes and operator timestamps alone do not establish that ordering. Draft assessment wording must distinguish decision records committed before action from outcome records produced afterward.

## AgentBaseline contributions

All five proposals authored by JamesFordAI are filed and remain open. The current AgentBaseline README still labels the baseline v1.0-draft and lists 2026-09-30 as the comment closing date. That advertised date has passed; open issues do not establish an extended window or adoption. [Current baseline status](https://github.com/agentbaseline/agentbaseline#readme).

| Proposal | Filed UTC | Verified thread status | Follow-up |
|---|---|---|---|
| [#29 Earned authority with regression](https://github.com/agentbaseline/agentbaseline/issues/29) | 2026-08-19 | Open; no comments | Await maintainer direction; retain the proposed authority-contraction evidence requirement. |
| [#32 Adversarial validation](https://github.com/agentbaseline/agentbaseline/issues/32) | 2026-09-09 | Open; no comments | Prepare a scenario-to-control mapping if requested. |
| [#33 Versioned open evidence schema](https://github.com/agentbaseline/agentbaseline/issues/33) | 2026-09-10 | Open; external response and our September 29 reply | Draft the field set and answer the proposed verification-corpus question directly. |
| [#37 Decision provenance](https://github.com/agentbaseline/agentbaseline/issues/37) | 2026-09-15 | Open; no comments | Keep decision context, alternatives, confidence and handoff survival in the schema mapping. |
| [#39 Behavioral drift and rollback](https://github.com/agentbaseline/agentbaseline/issues/39) | 2026-09-21 | Open; no comments | Await maintainer direction; preserve drift response and tested rollback as distinct properties. |

No adoption is confirmed in these reviewed threads. Proposed identifiers are not adopted controls.

## Evidence schema collaboration

[AgentBaseline #26](https://github.com/agentbaseline/agentbaseline/issues/26) is an external contribution by imran-siddique, not one of our five filings. Our participation has progressed from discussion to an explicit field-set commitment:

- **September 15:** We distinguished integrity from completeness and asked for independent reconciliation plus explicit verification limits. [Our contribution](https://github.com/agentbaseline/agentbaseline/issues/26#issuecomment-5678876741).
- **September 22:** We offered a minimal versioned field set mapped against admission receipts and context-provenance artifacts, with record integrity and claim verifiability kept separate. [Field-set offer](https://github.com/agentbaseline/agentbaseline/issues/26#issuecomment-5775264626), [follow-up commitment](https://github.com/agentbaseline/agentbaseline/issues/26#issuecomment-5782953584).
- **September 25:** babyblueviper1 pointed to real signed fixtures and TRACE proposals [#397](https://github.com/agentrust-io/trace-spec/issues/397) and [#398](https://github.com/agentrust-io/trace-spec/issues/398). The response says we need not wait for TRACE adoption to draft. It also distinguishes faithful issuer-claim restatement from relevance/truth, and chain integrity from completeness without an external checkpoint. [Artifact handoff](https://github.com/agentbaseline/agentbaseline/issues/26#issuecomment-5840590770).
- **September 28:** astrogilda offered to map our draft to the vocabulary terms for observation vantage, coverage denominator and declared non-guarantees. [Mapping offer](https://github.com/agentbaseline/agentbaseline/issues/26#issuecomment-5880933376).
- **September 29:** We linked the resulting evidence-field proposals in the Equilateral and Raknor repositories. [#26 reply](https://github.com/agentbaseline/agentbaseline/issues/26#issuecomment-5888210913), [#33 reply](https://github.com/agentbaseline/agentbaseline/issues/33#issuecomment-5888352039).

The concrete source artifacts are available: [signed fixtures and checker](https://github.com/babyblueviper1/preaction-governance-conformance/tree/main/examples/trace-v20-fixtures), [agent-evidence-vocabulary](https://github.com/probityai/agent-evidence-vocabulary), [agent-evidence-vectors](https://github.com/probityai/agent-evidence-vectors), and [in-toto crosswalk](https://github.com/astrogilda/agentbaseline/blob/crosswalk/in-toto/crosswalks/in-toto.yaml). Their existence was checked. Contributor-reported test results and cryptographic proofs were not independently rerun for this progress record.

**Outstanding commitment:** Publish the candidate field set and crosswalk against both concrete record shapes. Separate record integrity, claim verifiability, coverage, observation independence and timing; each must carry its own limits. Delivery of the field set remains pending. The concrete artifacts are available, so waiting for formal TRACE adoption is not a current blocker.

**Outstanding question:** [The response on #33](https://github.com/agentbaseline/agentbaseline/issues/33#issuecomment-5880855093) asks whether a verifier passing agent-evidence-vectors could satisfy OBS-07's evidence line. Our reply acknowledged the corpus and linked the field proposals but did not settle that question. Next work is a corpus-to-requirement matrix covering integrity, omission/coverage, governance context, schema version and refusal behavior. Passing some vectors must not be presented as proof of every proposed property.

## Other proposals and review progress

- [#2 Human oversight worksheet](https://github.com/Equilateral-AI/agent-governance-scorecard/issues/2) is an external proposal by Hirakhyzer. It has been reviewed as a useful non-normative companion; author follow-up and the offered draft remain pending. No acceptance or public maintainer acknowledgment has been issued.
- [PR #1 GFT reconciliation](https://github.com/Equilateral-AI/agent-governance-scorecard/pull/1) remains open. It changes normative text and contains a separately flagged scoring-framing question. It has not been merged during the proposal window. Public CONTRIBUTING.md excludes normative-text PR merges during this phase.
- The linked [Raknor evidence-field proposal #2](https://github.com/raknor-ai/agent-governance-standard/issues/2) needs a reference correction: OBS-06 belongs to AgentBaseline; Raknor's published controls are SC-OB-01 through SC-OB-05. The two repositories need compatible vocabulary but separate dispositions. [Raknor progress](https://github.com/raknor-ai/agent-governance-standard/blob/main/PROGRESS.md).

## Next deliverables

1. Draft a format-neutral field set with examples and explicit non-guarantees, mapped to the available receipt and claim-verifiability artifacts.
2. Crosswalk the field set to the scorecard's Observability and Decision Integrity dimensions and the Raknor published control IDs.
3. Prepare the verification-corpus matrix and before/after-outcome timing vectors; record independently rerun results separately from contributor reports.
4. Acknowledge and discuss proposals in their issue threads, then publish dispositions under the contribution process. No contributor messages were sent as part of this documentation update.

Verification used current GitHub issue bodies/comments, author identities, public README text and artifact listings. This snapshot does not independently verify live implementations, runtime effects or cryptographic anchoring proofs. Update it with dated evidence links when a deliverable is published, a substantive response arrives or a disposition is issued.
