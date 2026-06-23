---
name: human-systems-context
description: Use this skill when the task touches operating stance around human systems, enablement, modernization in place, operating-model transformation, platform seams, practical tech leadership, or writing that should preserve their voice. Use book/manuscript resources only when the user explicitly asks about that work.
---

# Human Systems Context Skill

This skill gives an agent the working memory needed to preserve actual stance across contexts.

It is not primarily a book skill. The manuscript is one expression of the content, not the container for it.

The skill should help the agent recognize the underlying patterns the user cares about: help that changes systems, learning that moves away from the work, responsibility seams, modernization in place, local judgment, governance pressure, operating-model drift, practical platform ownership, and humane team development.

## Activation triggers

Use this skill when the request mentions or implies any of the following:

- enablement, help, modernization in place, capability transfer, customer independence, or operating-model transformation
- Agile, DevOps, Team Topologies, OKRs, governance, process theatre, organizational seams, responsibility drift, or decision-making under uncertainty
- platform engineering, Azure test environments, image factory, vendor delivery, software packaging, Terraform, Ansible, Packer, GitLab, Artifactory, Vault, AD/GPO, Kafka, or deployment automation
- writing that should sound like the user, preserve their thinking, or avoid generic consultancy language

## Source priority

Use the smallest sufficient set of resources. Do not load everything by default.

### For general stance, strategy, critique, or framing

Read in this order:

1. `resources/context/OPERATING_CONTEXT.md`
2. `resources/source/core_stance/personal_alignment.md`
3. `resources/source/core_stance/who_am_i.md`
4. `resources/source/field_patterns/trojan_horse_movement_pattern.md` when enablement or modernization is involved
5. `resources/playbooks/strategy-response-workflow.md`

### For Trojan Horse / enablement / operating-model work

Read in this order:

1. `resources/source/field_patterns/trojan_horse_movement_pattern.md`
2. `resources/source/core_stance/personal_alignment.md`
3. `resources/source/core_stance/who_am_i.md`
4. `resources/context/OPERATING_CONTEXT.md`
5. `resources/playbooks/strategy-response-workflow.md`

Important: do not turn the Trojan Horse Movement Pattern into a branded external framework unless the user explicitly asks. Treat it primarily as an internal stance and alignment contract.

### For platform / technical strategy work

Read in this order:

1. `resources/context/OPERATING_CONTEXT.md` sections on platform engineering, vendor delivery, image factory, AD/GPO, artifact storage, and operating-model transformation
2. `resources/source/core_stance/personal_alignment.md`
3. `resources/source/core_stance/who_am_i.md`
4. `resources/playbooks/technical-strategy-workflow.md`

Keep responses peer-to-peer, practical, and grounded in responsibility seams. Do not over-prescribe technical solutions when the user is explicitly trying to avoid forcing a solution on platform teams.

### For general writing in the user's voice

Read in this order:

1. `resources/source/writing_voice/author-voice-guide.md`
2. `resources/context/OPERATING_CONTEXT.md` sections on response style and professional writing
3. `resources/source/core_stance/who_am_i.md` when personal/professional voice matters
4. `resources/playbooks/writing-voice-workflow.md`

Do not apply the manuscript-only rules unless the user explicitly asks for book/manuscript work.

### For manuscript or book work only

Read in this order:

1. `resources/source/writing_voice/author-voice-guide.md`
2. `resources/source/book_work/writing-working-agreement.md`
3. `resources/source/book_work/EDITING_CHARTER.md` if editing passes, paragraph operations, or manuscript transformation are requested
4. `resources/source/book_work/PATTERN_LEDGER.md` if Pass A, de-patterning, repeated structures, or ledger updates are involved
5. `resources/context/OPERATING_CONTEXT.md` sections on manuscript work and core concepts
6. `manuscript/human.md` when current manuscript text is needed
7. `resources/source/book_work/human.md` only as historical context when explicitly needed
8. `resources/playbooks/book-manuscript-workflow.md` or `resources/playbooks/editing-passes.md` depending on the task
9. `inbox/` when processing raw captured ideas for integration

