# Human Systems Agent Instructions

This repository is the canonical repo-scoped context package for human-systems, modernization, enablement, operating-model, and writing-work stance.

It is not a generic prompt collection.
It is not a generic writing-style repo.
It is not only a book project.
It is not only a coding-agent helper.

## Bootloader

This file is the bootloader only. It does not contain detailed editorial rules.

**Canonical behavioral rules live in:**
- `.agents/skills/human-systems-context/SKILL.md` — routing, source selection, pass discipline
- `.agents/skills/human-systems-context/resources/source/` — editorial and authorial rules

Do not duplicate large instructions into this file.

---

## Required Skills

When working in this repository, always apply these skills in order:

1. **`human-systems-context`** — repo-local source of stance, operating logic, project context, field patterns, and writing/book-specific rules where relevant
2. **`git-branch-commit-pr`** — for branch creation, commits, pushing, and pull requests
3. **`adr-governance`** — for durable repo structure, source hierarchy, skill architecture, or rules future agents must follow

Use global skills only when explicitly relevant.
Do not assume global skills override this repository's local instructions.

---

## Before Any Work

**Mandatory reads:**
1. `.agents/skills/human-systems-context/SKILL.md`
2. `docs/current-state.md`

**Determine task class:**
- Class A: Repository/workflow maintenance (manuscript MUST NOT be edited)
- Class B: Manuscript diagnosis (manuscript read only, not modified)
- Class C: Bounded editorial pass (exactly one pass active)
- Class D: Manuscript rewrite (must be explicitly requested with change map)
- Class E: Publication preparation (separate from developmental editing)

**Record before work:**
- Task class
- Whether manuscript edits are allowed
- Active pass (if any)
- Authoritative files read
- Files expected to change
- Explicit non-goals
- Current revision or commit
- Risks of instruction conflict

---

## Source Authority

The local skill is the primary source of behavior:

- `.agents/skills/human-systems-context/SKILL.md`

Canonical source documents live under:

- `.agents/skills/human-systems-context/resources/source/`

Distilled operational context lives under:

- `.agents/skills/human-systems-context/resources/context/`

Reusable workflows live under:

- `.agents/skills/human-systems-context/resources/playbooks/`

Reusable snippets and integration templates live under:

- `.agents/skills/human-systems-context/resources/templates/`

**Manuscript canonical path:** `manuscript/human.md`

**Stale snapshot:** `.agents/skills/human-systems-context/resources/source/book_work/human.md` (for context loading only, do not edit)

---

## Change Discipline

When adding new material, place it according to this rule:

- Long-lived stance → `resources/source/core_stance/`
- Reusable movement pattern → `resources/source/field_patterns/`
- General writing voice → `resources/source/writing_voice/`
- Book/manuscript-only rules → `resources/source/book_work/`
- Distilled project memory → `resources/context/`
- Repeatable workflow → `resources/playbooks/`
- Copy-paste integration text → `resources/templates/`

If a new file changes how agents should behave, update:

1. `.agents/skills/human-systems-context/SKILL.md`
2. Relevant README or source map
3. `docs/current-state.md` (if state-bearing)

Do not leave hidden rules in random documents.

---

## Editorial Workflow

Editorial workflow is defined in:
- `docs/decisions/001-editorial-workflow-and-source-authority.md`

Key rules:
- Only one editorial pass may be active at a time
- Pass blending is forbidden
- Manuscript edits require explicit task class C, D, or E
- Class A (workflow maintenance) MUST NOT materially edit manuscript
- Current state lives in `docs/current-state.md` only
- Historical reports are archived under `docs/reports/archive/`

---

## Repo Boundary

This repo exists to preserve and evolve reusable context that can support:

- operating-model reasoning
- modernization strategy
- enablement and capability-building
- platform/team collaboration
- consulting stance
- governance and ownership analysis
- writing and editing work when explicitly requested
- coding-agent prompt generation when project context matters

This repo must not become:

- a dump of unrelated prompts
- a generic personal knowledge base
- a book-only workspace
- a global style guide for every repo
- a collection of one-off chat artifacts with no source hierarchy

---

## After Work

**Verify:**
- Changed files match task class
- `docs/current-state.md` is accurate
- README has no stale operational detail
- Supporting docs do not contradict canonical sources
- No manuscript content changed during workflow-only work
- Git diff contains no accidental prose rewrite
- All newly created instructions have a clear authority level
- Historical files are labeled or archived
- Final report distinguishes completed work from unresolved risks
