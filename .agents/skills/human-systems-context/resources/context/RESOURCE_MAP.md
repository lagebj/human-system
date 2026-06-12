# Resource Map

This file explains where resources belong and how the skill should be extended.

## `SKILL.md`

Purpose:

- Activation rules.
- Source priority.
- Hard behavior constraints.
- Boundaries between general use and manuscript-specific use.

Keep this file operational and relatively small. Do not paste large conceptual documents into it.

## `resources/source/core_stance/`

Use this for long-lived material that defines the user's stance, identity, principles, and alignment contract.

Current files:

- `personal_alignment.md` — personal context contract around systems, organizations, collaboration, Agile, process theatre, and common-sense operating principles.
- `who_am_i.md` — narrative professional identity and how the user thinks, works, and shapes systems.

Add here when a resource answers:

- How does the user think?
- What should never be flattened into generic advice?
- What long-lived stance must future agents preserve?

## `resources/source/field_patterns/`

Use this for reusable patterns, movement models, operating models, or conceptual contracts that can apply across contexts.

Current files:

- `trojan_horse_movement_pattern.md` — internal movement pattern for modernization in place, capability transfer, and temporary embedded help.

Add here when a resource defines a repeatable way of seeing or moving through work.

## `resources/source/writing_voice/`

Use this for general voice resources that can apply across writing contexts.

Current files:

- `author-voice-guide.md` — spoken thinking in motion; the broad writing voice.

Add here when a resource affects tone, rhythm, language, or how the user's thinking should sound outside strict manuscript work.

## `resources/source/book_work/`

Use this only for manuscript-specific materials.

Current files:

- `writing-working-agreement.md` — binding contract for how the manuscript thinks on the page.
- `EDITING_CHARTER.md` — pass discipline and editing laws for the manuscript.
- `PATTERN_LEDGER.md` — de-patterning rules for manuscript editing.
- `human.md` — current manuscript draft.

Do not place general operating-model material here just because it may later become book material. Put actual source content in `core_stance/` or `field_patterns/`, then let the manuscript draw from it.

## `resources/context/`

Use this for distilled memory and navigational material.

Current files:

- `OPERATING_CONTEXT.md` — distilled cross-domain project knowledge.
- `DOMAIN_MODEL.md` — high-level map of the domains covered by the skill.
- `RESOURCE_MAP.md` — this file.
- `SOURCE_MANIFEST.md` — generated inventory of files.

Add here when the resource summarizes, indexes, or orients. If it becomes a binding source, move it into `resources/source/`.

## `resources/playbooks/`

Use this for repeatable workflows.

Current files:

- `strategy-response-workflow.md` — operating-model, enablement, vendor, governance, and leadership responses.
- `technical-strategy-workflow.md` — platform/EMS technical-strategy responses.
- `coaching-matchboard-workflow.md` — youth football, Matchboard, team planning, and coaching communication.
- `coding-agent-workflow.md` — prompt structure for coding agents.
- `writing-voice-workflow.md` — general writing in the user's voice.
- `book-manuscript-workflow.md` — manuscript drafting/recomposition/export.
- `editing-passes.md` — manuscript editing pass workflow.

Add here when the resource describes how to perform a task.

## `resources/templates/`

Use this for copy-paste integration helpers.

Current files:

- `AGENTS_SNIPPET.md` — snippet to include in global or repo-specific `AGENTS.md`.

Add here for prompt shells, AGENTS snippets, or reusable instruction blocks.

## Placement decision table

| Resource type | Put it here | Example |
| --- | --- | --- |
| Long-lived belief / stance | `resources/source/core_stance/` | Personal alignment contract |
| Reusable movement pattern | `resources/source/field_patterns/` | Trojan Horse pattern |
| General writing voice | `resources/source/writing_voice/` | Author voice guide |
| Manuscript-specific law | `resources/source/book_work/` | Editing charter, pattern ledger |
| Current manuscript | `resources/source/book_work/` | `human.md` |
| Distilled memory | `resources/context/` | EMS/Matchboard/youth football context |
| Reusable workflow | `resources/playbooks/` | Coding-agent prompt workflow |
| Integration helper | `resources/templates/` | `AGENTS_SNIPPET.md` |

## Update rule

When adding new material:

1. Decide whether it is canonical source, distilled context, workflow, or template.
2. Place it in the narrowest correct folder.
3. Update `OPERATING_CONTEXT.md` if it changes cross-domain project memory.
4. Update `DOMAIN_MODEL.md` if it changes the conceptual map.
5. Regenerate or update `SOURCE_MANIFEST.md`.
6. Keep book/manuscript-specific instructions isolated under `book_work/`.
