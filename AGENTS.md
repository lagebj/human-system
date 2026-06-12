# Human Systems Agent Instructions

This repository is the canonical repo-scoped context package for my human-systems, modernization, enablement, operating-model, and writing-work stance.

It is not a generic prompt collection.
It is not a generic writing-style repo.
It is not only a book project.
It is not only a coding-agent helper.

The repo contains a local agent skill that must be used as the authoritative source of project context:

- `.agents/skills/human-systems-context/SKILL.md`

If repo instructions, skill resources, README files, and generated outputs disagree, fix the mismatch before continuing.

Do not treat book-specific writing constraints as global constraints. They apply only when the task is explicitly about manuscript writing, book editing, chapter work, prose voice, or editing passes.

## Required skills

When working in this repository, always apply these skills in order:

1. **`human-systems-context`** — repo-local source of stance, operating logic, project context, field patterns, and writing/book-specific rules where relevant.
2. **`git-branch-commit-pr`** — for branch creation, commits, pushing, and pull requests.
3. **`adr-governance`** — for durable repo structure, source hierarchy, skill architecture, or rules future agents must follow.

Use global skills only when explicitly relevant.
Do not assume global skills override this repository’s local instructions.

## Mandatory coding-agent workflow

Before changing files, read:

- `.agents/skills/human-systems-context/SKILL.md`
- `docs/working-session.md`

Before implementation, identify which kind of change this is:

- skill structure change
- source/context update
- playbook/template update
- book-specific workflow update
- documentation-only change
- repo governance change

Supporting documentation must be updated before implementation whenever the change affects:

- skill activation rules
- source priority
- resource structure
- task routing
- book-specific constraints
- global-vs-local skill boundaries
- reusable workflows
- templates consumed by other repos or agents

Every branch must remove stale, duplicated, or misleading context related to the change.

## Source authority

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

Do not duplicate large instructions into `AGENTS.md`.
`AGENTS.md` is the bootloader.
The skill carries the weight.

## Repo boundary

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

## Change discipline

When adding new material, place it according to this rule:

- Long-lived stance → `resources/source/core_stance/`
- Reusable movement pattern → `resources/source/field_patterns/`
- General writing voice → `resources/source/writing_voice/`
- Book/manuscript-only rules → `resources/source/book_work/`
- Distilled project memory → `resources/context/`
- Repeatable workflow → `resources/playbooks/`
- Copy-paste integration text → `resources/templates/`

If a new file changes how agents should behave, update:

1. `AGENTS.md`
2. `.agents/skills/human-systems-context/SKILL.md`
3. relevant README or source map

Do not leave hidden rules in random documents.
