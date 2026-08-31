# Decision Record: Public Authorship and Language Programme

**Date:** 2026-08-31
**Status:** Proposed
**Supersedes:** Sections of `002-repository-operating-model-and-source-authority.md` (task class routing for writing, manuscript voice scope)
**Superseded by:** None

---

## Problem

ADR 002 established a repository operating model distinguishing operational authority from intellectual confidence, and defined task classes for routing work. However, it left several contradictions and gaps:

1. **Manuscript voice governed all writing.** The `author-voice-guide.md` was loaded for class 4 (Paper Development) work, creating confusion about whether manuscript-specific prose constraints (long paragraphs, no binary contrast, no advice, spoken continuity) applied to public papers and essays.

2. **No public authorship model existed.** Human System is becoming a public body of thought, not merely a manuscript workspace. Public material needs an authorship model that preserves epistemic stance, allows uncertainty, and sounds like recognisable authorship rather than generated management prose.

3. **Agent scaffolding could leak into public prose.** Nothing prevented task routing references, skill-loading instructions, validation details, or editorial metadata from appearing in reader-facing material.

4. **Publication review lacked authorship checks.** The review focused on evidence integrity and public/private boundaries but did not check for AI-shaped structural regularity, accidental universals, epistemic drift, or scaffolding leakage.

5. **Contradictory instructions.** `paper-development` said not to load manuscript constraints, while `human-systems-context/SKILL.md` loaded `author-voice-guide.md` for class 4 work.

The repository needed a durable public-writing and authorship model that:
- distinguishes manuscript voice from public authorship
- preserves epistemic stance and uncertainty in public material
- blocks agent scaffolding from leaking into reader-facing prose
- survives devcontainer rebuilds and fresh sessions
- participates in the existing skill, workflow, and validation architecture

---

## Decision

### 1. Public-language resource

Add `.agents/skills/human-systems-context/resources/source/writing_voice/public-language.md` defining the reader-facing authorship model for Human System public material.

This resource covers:
- core stance (grounded, curious, experienced, plain-spoken, reflective, comfortable with ambiguity)
- epistemic stance (uncertainty as first-class, natural first-person language, no manufactured confidence)
- sentence construction (length follows thought, ordinary connectives, avoid noun-heavy consultant language)
- paragraphs (different from manuscript; break on footing change, not visual rhythm)
- lists and bullets (lists for things that behave like lists; prose for thinking)
- headings (meaningful changes in subject; avoid reflexive content-marketing templates)
- humour, irony, and contrast (dry, situational, aimed at absurdities not people)
- metaphor and comparison (clarifies how the author sees; avoid stock images)
- closure (do not automatically close; stop when thought is done)
- relationship to evidence (distinguish observation, interpretation, hypothesis, external evidence)
- advice and prescription (implication need not become prescription; "it depends" must lead somewhere)
- AI-shaped prose patterns to guard against (balanced structures, binary correction, triads, exhaustive coverage, automatic conclusions)

### 2. Manuscript voice correctly scoped

Rename `author-voice-guide.md` to `manuscript-voice-guide.md` and clarify its scope as manuscript-only. It governs `manuscript/human.md` prose under class 5 (Manuscript Work) only.

Update all references throughout the skill to use the renamed file for manuscript work.

### 3. Public-writing skill

Add `.agents/skills/public-writing/SKILL.md` as a Human System-owned skill for authoring and revising reader-facing prose.

Responsibilities:
- load `public-language.md` principles
- load relevant Human System conceptual context
- preserve epistemic status
- distinguish conceptual content from agent scaffolding
- author reader-facing prose
- run final human-language review
- route to research/citation/reader-test when triggers apply

The skill does not load manuscript-only constraints (Writing Working Agreement, Editing Charter, Pattern Ledger, manuscript voice guide).

### 4. Workflow updates

Update `.agents/workflow.json`:
- add `public-writing` to the skills registry
- add `public-writing` as required for class 4 (Paper Development)
- add `public-writing` as required for class 6 (Publication Preparation)
- add `public-essay-or-note` sequence for non-paper public material
- add `public_writing_note` explaining the skill's role

### 5. Publication review strengthened

Extend `publication-review/SKILL.md` with checks for:
- agent scaffolding leakage (references to `AGENTS.md`, `SKILL.md`, `.agents/`, workflow JSON, task classes, skill-loading, validation details, editorial metadata)
- AI-shaped structural regularity (excessive headings, repeated templates, automatic conclusions, listification, content-marketing cadence)
- epistemic drift (uncertainty that disappeared, claims upgraded beyond evidence, hidden first-person stance)

### 6. Reader-test extended

