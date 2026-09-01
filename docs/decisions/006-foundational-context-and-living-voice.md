# Decision Record: Foundational Context and Living Voice Programme

**Date:** 2026-08-31
**Status:** Proposed
**Supersedes:** None
**Superseded by:** None

---

## Problem

The recently merged public-authorship programme (ADR 005) established a durable distinction between manuscript voice and public authorship, and blocked agent scaffolding from leaking into reader-facing prose. However, two gaps remained:

1. **No foundational conceptual context existed.** Agents and collaborators needed to understand what "Human System" means at a basic level before developing concepts or writing. The existing `contextual-intervention.md` assumed familiarity with premises that were never explicitly stated: humans are inside the system, models are incomplete by design, relationships carry infrastructure load, "It depends" begins investigation rather than ending it, apparently irrational variables can be materially real.

2. **Public writing remained too clean.** The public-language resource preserved epistemic stance and uncertainty, but it did not explicitly permit the messier, more emotionally present, thinking-in-motion qualities that make Human System writing feel lived rather than polished. Future writing needed permission to be:
   - uneven in pacing
   - emotionally present (frustration, irritation, amusement, discomfort)
   - capable of letting tension build without immediate resolution
   - capable of dry humour and occasional sarcasm
   - capable of self-correction and revisiting
   - capable of leaving something unresolved

Without these permissions, agents might produce prose that is epistemically honest but emotionally flat — cleaner than the thinking actually is.

---

## Decision

### 1. Foundational conceptual source

Add `.agents/skills/human-systems-context/resources/source/core_stance/human-system-foundation.md` establishing the basic premises from which Human System thinking proceeds:

- **Humans are inside the system** — a system contains feelings, relationships, trust, fear, irritation, confidence, shame, loyalty, resentment, fatigue, memories, habits, assumptions, informal agreements, historical scars, unofficial hierarchies, who people listen to, who people avoid, timing, mood, social pressure, status, reputation
- **Models are incomplete by design** — architecture diagrams, org charts, process maps leave things out necessarily; the problem begins when people forget what was left out
- **Human infrastructure** — trust, familiarity, confidence, relationships carry load; damaged relationships make boundaries expensive; fear creates approval paths that exist nowhere in policy
- **Systems react** — people interpret interventions, anticipate consequences, remember what happened before, adapt around processes, form opinions, become tired, trust some people more than others
- **"It depends" as foundational stance** — not indecision or relativism, but the beginning of investigation into what the answer depends upon
- **Experience matters without becoming authority** — experience should improve questions, hypotheses, and pattern recognition; it does not remove the need to understand the situation
- **Apparently irrational variables can be materially real** — mood, tiredness, who proposed an idea, what happened last time, reputation, organisational history, aesthetics, social status may affect decisions without deserving to
- **Formal and actual authority may differ** — recognise both as system information
- **Epistemic uncertainty is legitimate** — publication, editing, and repeated use do not automatically increase certainty; the body of work should be allowed to show when the author changes his mind

This file is conceptual context, not a style guide, not public copy, not a list of slogans to insert into pages. It is background cognition that agents should see through, not something they must mention.

### 2. Contextual-intervention updated

Update `contextual-intervention.md` to explicitly build from the foundation. Add a reference note in the opening section directing readers to `human-system-foundation.md` for basic premises. This document now extends the foundation toward understanding context and intervention.

### 3. Living voice permissions added to public-language

Extend `public-language.md` with explicit permissions for:

**Less clean prose:**
- uneven pacing
- revisiting an idea
- small self-corrections
- partial conclusions
- repetition where the thought genuinely returns
- sentences that turn slightly while being written
- paragraphs that carry uncertainty forward
- asymmetry
- occasional rough edges

Do not deliberately add mistakes, fake spontaneity, random fragments, slang, or punctuation to "sound human." The principle is: do not polish away the fingerprints of thinking.

**Thinking in motion:**
A reader should sometimes be able to feel that understanding is forming while the text moves. This may include starting from an observation and discovering the abstraction later, questioning the abstraction after naming it, returning to an earlier thought because it no longer feels sufficient, admitting that a neat explanation has started to feel suspicious, or carrying two competing interpretations for a while.

**Emotional presence:**
Allow natural traces of frustration, irritation, affection, amusement, suspicion, discomfort, curiosity, enthusiasm, disappointment, admiration, exasperation, uncertainty. Emotional language should remain connected to actual thought, not turn the author into a dramatic narrator.

**Emotional tension:**
Allow tension to build across paragraphs without immediate resolution. Release may come later through a concrete observation, partial insight, reframing, admission, understated humorous line, or recognition of contradiction. Release is not the same as resolution. Sometimes tension should remain.

**Dry humour:**
Humour should be dry, restrained, slightly underplayed, contextual, occasional. It may come from noticing absurdity. Do not force jokes, do not explain jokes, do not turn writing into comedy.

**Sarcasm and irony:**
Occasional sarcasm is allowed, aimed primarily at ideas, systems, bureaucracy, contradictions, performative behaviour, absurd incentives, fashionable certainty. Avoid making individual people the target.

