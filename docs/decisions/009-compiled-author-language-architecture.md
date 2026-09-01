# ADR 009: Compiled Author Language Architecture

**Status:** Proposed  
**Date:** 2026-09-01  
**Supersedes:** None  
**Amends:** ADR 007 (Author Corpus Integration)

---

## Context

ADR 007 established an author corpus (38 direct user messages) to provide evidence for authentic authorship. The corpus was organized by cognitive surface and used for direct retrieval during generation.

After implementation, a critical failure mode became visible: the system sometimes copied phrases, sentences, or distinctive wording directly from historical corpus fragments into newly generated prose.

This is not the intended model. The objective is **not** to retrieve things the author once wrote and reuse them. The objective is to **use the corpus to infer how the author uses language, then apply that inferred language behaviour to genuinely new prose**.

---

## Decision

Change the author corpus architecture from **direct retrieval** to **compiled representation**.

### Core architectural change

**Before (v1.0):**
```
raw author examples
        ↓
retrieve examples into generation context
        ↓
model imitates examples
        ↓
new prose containing old language
```

**After (v2.0):**
```
raw author corpus
+
thought trails
+
negative examples
        ↓
analyse / compile
        ↓
derived author-language representation
+
derived thought-movement representation
        ↓
normal generation context
```

### Compiled layers

Create durable compiled representations in `author-corpus/compiled/`:

1. **`LANGUAGE_MODEL.md`** — Observed linguistic behaviour:
   - Clause construction (accumulation, connectives, parenthetical qualification)
   - Qualification and uncertainty (qualification after commitment, first-person markers, unresolved endings)
   - Repetition (deliberate emphasis, near-synonym accumulation)
   - Vocabulary register (ordinary over abstraction, technical shorthand, abbreviations)
   - Questions (inside reasoning, challenge questions, self-check questions)
   - Sentence behaviour (variation, fragments, long exploration, short compression)
   - Paragraph behaviour (thought movement, asymmetry)
   - Emotional language (direct irritation, enthusiasm, understatement)
   - Humour and irony (dry escalation, understated sarcasm, opposite comparison)

2. **`THOUGHT_MOVEMENT_MODEL.md`** — Cognitive movement patterns:
   - Starting from concrete irritation
   - Questioning the default mechanism
   - Proposing a simpler model
   - Discovering counterexamples or boundary conditions
   - Adding another actor or perspective
   - Adding another time horizon
   - Bringing informal reality into formal model
   - Returning to an earlier thought
   - Becoming less certain
   - Compressing a long chain into a short formulation
   - Leaving some things unresolved
   - Expanding scope mid-thought
   - Noticing patterns across domains

3. **`CONTRASTIVE_MODEL.md`** — Author tendencies vs. default-generated behaviour:
   - Sentence balance (asymmetry vs. balanced structures)
   - Synonym variation (deliberate repetition vs. polished variation)
   - Listification (genuine inventories vs. systematic bullets)
   - Transitions (abrupt shifts vs. explanatory connectors)
   - Completeness/closure (unresolved endings vs. artificial completeness)
   - Abstraction level (ordinary vocabulary vs. inflated language)
   - Emotional presence (visible traces vs. neutral restatement)
   - Certainty/hedging (qualification after commitment vs. false certainty or repetitive hedging)
   - Humour/irony (dry escalation vs. inserted jokes)
   - Conclusion patterns (earned compression vs. neat summaries)
   - Voice/agency (first-person ownership vs. institutional neutrality)
   - Structural templates (irregular shapes vs. content-marketing skeleton)

4. **Surface profiles** (`surfaces/*.md`):
   - `reflective.md` — Reflective/conceptual surface (Human System papers, essays)
   - `technical.md` — Technical reasoning surface (architecture, implementation)
   - `argumentative.md` — Argumentative/correction surface (disagreement, boundaries)
   - `explanatory.md` — Explanatory surface (concept explanation, inquiries)

### Retrieval modes

Introduce explicit access modes:

- **`analysis`** — May read raw corpus and thought trails (used for compiling profiles, updating observations, evaluating drift, corpus research)
- **`generation`** — Must normally not read historical raw fragments (used for essays, papers, pages, reader-facing prose); loads compiled representations instead
- **`evaluation`** — May compare generated text against raw corpus (used for overlap detection, stylistic diagnostics, held-out comparison)

### Exception: current author seed

If the author provides a direct seed for the current artifact (e.g., "People and their feelings and reactions are also infra" for a new paper), that seed may remain available verbatim. Do not paraphrase it merely to avoid overlap.

The rule is: **historical corpus language should not leak into new prose merely because it was retrieved. A current artifact seed is different.**

### Historical-overlap detection

Add deterministic check for suspicious reuse of historical corpus wording:

- Check generated reader-facing prose against historical raw corpus and thought-trail fragments
- Flag exact n-gram overlap above meaningful length (11+ words)
- Flag highly distinctive sentence overlap
- Flag unusually long matching word sequences

**Do NOT flag:**
- Common phrases: "I think", "it depends", "I am not sure"
- Technical terms and project terminology
- Ordinary language sequences
- Current-seed language (legitimate reuse)

### Held-out evaluation

Reserve representative samples for evaluation only (not used for compilation):

- `coach-2026-08-31-belonging` (coaching surface)
- `mb-2026-08-29-collab-counter` (technical surface)
- `hs-2026-09-01-infra` (reflective surface)
- `mb-cross-team-collaboration` (matchboard thought trail)
- `coach-interest-belonging` (coaching thought trail)

Use held-out samples to test whether profile-guided generation resembles author behaviour without having seen those specific samples during compilation.

