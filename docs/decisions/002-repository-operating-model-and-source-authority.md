# Decision Record: Repository Operating Model and Source Authority

**Date:** 2026-08-31
**Status:** Accepted
**Supersedes:** `001-editorial-workflow-and-source-authority.md` (repository-wide authority model; the manuscript editing-pass mechanics in ADR 001 remain available for manuscript work)
**Superseded by:** None

---

## Problem

ADR 001 solved real problems for a repository that behaved as though its main
output was a book and its main activity was editing that book. That is no longer
an accurate description of the project.

The repository has become the working home for an evolving body of thought about
understanding and intervening responsibly in human systems when the right action
depends on context. The book manuscript is one possible future expression of
that thinking, not the centre of it. Shorter papers are expected to be the
nearer-term way of testing ideas.

Under ADR 001 the repository still assumes:

1. The book is the primary output.
2. Enablement is close to the conceptual centre.
3. Manuscript editing is the default form of work.
4. Task classification is predominantly editorial (Classes A–E).
5. A repository-wide editorial-pass workflow is the operating model.
6. `docs/current-state.md` tracks manuscript-pass state rather than project state.
7. Anything under `resources/source/` or labelled "canonical" reads as binding
   truth, including material that is really an evolving intellectual proposition.
8. Operational facts and intellectual claims are not clearly distinguished.
9. Documentation-update rules encourage several documents to move together after
   any change.
10. The Trojan Horse Movement Pattern carries near-universal prescriptive weight.

This ADR replaces the repository-wide operating model. It does not delete ADR
001, rewrite its history, or remove the editing-pass mechanics that manuscript
work still uses.

---

## Decision

### 1. Repository purpose

The repository preserves and evolves a body of thought about human systems,
context, intervention, relationships, judgment, abstraction, learning, control,
and change. It supports:

- concept development and pressure-testing of that thinking
- shorter papers as the near-term testing vehicle
- the existing book manuscript as a preserved, possible future synthesis
- operating-model, modernization, enablement, platform, and consulting reasoning
  that draws on the same thinking
- coding-agent prompt generation where project context matters

It must not become a generic prompt collection, a generic style guide for every
repository, a personal knowledge base dump, a book-only workspace, or a
collection of one-off chat artifacts with no source hierarchy.

### 2. Two kinds of authority

The repository distinguishes two kinds of authority. The distinction is
structural, not a labelling exercise. Do not tag individual sentences.

**Operational authority** — facts and rules that must be deterministic for
agents to work safely. These may govern work. Examples:

- the canonical manuscript path (`manuscript/human.md`)
- the current project state (`docs/current-state.md`)
- the branch / commit / PR workflow
- which skill or context to load for a task
- what an agent is allowed to modify for a given task class
- where a new file belongs
- publication permission
- active vs superseded ADR status

**Intellectual confidence** — observations, hypotheses, propositions, patterns,
interpretations, and theories about human systems. These inform reasoning. They
do not acquire operational authority merely because they live under a directory
named `source/` or are called "canonical".

Rule: **operational facts may govern work; intellectual claims should inform
reasoning.**

A file can contain both. `trojan_horse_movement_pattern.md` is intellectual
context with some strong internal claims; it is not operational law. The core
stance sources describe how the author thinks; they are durable but remain open
to revision. The manuscript editing rules are operational *when manuscript work
is active* and dormant otherwise.

### 3. Operational authority hierarchy

For how work is done (not for what is true about human systems):

1. `AGENTS.md` — bootloader: what the repo is, task routing, permissions, Git
   discipline, validation.
2. `.agents/skills/human-systems-context/SKILL.md` — routing to the smallest
   sufficient context for the task class.
3. `docs/decisions/` — accepted ADRs, most recent governing where they conflict.
4. `docs/current-state.md` — current project state (single source).
5. `resources/playbooks/` — repeatable workflows, including the working-session
   playbook.
6. `resources/source/book_work/` — manuscript operational rules, in force only
   for manuscript task classes.

`README.md` is public orientation, not agent control. `resources/source/` and
`resources/context/` outside `book_work/` are intellectual context, not
operational control.

### 4. Task classes

An agent determines the class before starting. Classes are lightweight routing,
not a state machine.

| Class | Work | Manuscript default | Publication |
|---|---|---|---|
| 1. Repository / Tooling | devcontainer, skills, instructions, automation, repo structure, workflows | must not be materially edited; intellectual content changes only when directly required | no |
| 2. Concept Development | capture an observation, develop a proposition, connect concepts, identify contradiction, evolve the body of thought | untouched unless explicitly requested; manuscript voice not required | no |
| 3. Research / Pressure Testing | compare with established theory, search for counterexamples, find boundary conditions, ask what would falsify a claim, separate observation from inference | untouched; evidence must be able to challenge the model | no |
| 4. Paper Development | plan, draft, revise, source-check, challenge a narrow paper | load intellectual context; use paper-appropriate writing needs; do **not** load manuscript-only prose constraints; development is not publication | no |
| 5. Manuscript Work | diagnosis, editorial pass, rewrite, integration into `manuscript/human.md` | explicit user request required; load manuscript voice and editing rules; preserve pass discipline where useful (subtypes: diagnosis / bounded pass / rewrite) | no |
| 6. Publication Preparation | copy edit, references, metadata, formatting, publication readiness, website preview prep | as per the artifact | preparation only; does not grant permission to publish |
| 7. Publication | deliberately move or expose a specific artifact as public website content | as per the artifact | requires explicit user instruction naming the specific artifact |