**Opposite comparison and contrast:**
Allow rhetorical contrast, reversal, "not X, but Y" constructions. The problem is repetition and artificial insight manufacture, not contrast itself. Manuscript-specific restrictions remain manuscript-specific.

### 4. Public-writing skill extended

Update `public-writing/SKILL.md` final integrity check with review questions:

- Has editing made this more certain than the thinking actually is?
- Has editing made this more orderly than the thinking actually is?
- Has editing made the author emotionally neutral where the underlying thought is not?
- Can I still feel someone thinking here?
- Did a useful hesitation get converted into a clean conclusion?
- Did the text resolve a tension merely because the section ended?
- Did I turn connected reasoning into a list?
- Did I turn uncertainty into repetitive hedging?
- Did humour arise naturally, or was it inserted to satisfy a voice instruction?
- Is sarcasm aimed at an absurd condition or at a person?
- Is contrast carrying a real observation or merely manufacturing a punchline?
- Has the author disappeared behind institutional language?
- Is this passage clearer because the thought became clearer, or merely cleaner because the prose was normalized?
- Has the page become so polished that it no longer feels lived?

These are agent judgment checks, not deterministic CI rules.

### 5. Routing updated

Update `human-systems-context/SKILL.md` to load `human-system-foundation.md` for:
- Class 2 (Concept Development)
- Class 3 (Research / Pressure Testing)
- Class 4 (Paper Development)

The foundation is loaded as background cognition, not foreground content.

### 6. Resource map updated

Update `RESOURCE_MAP.md` to document `human-system-foundation.md` as foundational conceptual context for all Human System work.

### 7. Contradictory rules remediated

Search the repository for rules that imply:
- clarity always beats lived thought
- public writing should be polished or neutral
- uncertainty should be resolved
- conclusions are expected
- emotional language is undesirable
- humour is undesirable
- paragraphs should be consistently shaped
- contrast is globally forbidden
- repetition is globally forbidden

Classify each finding. Remove or remediate genuine contradictions. Preserve rules correctly scoped to manuscript editing, operational documentation, ADRs, code comments, or technical reference material.

### 8. Clean-reader testing extended

Update `reader-test/SKILL.md` with questions:
- Does the text feel like someone exploring a thought or presenting a finished doctrine?
- Where did the author seem most certain? Where uncertain? Did those levels feel intentional?
- Was there anywhere the text became too polished or explanatory?
- Did you notice the author's emotional relationship to the subject? Did that help or distract?
- Did any tension build before the text named what was bothering it?
- Did any humorous or ironic line help you see the issue differently?
- Did anything feel like a manufactured joke?
- Did unresolved material feel alive or merely unfinished?
- Did the page feel overly structured?
- Were any lists doing work that prose should have done?

---

## Consequences

### Positive

- Agents now understand what "Human System" means before developing concepts or writing
- Public writing can preserve emotional texture and thinking-in-motion without becoming careless
- Uncertainty can appear naturally through movement rather than mechanical hedging
- Humour, sarcasm, and contrast are permitted without becoming quotas or templates
- Tension can build and remain unresolved where the thinking warrants it
- The foundation is loaded automatically for relevant tasks without requiring chat memory
- Manuscript rules remain separate from public writing permissions

### Negative

- Two conceptual context files now exist (foundation, contextual-intervention); contributors must understand the distinction
- Living voice permissions may be misapplied mechanically (forcing humour, manufacturing hesitation)
- Review questions require agent judgment rather than deterministic rules

### Risks and mitigations

- **Risk:** Agents mechanically insert "I think", humour, self-corrections, or unresolved endings to satisfy permissions.
  **Mitigation:** Explicit warnings in public-language.md and public-writing skill against simulating traits mechanically; review questions emphasize natural emergence.

- **Risk:** Foundation becomes a slogan list that agents repeat in public material.
  **Mitigation:** Explicit statement that foundation is background cognition to see through, not foreground content to mention.

- **Risk:** Living voice permissions create a new template (every article contains one joke, two hesitations, one unresolved question).
  **Mitigation:** Permissions are explicitly not requirements; review questions warn against manufactured traits.

---

## Related records

- ADRs: `002-repository-operating-model-and-source-authority.md` (task classes, source authority), `005-public-authorship-and-language-programme.md` (public writing architecture)
- Skills: `human-systems-context`, `public-writing`, `paper-development`, `reader-test`, `publication-review`
- Resources: `human-system-foundation.md`, `contextual-intervention.md`, `public-language.md`

---

## Implementation evidence

- `.agents/skills/human-systems-context/resources/source/core_stance/human-system-foundation.md` created
- `.agents/skills/human-systems-context/resources/source/core_stance/contextual-intervention.md` updated to build from foundation
- `.agents/skills/human-systems-context/resources/source/writing_voice/public-language.md` extended with living voice permissions
- `.agents/skills/public-writing/SKILL.md` updated with review questions
- `.agents/skills/human-systems-context/SKILL.md` updated to load foundation for classes 2, 3, 4
- `.agents/skills/human-systems-context/resources/context/RESOURCE_MAP.md` updated

---

## Supersedes

None. This extends ADR 005 without superseding it.

---

## Superseded by

None.

---

## History

### 2026-08-31

Decision record created. Foundational context and living voice programme implemented.
