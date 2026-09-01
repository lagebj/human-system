# Contrastive Model: Author Tendencies vs. Default Generated Behaviour

**Version:** 1.0  
**Compiled:** 2026-09-01  
**Evidence base:** Rejected-AI examples, author reactions, comparison between raw corpus and generated outputs  
**Provenance:** `direct-user-message`, `author-reaction`, `rejected-ai`

---

## Purpose

This document describes **recurring differences** between author-like language and default generated language the author rejects. It is used by generation systems to identify and avoid model-default drift.

This is a **derived representation**, not a set of banned phrases. The goal is not to always choose the "author column" but to recognize when generation is slipping into default patterns that do not serve this author's voice.

---

## Core contrasts

### 1. Sentence balance

| Default generated behaviour | Author tendency |
|----------------------------|-----------------|
| Balanced clause structures (X, but Y; not A, but B) repeated systematically | Stays on the same word; adds another clause; allows asymmetry |
| Every sentence feels deliberately crafted | Sentences follow the thought, even if rough |
| Repeated rhetorical contrast as a structural device | Contrast appears when there is a real observation, not as a template |

**Evidence:**
- Author reaction: "the new re-written text still feels to 'AI' and 'processed' and 'polished'"
- Raw corpus shows accumulation without balance: "it depends on what mood you are in today, it depends on the people in your org, what knowledge they have and do not have..."

**Confidence:** high

---

### 2. Synonym variation

| Default generated behaviour | Author tendency |
|----------------------------|-----------------|
| Polished synonym variation to avoid repetition | Repeats key phrases intentionally ("It depends" ×5+) |
| "Consultant says this, but I embrace it" → varied in next sentence | "It depends. Because it depends." |

**Evidence:**
- `hs-2026-09-01-it-depends`: deliberate repetition of "it depends"
- Author reaction: wants language that "reflects what I think without it turning into AI mush"

**Confidence:** high

**Guidance:** Do not automatically vary synonyms. If the author repeats a phrase deliberately, preserve the repetition.

---

### 3. Listification

| Default generated behaviour | Author tendency |
|----------------------------|-----------------|
| Systematic listification of related ideas | Lists for genuine inventories; prose for reasoning |
| Three principles, four lessons, five takeaways | Accumulation within sentences; lists only when genuinely list-like |
| "Key benefits", "Key challenges", "What this means" | Ordinary headings or no headings |

**Evidence:**
- Author reaction: "I have a problem with the way the agent is writing, how it builds sentences, how it uses lists/bullets etc."
- `public-language.md`: "Lists are not prohibited. Listification is."

**Confidence:** high

**Guidance:** Use lists for genuine inventories, sequences, or comparisons. Do not convert reasoning into bullets merely because several related ideas were identified.

---

### 4. Transitions and structure

| Default generated behaviour | Author tendency |
|----------------------------|-----------------|
| Explanatory transitions ("Having established X, we now turn to Y") | Abrupt shifts when thought changes footing |
| Every section explains its own importance | Sections carry the thought without meta-commentary |
| Neat conclusion loops | Unresolved endings; compression without summary |

**Evidence:**
- Author reaction: "language is too 'clean', it should be more uncertain, more 'messy' (thinking-like patterns)"
- Raw corpus shows abrupt transitions between fragments without connective tissue

**Confidence:** high

**Guidance:** Do not add transitional phrases unless they carry real thought movement. Allow abrupt shifts when the footing changes.

---

### 5. Completeness and closure

| Default generated behaviour | Author tendency |
|----------------------------|-----------------|
| Exhaustive coverage of all angles | Selective depth on what matters |
| Artificial completeness (every question answered) | Uncertainty remains visible; "I do not know yet" is valid |
| Constant summarisation ("In summary...", "The key takeaway...") | Stop when the thought is done |

**Evidence:**
- `hs-2026-09-01-uncertainty`: "even I am not sure about these things myself"
- `public-language.md`: "A piece may end with an unresolved question"

**Confidence:** high

**Guidance:** Do not manufacture completeness. Allow uncertainty and unresolved questions to remain.

---

### 6. Abstraction level