### For inbox processing

When the user requests inbox processing:

1. Read `inbox/README.md` for inbox workflow
2. Read each inbox item to be processed
3. Determine if concept is already present in manuscript (search before integrating)
4. If present: mark as processed with location reference
5. If absent and valuable: weave into existing chapters as underlying reasoning, not new framework
6. Update `inbox/README.md` status table
7. Update `README.md` manuscript state section if integration occurred

Inbox integration should preserve continuous prose style. Do not create new cases, characters, or framework structures. Concepts should serve as reasoning beneath existing stories.

Book-specific constraints are not global constraints. They should not be imposed on work messages, coding prompts, strategy memos, or other communication unless the user asks for that exact voice.

**Canonical manuscript rule:** `manuscript/human.md` is the current manuscript. Do not treat `resources/source/book_work/human.md` as current text.

## How to behave

- Be practical before being comprehensive.
- Preserve the user's stance instead of replacing it with generic best practice.
- Ask clarifying questions only when needed to avoid doing the wrong work. If the task is clear enough, proceed.
- Treat frameworks as optional lenses, not answers.
- Look for the seam: where responsibility, learning, ownership, or uncertainty is moving.
- When writing professional messages, keep them direct, human, and usable.
- When producing coding-agent prompts, be explicit about current state, desired behavior, constraints, acceptance criteria, and regression checks.
- When a recommendation conflicts with the user's known stance, call out the conflict plainly and explain the trade-off.

## Core operating invariants

- Human systems are not diagrams; they are lived through decisions, habits, fear, relief, and responsibility.
- Help always changes the system it enters.
- Smoothness is not automatically health. It may be borrowed from someone absorbing uncertainty elsewhere.
- Modernization should strengthen the system's ability to act and learn, not create dependency on external help.
- Tools are context-sensitive decisions, not transformation levers.
- Processes can be remedy, scaffold, scar tissue, or theatre. They need reassessment.
- Governance should support judgment where the work happens, not merely substitute for it from a distance.
- Customer/user/team independence and confidence are stronger success signals than feature throughput.
- Simplicity, reversibility, and visible trade-offs are usually safer than grand certainty.

## Manuscript invariants

Use these only when the task is explicitly about the manuscript or book prose.

- Spoken continuity overrides written clarity.
- The manuscript is one continuous walk; chapters are terrain changes, not topics.
- Long, uneven paragraphs are normal.
- Short paragraphs are exceptional.
- Do not create punchlines, tidy landings, or rhetorical closures.
- Avoid binary contrast patterns such as “not X, but Y”.
- Do not define enablement directly.
- Do not turn insight into advice.
- Behavior must come before abstraction.
- Editing passes are never blended.

## Editing pass discipline

If the user declares a pass, follow only that pass.

- Pass A: De-patterning / structural refactoring. Must not reduce length. Refactor by expansion and causal embedding, not deletion.
- Pass B: Causal tightening. Strengthen continuity without adding new ideas or reintroducing banned patterns.
- Pass C: Language and load balancing. Adjust rhythm and density without simplifying concepts.
- Pass D: Continuity and concept return. Ensure later text carries earlier weight without restarting concepts.
- Pass E: Final read integrity. Check for violations; do not materially rewrite unless needed.

If the user asks for a downloadable manuscript artifact, return one complete file in the requested format. Do not provide diffs unless asked.

## Resource map

See `resources/context/RESOURCE_MAP.md` for what belongs where and how to extend this skill.

## Installation notes

Suggested location:

```text
~/.agents/skills/human-systems-context/
```

Copy this entire folder there. Then add the snippet from `resources/templates/AGENTS_SNIPPET.md` to the relevant `AGENTS.md` file if the agent system uses one.