Publication permission is never inferred from "looks ready", "prepare this",
"finish this", "review this", or "make this publication-ready".

Class 5 replaces ADR 001 Classes B–E for routing purposes. ADR 001's pass
table (A–E) and its editing-pass definitions remain the reference for *how* a
bounded manuscript pass is run once Class 5 is active and a pass is declared.

### 5. Manuscript isolation

`manuscript/human.md` is the canonical manuscript. It is materially edited only
under Class 5 with an explicit user request. Class 1–4 and Class 6–7 work must
leave it with no material diff. The stale snapshot at
`resources/source/book_work/human.md` is for context loading only and is never
edited directly.

### 6. Current-state behaviour

`docs/current-state.md` describes the current project: what it is, current
direction, operational environment, what is active and inactive, which files and
decisions are operationally authoritative, unresolved tensions, and likely next
work. It is concise enough to be a mandatory read.

It does not carry historical manuscript-pass narrative. Word count, chapter
count, and last-pass data belong in current-state only while Class 5 work is
active. Historical pass records stay in `docs/editorial-notes.md`,
`docs/logs/editing-log.md`, and `docs/reports/archive/`. Git preserves the rest.

### 7. Decision lifecycle

Decisions are models for operating under current conditions. Statuses:
`Proposed`, `Accepted`, `Superseded`, `Deprecated`, `Rejected`.

`Accepted` is not immutable. When conditions or understanding change, write a
new ADR that supersedes the old one and link both directions. Do not rewrite an
accepted historical decision so that it appears to have always meant the new
thing. The repository should be able to show how its operating model changed.

### 8. Documentation update discipline

Update an authoritative document only when the thing it is authoritative about
changed.

- A conceptual observation updates conceptual material only.
- A change to repository purpose updates README, current-state, and the relevant
  ADR as appropriate.
- A development-environment change updates development documentation.
- A manuscript edit updates manuscript-specific state where relevant.
- A publication-architecture change updates the publication decision and
  instructions.

Do not require README, current-state, the skill map, and several indexes to
change after every conceptual note. Avoid hidden rules and avoid documentation
churn. If a new file changes how agents behave, update `AGENTS.md`, the relevant
source map, and `docs/current-state.md` if it is state-bearing.

### 9. Historical preservation

Preserve history. Do not preserve obsolete authority. Historical work may remain
historical after it stops being authoritative. Mark superseded decisions as
superseded; archive historical reports under `docs/reports/archive/`; do not
delete valuable historical thought merely because it is no longer authoritative.

---

## Consequences

### Positive

- Repository identity matches how the work actually operates now.
- Operational facts and intellectual claims are no longer conflated.
- Accepted decisions can be superseded without erasing history.
- Task routing separates tooling, concept work, research, paper work, manuscript
  work, preparation, and publication.
- Manuscript rules apply only to manuscript work.
- Publication requires explicit, artifact-specific intent.

### Negative

- Two ADRs now exist and a reader must follow the supersession chain.
- Some contributors used to the A–E editorial classes must learn the new
  classes.
- The distinction between operational and intellectual authority relies on
  judgment rather than a mechanical rule.

### Risks and mitigations

- **Risk:** the reset replaces one rigid taxonomy with another.
  **Mitigation:** classes are routing hints; no state machine; fewer rules
  preferred where they give the same safety.
- **Risk:** intellectual sources still read as binding.
  **Mitigation:** Section 2, the status note in the Trojan Horse file, and
  `resources/source/core_stance/contextual-intervention.md` frame evolving
  thinking as provisional.

---

## Related records

- ADRs: `001-editorial-workflow-and-source-authority.md` (superseded as the
  repository-wide model; manuscript pass mechanics retained)
- Conceptual context: `resources/source/core_stance/contextual-intervention.md`
- Working session flow: `resources/playbooks/working-session.md`

---

## Implementation evidence

- Pull request: see branch `repo/operating-model-reset`.
- Validation: `bash scripts/validate.sh`.

## Supersedes

`001-editorial-workflow-and-source-authority.md` — as the repository-wide
operating and source-authority model. ADR 001's manuscript editing-pass
definitions remain in use for Class 5 work.

## Superseded by

None.

## History

### 2026-08-31

Record created. Repository operating model reoriented from book-centric editorial
workflow to a body-of-thought model with an explicit split between operational
authority and intellectual confidence.