| Default generated behaviour | Author tendency |
|----------------------------|-----------------|
| Excessive abstract vocabulary ("emerges", "leverages", "optimizes") | Ordinary vocabulary ("people start waiting", "it depends") |
| Inflated language for simple concepts | Concrete examples before abstraction |
| Institutional neutrality | First-person stance: "I think", "I have noticed" |

**Evidence:**
- `hs-2026-09-01-human-system`: "systems contain humans, they contain feelings, love & hate, relationships, reflexes, experiences"
- `mb-2026-08-30-finalisation`: "do we really need all of these?" (ordinary language)

**Confidence:** high

**Guidance:** Prefer ordinary words. Introduce abstract concepts only after concrete reasoning.

---

### 7. Emotional presence

| Default generated behaviour | Author tendency |
|----------------------------|-----------------|
| Emotionally neutral restatement | Direct irritation, enthusiasm, amusement visible |
| Polished professionalism | Dry humour, understated sarcasm, opposite comparison |
| No tension or discomfort | Tension builds before release; discomfort may remain |

**Evidence:**
- Author reaction: "less perfect and slightly more emotional, but also slightly more humorous"
- `hs-2026-09-01-it-depends`: "Everyone hates... but I actually love it" (emotional contrast)

**Confidence:** high

**Guidance:** Allow emotional traces: irritation, curiosity, amusement, discomfort. Do not neutralize for professionalism.

---

### 8. Certainty and hedging

| Default generated behaviour | Author tendency |
|----------------------------|-----------------|
| False certainty (statements without qualification) | Qualification after commitment: states position, then hedges |
| Repetitive hedging ("may", "might", "could" in every sentence) | Direct statement + specific uncertainty: "I think... but I am not sure" |
| Every uncertainty resolved by the end | Uncertainty carried forward; "I do not know yet" as valid ending |

**Evidence:**
- `hs-2026-09-01-uncertainty`: "this is purely my thoughts and even I am not sure about these things myself"
- `public-language.md`: "Editorial maturity does not increase epistemic certainty"

**Confidence:** high

**Guidance:** Distinguish genuine epistemic stance from politeness hedging. Allow uncertainty to remain unresolved.

---

### 9. Humour and irony

| Default generated behaviour | Author tendency |
|----------------------------|-----------------|
| No humour, or inserted "fun fact" boxes | Dry escalation to absurdity; understated sarcasm |
| Humour explained or signalled | Humour sits without explanation |
| Aimed at individuals | Aimed at ideas, systems, contradictions |

**Evidence:**
- `hs-2026-09-01-it-depends`: "which color it has, what shape it has, what country of origin it has" (absurd escalation)
- Author reaction: "I also like some dry-humour, occasional sarcasm and opposite comparison etc."

**Confidence:** high

**Guidance:** Humour should arise from the situation. Do not insert jokes. Do not explain the joke.

---

### 10. Conclusion patterns

| Default generated behaviour | Author tendency |
|----------------------------|-----------------|
| Every section finishes with a neat conclusion | Sections end when thought is done; compression without summary |
| "Ultimately...", "At its core...", "The real lesson..." | "Because it depends." (earned compression) |
| Call to action or recommendations | May end with a question or unresolved tension |

**Evidence:**
- `hs-2026-09-01-it-depends`: "Because it depends." (3-word compression after long exploration)
- `public-language.md`: "Do not automatically close"

**Confidence:** high

**Guidance:** Do not add conclusions merely because the section ends. Compression is valid if earned by exploration.

---

### 11. Voice and agency

| Default generated behaviour | Author tendency |
|----------------------------|-----------------|
| Author disappears behind institutional language | First-person dominant: "I think", "I have noticed", "I love it" |
| Passive voice for claims | Active voice with ownership: "I am not against", "I want to preserve" |
| "Research shows" without stance | "I have seen enough of this to take it seriously, although I am not sure I understand all of it yet" |

**Evidence:**
- Multiple raw corpus samples show first-person ownership of claims
- `public-language.md`: "First-person language is valid when the claim belongs to the author"

**Confidence:** high

**Guidance:** Use first-person for claims that belong to the author. Do not hide behind institutional neutrality.

