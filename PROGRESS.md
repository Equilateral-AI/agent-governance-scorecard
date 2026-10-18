# Contribution progress

**Verified snapshot: 2026-10-18.** This register captures our AgentBaseline contributions, our proposals in this repository, and the follow-up work created by external responses. It is a progress record, not a disposition log or a change to normative criteria.

The v1.1 proposal window is open against published v1.0, with a proposed close of 2026-11-30. The README announcement was published in [commit 559807f](https://github.com/Equilateral-AI/agent-governance-scorecard/commit/559807f8db41576ccaaeb4bd332b0efce670c002). [Window announcement](https://github.com/Equilateral-AI/agent-governance-scorecard/issues/3).

## Our issues in this repository

| Issue | Progress | Remaining work |
|---|---|---|
| [#3 Public comment period](https://github.com/Equilateral-AI/agent-governance-scorecard/issues/3) | Filed September 29; open; README now explicitly announces the window and provides participation links. | Maintain announced dates and publish dispositions through the contribution process. |
| [#4 Observability evidence field set](https://github.com/Equilateral-AI/agent-governance-scorecard/issues/4) | Filed September 29 by JamesFordAI; open. Cross-linked from AgentBaseline #26 and #33. September 30 and October 18 external comments develop commitment timing and rubric mapping. | Deliver the promised field set/crosswalk and address the timing proposal; no criterion change or adoption yet. |
| [#5 Independently verifiable evidence (SC-3.4)](https://github.com/Equilateral-AI/agent-governance-scorecard/issues/5) | Filed October 18. Extends SC-3.3 to require external verifiability. Cross-references AgentBaseline #26, #33, and the `commitment_anchor` / `agent-evidence-vocabulary` collaboration. | Evaluate during v1.1 window; align with evidence field set (#4) and the verification-corpus matrix. |
| [#6 Identity assurance recorded (SC-3.5)](https://github.com/Equilateral-AI/agent-governance-scorecard/issues/6) | Filed October 18. Requires evidence records to include identity verification method and strength. Cross-references AgentBaseline #50. | Evaluate during v1.1 window; consider interaction with SC-5.4 (earned autonomy depends on identity continuity). |
| [#7 Cumulative authority evaluation (SC-4.6)](https://github.com/Equilateral-AI/agent-governance-scorecard/issues/7) | Filed October 18. Requires authorization to consider prior actions in the same run. Cross-references AgentBaseline #44 and Proof-of-Control 4.1.7/4.1.8. | Evaluate during v1.1 window; design test method for sequence-based refusal. |
| [#8 Pre-deployment and periodic adversarial testing (SC-4.7)](https://github.com/Equilateral-AI/agent-governance-scorecard/issues/8) | Filed October 18. Addresses the scorecard's zero coverage of the baseline Validate outcome (VAL-01, VAL-02, VAL-04). Cross-references Raknor Adversarial Resilience domain. | Evaluate during v1.1 window; consider whether this belongs in Governance Enforcement or warrants a new dimension. |
| [#9 Agent-output assurance (SC-3.6)](https://github.com/Equilateral-AI/agent-governance-scorecard/issues/9) | Filed October 18. Requires agent-produced artifacts to meet human-equivalent security, quality and licensing standards. Cross-references AgentBaseline VAL-03 — the last unmapped baseline control. | Evaluate during v1.1 window; distinct from SC-4.7 (tests the agent) — this tests the output. |

The [timing comment on #4](https://github.com/Equilateral-AI/agent-governance-scorecard/issues/4#issuecomment-5902785102) asks for independently checkable pre-outcome commitment. Hashes and operator timestamps alone do not establish that ordering. Draft assessment wording must distinguish decision records committed before action from outcome records produced afterward. The October 18 rubric-mapping comment proposes a three-tier scoring (silence → declared limitation → full precedence) which aligns with the `does_not_assert` pattern from both the `commitment_anchor` proposal and `agent-evidence-vocabulary`.

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

## Crosswalk

A scorecard-to-baseline crosswalk (`crosswalks/equilateral-scorecard.yaml`) has been submitted as a PR to the AgentBaseline repository, per their CONTRIBUTING.md request for external crosswalk contributions. It maps all 25 scorecard criteria to the 35 baseline controls with gap annotations in both directions. Filed October 18.

A Raknor standard-to-baseline crosswalk (`crosswalks/raknor-standard.yaml`) has also been submitted. It maps all 26 Raknor controls (SC-AG-01–06, SC-OB-01–05, SC-IO-01–04, SC-SR-01–06, SC-AD-01–05) and 7 mandatory failure conditions to the 35 baseline controls, with strength ratings and gap annotations. Includes reverse gaps identifying 15 baseline controls with no Raknor equivalent — primarily in Discover and Respond outcomes. Filed October 18.

## Evidence schema collaboration

[AgentBaseline #26](https://github.com/agentbaseline/agentbaseline/issues/26) is an external contribution by imran-siddique, not one of our five filings. Our participation has progressed from discussion to an explicit field-set commitment:

- **September 15:** We distinguished integrity from completeness and asked for independent reconciliation plus explicit verification limits. [Our contribution](https://github.com/agentbaseline/agentbaseline/issues/26#issuecomment-5678876741).
- **September 22:** We offered a minimal versioned field set mapped against admission receipts and context-provenance artifacts, with record integrity and claim verifiability kept separate. [Field-set offer](https://github.com/agentbaseline/agentbaseline/issues/26#issuecomment-5775264626), [follow-up commitment](https://github.com/agentbaseline/agentbaseline/issues/26#issuecomment-5782953584).
- **September 25:** babyblueviper1 pointed to real signed fixtures and TRACE proposals [#397](https://github.com/agentrust-io/trace-spec/issues/397) and [#398](https://github.com/agentrust-io/trace-spec/issues/398). The response says we need not wait for TRACE adoption to draft. It also distinguishes faithful issuer-claim restatement from relevance/truth, and chain integrity from completeness without an external checkpoint. [Artifact handoff](https://github.com/agentbaseline/agentbaseline/issues/26#issuecomment-5840590770).
- **September 28:** astrogilda offered to map our draft to the vocabulary terms for observation vantage, coverage denominator and declared non-guarantees. [Mapping offer](https://github.com/agentbaseline/agentbaseline/issues/26#issuecomment-5880933376).
- **September 29:** We linked the resulting evidence-field proposals in the Equilateral and Raknor repositories. [#26 reply](https://github.com/agentbaseline/agentbaseline/issues/26#issuecomment-5888210913), [#33 reply](https://github.com/agentbaseline/agentbaseline/issues/33#issuecomment-5888352039).
- **October 12:** babyblueviper1 posted OBS-06 draft text and 6 conformance vectors (CC0) on the standard side, adding `anchor_time_tolerance_s` to handle mechanism clock skew. [Draft and vectors](https://github.com/babyblueviper1/preaction-governance-conformance/tree/a2949a7/examples/commitment-anchor-obs06). We reviewed on October 18, noting digest-rule portability and the interaction with `observation_vantage`. [Our reply](https://github.com/raknor-ai/agent-governance-standard/issues/2#issuecomment-6248770726).
- **October 18:** astrogilda commented on standard #2, aligning `agent-evidence-vocabulary v0.4.0` terms with our witness architecture. We responded with a mapping table and invited joint review of OBS-06 alongside the vocabulary's dimensions. [Our reply](https://github.com/raknor-ai/agent-governance-standard/issues/2#issuecomment-6248771445). babyblueviper1's rubric mapping on scorecard #4 (three-tier scoring: silence → declared limitation → full precedence) was acknowledged with a proposed rubric treatment. [Our reply](https://github.com/Equilateral-AI/agent-governance-scorecard/issues/4#issuecomment-6248771605).

The concrete source artifacts are available: [signed fixtures and checker](https://github.com/babyblueviper1/preaction-governance-conformance/tree/main/examples/trace-v20-fixtures), [agent-evidence-vocabulary](https://github.com/probityai/agent-evidence-vocabulary), [agent-evidence-vectors](https://github.com/probityai/agent-evidence-vectors), and [in-toto crosswalk](https://github.com/astrogilda/agentbaseline/blob/crosswalk/in-toto/crosswalks/in-toto.yaml). Their existence was checked. Contributor-reported test results and cryptographic proofs were not independently rerun for this progress record.

**Outstanding commitment:** Publish the candidate field set and crosswalk against both concrete record shapes. Separate record integrity, claim verifiability, coverage, observation independence and timing; each must carry its own limits. Delivery of the field set remains pending. The concrete artifacts are available, so waiting for formal TRACE adoption is not a current blocker.

**Outstanding question:** [The response on #33](https://github.com/agentbaseline/agentbaseline/issues/33#issuecomment-5880855093) asks whether a verifier passing agent-evidence-vectors could satisfy OBS-07's evidence line. Our reply acknowledged the corpus and linked the field proposals but did not settle that question. Next work is a corpus-to-requirement matrix covering integrity, omission/coverage, governance context, schema version and refusal behavior. Passing some vectors must not be presented as proof of every proposed property.

## Other proposals and review progress

- [#2 Human oversight worksheet](https://github.com/Equilateral-AI/agent-governance-scorecard/issues/2) is an external proposal by Hirakhyzer. It has been reviewed as a useful non-normative companion; author follow-up and the offered draft remain pending. No acceptance or public maintainer acknowledgment has been issued.
- [PR #1 GFT reconciliation](https://github.com/Equilateral-AI/agent-governance-scorecard/pull/1) remains open. It changes normative text and contains a separately flagged scoring-framing question. It has not been merged during the proposal window. Public CONTRIBUTING.md excludes normative-text PR merges during this phase.
- The linked [Raknor evidence-field proposal #2](https://github.com/raknor-ai/agent-governance-standard/issues/2) needs a reference correction: OBS-06 belongs to AgentBaseline; Raknor's published controls are SC-OB-01 through SC-OB-05. The two repositories need compatible vocabulary but separate dispositions. [Raknor progress](https://github.com/raknor-ai/agent-governance-standard/blob/main/PROGRESS.md).

## Next deliverables

1. Draft a format-neutral field set with examples and explicit non-guarantees, mapped to the available receipt and claim-verifiability artifacts.
2. ~~Crosswalk the field set to the scorecard's Observability and Decision Integrity dimensions and the Raknor published control IDs.~~ Complete: scorecard-to-baseline and Raknor-to-baseline crosswalks both filed October 18.
3. Prepare the verification-corpus matrix and before/after-outcome timing vectors; record independently rerun results separately from contributor reports.
4. Evaluate the five new proposals (#5, #6, #7, #8, #9) through the v1.1 disposition process. Each cross-references specific AgentBaseline controls; dispositions should note alignment or divergence. #8 and #9 close the last unmapped baseline controls (Validate outcome).
5. Independently rerun babyblueviper1's OBS-06 vectors (`check.py`, 6/6) and record results. The tolerance vector and the modified-record vector are the ones that load-bear on SC-3.4.
6. Acknowledge and discuss proposals in their issue threads, then publish dispositions under the contribution process.

Verification used current GitHub issue bodies/comments, author identities, public README text and artifact listings. This snapshot does not independently verify live implementations, runtime effects or cryptographic anchoring proofs. Update it with dated evidence links when a deliverable is published, a substantive response arrives or a disposition is issued.