Add authorship and voice questions to `reader-test/SKILL.md`:
- Does this sound like a person exploring a view or an organisation declaring policy?
- Which statements did they read as established facts?
- Where did the writer appear more certain than the evidence justified?
- Where did they feel the text had been organised for them rather than thought through with them?
- Did any list or heading structure feel mechanical?
- What appears unresolved? Did it feel intentional or merely incomplete?
- What do they think the author's own position is?
- Did any humour or sarcasm alter how they interpreted the author's stance?
- Did they notice any references to internal agent processes?

### 7. Writing-voice-workflow narrowed

Replace `writing-voice-workflow.md` content to clarify its scope:
- for ordinary communication (messages, emails, updates, prompts, operational docs)
- not for reader-facing Human System public material (use `public-writing` skill instead)
- not for manuscript prose (use manuscript workflows)

### 8. Resource map updated

Update `RESOURCE_MAP.md` to document:
- `public-language.md` as reader-facing authorship model
- `manuscript-voice-guide.md` as manuscript-only voice
- the distinction between general public authorship and manuscript constraints

### 9. Task class routing clarified

Update `human-systems-context/SKILL.md`:
- class 4 (Paper Development) loads `public-language.md`, not `manuscript-voice-guide.md`
- class 5 (Manuscript Work) loads `manuscript-voice-guide.md` plus Writing Working Agreement, Editing Charter, Pattern Ledger
- explicit note that manuscript constraints apply only to class 5

### 10. Devcontainer persistence

The `public-writing` skill is repo-local under `.agents/skills/`. The devcontainer `sync-agent-skills.sh` script already links repo-local skills automatically, so no additional sync logic is required.

### 11. Validation

Add validation checks (in `scripts/lib/check-workflow.sh` or equivalent) for:
- `public-writing` skill exists and is registered
- `public-language.md` resource exists
- workflow references point to existing skills
- public-writing tasks never load manuscript-only rules
- manuscript work still loads manuscript-specific rules
- no stale references to `author-voice-guide.md` remain

---

## Consequences

### Positive

- Public Human System material has a clear authorship model distinct from manuscript voice
- Epistemic stance and uncertainty are preserved in public writing
- Agent scaffolding is blocked from leaking into reader-facing prose
- Publication review checks for AI-shaped structural patterns and epistemic drift
- Reader-test includes authorship and voice questions
- Manuscript voice is correctly scoped to manuscript work only
- Contradictory instructions are resolved
- The model survives devcontainer rebuilds via repo-local skill architecture

### Negative

- Two voice resources now exist (public-language, manuscript-voice-guide); contributors must understand the distinction
- A new skill (`public-writing`) must be learned
- Some existing public material may need remediation to align with the new model

### Risks and mitigations

- **Risk:** Agents mechanically apply `public-language.md` rules, creating new mechanical prose.
  **Mitigation:** The resource explicitly warns against template application; examples illustrate reasoning, not patterns to copy.

- **Risk:** Manuscript and public voice become confused in practice.
  **Mitigation:** Clear scoping in `SKILL.md` and `workflow.json`; manuscript constraints explicitly isolated to class 5.

- **Risk:** Publication review becomes overly prescriptive about prose style.
  **Mitigation:** Review reports findings; `public-writing` skill makes changes; explicit human gate remains for publication.

---

## Related records

- ADRs: `002-repository-operating-model-and-source-authority.md` (task classes, source authority)
- Skills: `human-systems-context`, `public-writing`, `paper-development`, `publication-review`, `reader-test`
- Resources: `public-language.md`, `manuscript-voice-guide.md`
- Playbooks: `writing-voice-workflow.md` (narrowed scope)

---

## Implementation evidence

- `.agents/skills/human-systems-context/resources/source/writing_voice/public-language.md` created
- `.agents/skills/human-systems-context/resources/source/writing_voice/manuscript-voice-guide.md` renamed and rescope
- `.agents/skills/public-writing/SKILL.md` created
- `.agents/workflow.json` updated with `public-writing` skill and corrected routing
- `.agents/skills/human-systems-context/SKILL.md` updated for class 4/5 distinction
- `.agents/skills/publication-review/SKILL.md` extended with authorship checks
- `.agents/skills/reader-test/SKILL.md` extended with voice questions
- `.agents/skills/human-systems-context/resources/playbooks/writing-voice-workflow.md` replaced
- `.agents/skills/human-systems-context/resources/context/RESOURCE_MAP.md` updated
- All `author-voice-guide.md` references updated to `manuscript-voice-guide.md` where manuscript work is intended

---

## Supersedes

Sections of `002-repository-operating-model-and-source-authority.md` related to:
- class 4 (Paper Development) voice loading
- the scope of `author-voice-guide.md`
- the boundary between manuscript and public writing

The task class model itself (classes 1-7) remains unchanged. The public/private boundary and explicit human intent gates remain unchanged.

---

## Superseded by

None.

---

## History

### 2026-08-31

Decision record created. Public authorship and language programme implemented via new `public-writing` skill, `public-language.md` resource, rescope of manuscript voice, and workflow updates.