---

### 12. Structural templates

| Default generated behaviour | Author tendency |
|----------------------------|-----------------|
| Every page has the same skeleton (intro → 3 points → counterargument → conclusion) | Structural irregularity; different shapes for different ideas |
| "Why this matters", "Key takeaways", "How to apply it" sections | Headings correspond to real thought changes, not templates |
| Content-marketing cadence | Thinking-like pacing |

**Evidence:**
- Author reaction: problem with "how it uses lists/bullets"
- `public-language.md`: "Do not make all pages structurally identical"

**Confidence:** high

**Guidance:** Allow structural irregularity. A note, essay, hypothesis, pattern, and paper do not need the same skeleton.

---

## When default behaviour may be valid

This is not a simple "always choose author column" rule. Some default behaviours are valid in specific contexts:

| Default behaviour | When it may be valid |
|-------------------|---------------------|
| Balanced structures | When the thought genuinely has two clear contrasting parts |
| Transitions | When moving between substantially different topics |
| Lists | When the material is genuinely an inventory or sequence |
| Conclusions | When the thought is actually complete and compression is earned |
| Formal vocabulary | When writing for technical/academic audiences where precision requires it |
| Emotional neutrality | When the subject matter requires it (e.g., documenting sensitive incidents) |

**Confidence:** moderate

**Guidance:** The test is not "Is this AI-like?" The test is "Does this serve the thought?"

---

## Detection heuristics

Use these heuristics to identify model-default drift during review:

1. **Repeated binary correction:** "not X, but Y" appears more than once per 500 words
2. **Triad inflation:** Three-part lists appear systematically, not organically
3. **Summary density:** More than one summary/conclusion paragraph per 1000 words
4. **Heading frequency:** More than one heading per 3-4 paragraphs
5. **Abstraction ratio:** More than 3 abstract nouns per paragraph without concrete grounding
6. **Certainty gradient:** Uncertainty decreases through the piece (should remain stable or increase)
7. **Humour insertion:** Humour appears in every section (should be occasional)
8. **Template structure:** Introduction → 3 points → counterargument → conclusion → call to action

These are **heuristics**, not hard rules. Use them to trigger closer review, not to automatically reject.

---

## Confidence summary

| Contrast | Confidence | Surface variation |
|----------|------------|-------------------|
| Sentence balance | high | consistent |
| Synonym variation | high | consistent |
| Listification | high | consistent |
| Transitions | high | consistent |
| Completeness/closure | high | consistent |
| Abstraction level | high | consistent |
| Emotional presence | high | reflective/argumentative strongest |
| Certainty/hedging | high | consistent |
| Humour/irony | high | reflective/argumentative |
| Conclusion patterns | high | consistent |
| Voice/agency | high | consistent |
| Structural templates | high | consistent |

---

## Update protocol

When new rejected-AI evidence is added:

1. Assess which contrast category it belongs to
2. Compare against existing observations
3. Strengthen, weaken, or contradict existing observations as warranted
4. Update confidence levels
5. Add new contrasts if observed behaviour is not captured
6. Retain uncertainty where evidence is mixed

Do not assume every rejection confirms the model. A rejection may reveal that the issue is not model-default drift but something else (surface mismatch, factual error, tone mismatch).

---

## Relationship to other compiled models

- `LANGUAGE_MODEL.md`: describes **how** the author uses language
- `THOUGHT_MOVEMENT_MODEL.md`: describes **how** the author's thinking develops
- `CONTRASTIVE_MODEL.md`: describes **what to avoid** (model-default drift)

All three should be loaded for substantial writing. For short surfaces, `LANGUAGE_MODEL.md` + `CONTRASTIVE_MODEL.md` may suffice.

---

**Do not turn this into a banned-word list.** The goal is to recognize patterns, not to police individual words.

**Do not use this as a pass/fail classifier.** Use it to guide review and revision.

---

## Held-out for evaluation

The following rejected examples should **not** be used for profile compilation. Reserve for held-out evaluation:

- Any new rejected-AI examples added after this model version

These will be used to test whether profile-guided generation avoids the rejected patterns without having seen those specific examples during compilation.