### No "Lage score"

Do not create:
- Voice score or authorship percentage
- AI detector or pass/fail classifier
- Hard authorship thresholds
- Required conjunction frequencies or sentence-length targets

The evaluation should answer: **Did this generation move closer to observed author behaviour than the generic baseline?**

not: **Is this mathematically the author?**

---

## Consequences

### Positive

1. **Prevents phrase-copying failure mode** — Generation uses derived behaviour, not raw excerpts
2. **Preserves authentic voice** — Language behaviour is learned and applied to new thought
3. **Scalable** — Compiled models remain small and purposeful; corpus may grow large
4. **Maintainable** — Profiles can be updated as new evidence appears without regenerating everything
5. **Evaluable** — Held-out set provides objective baseline for testing
6. **Surface-aware** — Different surfaces (reflective, technical, argumentative) can have different profiles
7. **Thought-depth preserved** — `THOUGHT_MOVEMENT_MODEL.md` encodes how thinking develops, not just how sentences are constructed

### Negative

1. **Compilation overhead** — Requires upfront analysis work to derive models
2. **Loss of direct evidence** — Generation no longer sees full raw passages (mitigated by analysis mode for corpus research)
3. **Risk of over-compilation** — Compiled models could become rigid rules (mitigated by confidence levels and update protocol)
4. **Evaluation complexity** — Requires running controlled tests to verify profile effectiveness

### Risks

1. **Profiles become outdated** — As author's voice evolves, compiled models may lag
   - **Mitigation:** Update protocol requires comparing new evidence against existing observations and strengthening/weakening/contradicting as warranted

2. **Over-compilation** — Models could become thousands of metrics or rigid rules
   - **Mitigation:** Prefer meaningful observed behaviours, surface distinctions, contrastive tendencies, confidence, compact diagnostics

3. **False positives in overlap detection** — Common phrases or project terminology flagged
   - **Mitigation:** Explicit allow-list for common phrases and project terms; human review of flagged overlaps

4. **Profile-guided generation still feels generic** — Compiled models may not capture full author voice
   - **Mitigation:** Held-out evaluation tests for this; iterate on models if profile-guided generation does not outperform generic baseline

---

## Validation

Run controlled tests before accepting this architecture:

### Test A: New Human System seed (reflective surface)
- Generate with compiled profiles vs. generic defaults
- Compare against held-out `hs-2026-09-01-infra`
- Check: author-like linguistic behaviour, no historical phrase reuse

### Test B: Technical reasoning (technical surface)
- Generate with compiled profiles + technical surface vs. generic defaults
- Compare against held-out `mb-2026-08-29-collab-counter`
- Check: technical surface profile influences language without inserting historical phrases

### Test C: Reflective conceptual writing (reflective surface)
- Generate with compiled profiles + thought movement model vs. generic defaults
- Compare against held-out `hs-2026-09-01-infra`
- Check: language remains recognisably author-like, depth remains, no old corpus sentences, not generic polished essay prose

### Test D: Final integrity test (novel topic)
- Generate on completely novel topic not in corpus, thought trails, or papers
- Use only compiled representations
- Check:
  1. Does it show author-like linguistic behaviour?
  2. Does it avoid recognizable historical phrases?
  3. Does it avoid generic polished AI structure?
  4. Does the thought develop rather than merely expand?
  5. Does it still sound plausible on a subject the author never discussed?

**This is the strongest practical test.** If author-like generation only works on topics present in the corpus, the system is still copying content rather than learning language.

---

## Affected files

- `.agents/skills/human-systems-context/resources/source/writing_voice/author-corpus/compiled/` (new directory)
  - `LANGUAGE_MODEL.md` (new)
  - `THOUGHT_MOVEMENT_MODEL.md` (new)
  - `CONTRASTIVE_MODEL.md` (new)
  - `HELD_OUT_EVALUATION.md` (new)
  - `surfaces/reflective.md` (new)
  - `surfaces/technical.md` (new)
  - `surfaces/argumentative.md` (new)
  - `surfaces/explanatory.md` (new)
- `.agents/skills/public-writing/SKILL.md` (amended — retrieval changed to compiled models)
- `.agents/skills/human-systems-context/resources/source/writing_voice/author-corpus/CORPUS_POLICY.md` (amended — retrieval modes added)
- `.agents/skills/human-systems-context/resources/source/writing_voice/author-corpus/CORPUS_INDEX.md` (amended — v2.0 architecture documented)
- `docs/current-state.md` (amended — compiled architecture noted)
- `scripts/overlap-check.js` (new — historical-overlap detection)
- `docs/decisions/009-compiled-author-language-architecture.md` (this ADR)

---

## Relationship to other decisions

- **ADR 007 (Author Corpus Integration):** This ADR amends ADR 007 by changing retrieval from raw to compiled. The corpus itself is preserved and remains valuable evidence.
- **ADR 008 (Thought Trails and Depth Integration):** Thought trails are now compiler inputs rather than direct retrieval sources. The depth work is preserved and encoded in `THOUGHT_MOVEMENT_MODEL.md`.
- **ADR 005 (Public Authorship and Language Programme):** `public-language.md` becomes intentional public-writing principles and boundaries. The derived corpus models carry observational author-language evidence.

---

## Notes

The target is narrower and more defensible than perfect author reproduction:

> **infer recurring language and thinking behaviour from evidence, then use those behaviours to shape new language without copying the evidence itself.**

This architecture accepts that a general-purpose LLM cannot perfectly reproduce the author. It instead provides a defensible, evidence-backed, maintainable system for generating new prose that exhibits observed author behaviours while avoiding model-default drift.
