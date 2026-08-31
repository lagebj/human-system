---
name: human-systems-context
description: Use when the task touches the repository's body of thought about understanding and intervening responsibly in human systems when the right action depends on context — including operating-model, modernization-in-place, enablement, platform-seam, practical tech-leadership reasoning, and writing that should preserve the author's voice. Route by ADR 002 task class. Load manuscript resources only when the user explicitly asks for manuscript work.
---

# Human Systems Context Skill

This skill routes an agent to the smallest sufficient context for the task. It
does not restate the thinking; it points at the sources that hold it.

The repository is the working home for an evolving body of thought about human
systems, context, intervention, relationships, judgment, abstraction, learning,
control, and change. The book manuscript is one possible future synthesis, not
the container for the content. Shorter papers are the near-term testing vehicle.

Two kinds of authority (ADR 002 §2):

- **Operational** — `AGENTS.md`, `SKILL.md`, `docs/decisions/`,
  `docs/current-state.md`, the playbooks, and `resources/source/book_work/` when
  manuscript work is active. These may govern work.
- **Intellectual** — everything else under `resources/source/` and
  `resources/context/`. These inform reasoning. They are provisional and open to
  revision. Do not treat them as binding because of where they are filed.

## Behaviour

- Use the smallest sufficient context. Do not load everything by default. Do not
  load manuscript resources for non-manuscript work.
- Preserve the author's stance instead of substituting generic consulting best
  practice.
- Treat prior resemblance as a source of hypotheses, not automatic prescription.
  "It depends, therefore identify what it depends upon."
- Treat the Trojan Horse Movement Pattern as one applied pattern with boundary
  conditions, not the governing theory. Do not brand or foreground it unless
  asked.
- Preserve tension and uncertainty where the conceptual model is unsettled. Do
  not manufacture coherence.
- Ask clarifying questions only when needed to avoid doing the wrong work.

## Routing by task class (ADR 002 §4)

`.agents/workflow.json` is authoritative for which skills each class requires,
which are conditional, and which are excluded. The sections below say which
*context files* to read for each class. Load skills per `workflow.json`; read
sources per here.

### Class 1 — Repository / Tooling

devcontainer, skills, instructions, automation, repo structure, workflow config.

1. `docs/current-state.md`
2. `docs/decisions/002-repository-operating-model-and-source-authority.md`
3. `resources/playbooks/working-session.md`
4. `resources/context/RESOURCE_MAP.md` when placing or moving files

Manuscript must not be materially edited. Intellectual content changes only when
directly required.

### Class 2 — Concept Development

Capture an observation, develop a proposition, connect concepts, identify a
contradiction, evolve the body of thought.

1. `resources/source/core_stance/contextual-intervention.md`
2. `resources/source/core_stance/personal_alignment.md` and `who_am_i.md` when
   stance or identity is in play
3. `resources/source/field_patterns/` when the observation is about enablement,
   modernization-in-place, or the impulse to help
4. `resources/context/OPERATING_CONTEXT.md` for prior project memory

Place new conceptual material per `RESOURCE_MAP.md`. Manuscript untouched unless
explicitly requested. Manuscript voice is not required.

### Class 3 — Research / Pressure Testing

Compare an idea with established theory, search for counterexamples, find
boundary conditions, ask what would falsify a claim, separate observation from
inference.

1. `resources/source/core_stance/contextual-intervention.md` (see its
   "Relationship to established traditions" section)
2. The specific source file holding the claim under test
3. `resources/playbooks/strategy-response-workflow.md` if the claim is about
   operating-model or enablement work

Evidence should be able to challenge the model, not decorate it. No automatic
manuscript changes.

### Class 4 — Paper Development

Plan, draft, revise, source-check, challenge a narrow paper.

1. `resources/source/core_stance/contextual-intervention.md` for current thinking
2. `resources/source/writing_voice/author-voice-guide.md` for voice
3. `resources/playbooks/writing-voice-workflow.md`
4. The source files relevant to the paper's subject

Use `author-voice-guide.md` for tone and rhythm, not as a ban on explanation: a
paper may state propositions directly, explain reasoning, cite literature,
discuss counterexamples, distinguish observation from hypothesis, and expose
uncertainty. Do **not** load the manuscript-only Writing Working Agreement,
Editing Charter, or Pattern Ledger. Development is not publication.

### Class 5 — Manuscript Work

Diagnosis, bounded editorial pass, rewrite, or integration into
`manuscript/human.md`. **Explicit user request required.**

1. `resources/source/writing_voice/author-voice-guide.md`
2. `resources/source/book_work/writing-working-agreement.md`
3. `resources/source/book_work/EDITING_CHARTER.md` for a bounded pass
4. `resources/source/book_work/PATTERN_LEDGER.md` for de-patterning / pass work
5. `manuscript/human.md` for current text;
   `resources/source/book_work/human.md` is a stale snapshot, context only
6. `resources/playbooks/book-manuscript-workflow.md` or
   `resources/playbooks/editing-passes.md`
7. ADR 001's Pass A–E table and Isolated Pass Rule for how a declared pass runs

Manuscript prose constraints (spoken continuity, long uneven paragraphs, no
tidy landings, no "not X but Y", no direct definition of enablement, behaviour
before abstraction, one pass at a time, never blended) apply **only here**.

### Class 6 — Publication Preparation

Copy edit, references, metadata, formatting, publication readiness, website
preview preparation. Preparation does not grant permission to publish.

### Class 7 — Publication

Deliberately expose a specific artifact as public website content. Requires an
explicit instruction naming the artifact. Never inferred from "prepare",
"finish", "review", or "looks ready".

## Resource map

`resources/context/RESOURCE_MAP.md` — where material belongs and how to extend
the skill.
