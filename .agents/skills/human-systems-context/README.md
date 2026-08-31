# Human Systems Context Skill

This package is an agent skill setup for Lage's operating context and reusable project knowledge.

The book/manuscript work is included because it is one important application of the content, but the skill is meant to be useful across strategy work, platform conversations, writing, coaching, apps, and coding-agent prompts.

```text
human-systems-context/
├── SKILL.md
├── README.md
└── resources/
    ├── context/
    │   ├── OPERATING_CONTEXT.md
    │   ├── RESOURCE_MAP.md
    │   ├── DOMAIN_MODEL.md
    │   └── SOURCE_MANIFEST.md
    ├── playbooks/
    │   ├── working-session.md
    │   ├── strategy-response-workflow.md
    │   ├── technical-strategy-workflow.md
    │   ├── coding-agent-workflow.md
    │   ├── writing-voice-workflow.md
    │   ├── book-manuscript-workflow.md
    │   └── editing-passes.md
    ├── source/
    │   ├── core_stance/
    │   │   ├── contextual-intervention.md
    │   │   ├── personal_alignment.md
    │   │   └── who_am_i.md
    │   ├── field_patterns/
    │   │   ├── trojan_horse_movement_pattern.md
    │   │   └── four-impulses-of-help.md
    │   ├── writing_voice/
    │   │   └── author-voice-guide.md
    │   └── book_work/
    │       ├── writing-working-agreement.md
    │       ├── EDITING_CHARTER.md
    │       ├── PATTERN_LEDGER.md
    │       └── human.md
    └── templates/
        └── AGENTS_SNIPPET.md
```

## How to install

Copy the `human-systems-context` folder into:

```text
~/.agents/skills/human-systems-context/
```

Then add the contents of `resources/templates/AGENTS_SNIPPET.md` to your global or repo-specific `AGENTS.md`, depending on where you want the skill to be discovered.

## Design logic

`SKILL.md` stays operational. It tells the agent when to activate the skill, which resources to read, and how to behave.

`resources/source/` contains the stance and conceptual material. Outside
`book_work/`, treat it as **intellectual context**: it informs reasoning and
stays open to revision. It is not operational law and does not gain authority
from the directory name (see ADR 002 §2). `resources/source/book_work/` holds
manuscript operational rules, in force only during manuscript work.

`resources/context/OPERATING_CONTEXT.md` contains distilled knowledge from the
wider project conversation. It is useful background, subordinate to the source
files when they conflict.

`resources/playbooks/` contains reusable task workflows, including
`working-session.md` for coding-agent sessions.

`resources/templates/` contains copy-paste integration helpers.

## Resource placement rule

Add new material based on its role:

- Long-lived belief, stance, identity, or alignment contract → `resources/source/core_stance/`
- Reusable pattern or operating model → `resources/source/field_patterns/`
- General author/writing voice → `resources/source/writing_voice/`
- Manuscript-specific rules, manuscript draft, or editing law → `resources/source/book_work/`
- Distilled project memory from conversations → `resources/context/OPERATING_CONTEXT.md`
- Repeatable workflow → `resources/playbooks/`
- Agent integration snippet or reusable prompt shell → `resources/templates/`
