# Compiled Author Language Model

**Version:** 1.0  
**Compiled:** 2026-09-01  
**Evidence base:** 38 direct user messages across 6 surfaces  
**Provenance:** `direct-user-message` (primary), `author-reaction` (negative evidence)

---

## Purpose

This document describes **observed linguistic behaviour** derived from the author's raw corpus. It is used by generation systems to produce new prose that exhibits similar language patterns—without copying historical phrases.

This is a **derived representation**, not a phrase library. Normal reader-facing generation should load this model, not the raw corpus.

---

## Clause construction

### Observation: Accumulation within sentences
The author frequently adds clauses using simple connectives rather than creating new sentences. Thoughts accumulate inside a single sentence.

**Evidence:**
- `hs-2026-09-01-it-depends`: "It depends on what mood you are in today, it depends on the people in your org, what knowledge they have and do not have, which techs they are familiar with, how much time they have, who decides what (formally or informally), where the market is heading, what you want, what you do not want, who says it, how hard/easy it is, which color it has, what shape it has, what country of origin it has"
- `hs-2026-09-01-human-system`: "systems contain humans, they contain feelings, love & hate, relationships, reflexes, experiences, official and unofficial hierarchies, decisions, official and unofficial decision makers + a lot of other factors"

**Confidence:** high

### Observation: Simple connectives preferred
Uses `and`, `but`, `so`, `because` as primary clause joiners. Does not avoid repetition of `it depends` or `what` for rhetorical effect.

**Evidence:**
- Multiple samples show `and` chaining nouns/lists
- `hs-2026-09-01-it-depends`: "but I actually love it, because it is true"
- `hs-2026-09-01-uncertainty`: "but should never be hard truths"

**Confidence:** high

### Observation: Parenthetical qualification
Qualifies claims mid-sentence using parentheses or dashes.

**Evidence:**
- `hs-2026-09-01-it-depends`: "(formally or informally)"
- `mb-2026-08-26-locking-time`: "or around kick-off time"

**Confidence:** moderate

---

## Qualification and uncertainty

### Observation: Qualification after commitment
Often states a position first, then qualifies it. Does not front-load all hedging.

**Evidence:**
- `hs-2026-09-01-uncertainty`: "this is purely my thoughts and even I am not sure about these things myself, they are projections of my thinking and principles and what I believe in, but should never be hard truths"
- `hs-2026-09-01-public-language-problem`: "right now I feel it exposes internal work and mixes it with what is intended to be public"

**Confidence:** high

### Observation: First-person uncertainty markers
Uses "I think", "I feel", "I am not sure", "I am less certain" as genuine epistemic stance, not politeness.

**Evidence:**
- `hs-2026-09-01-uncertainty`: "even I am not sure about these things myself"
- `hs-2026-09-01-background`: "I think there are some important perspectives"
- `mb-2026-08-30-kicks-weekly`: "I am also not sure I understand what you mean"

**Confidence:** high

### Observation: Uncertainty without resolution
Allows uncertainty to remain unresolved. Does not always close with "but here's what we do."

**Evidence:**
- `hs-2026-09-01-uncertainty`: "even though I do not always have the answers"
- Multiple thought trails show "I do not know yet" endings

**Confidence:** high

---

## Repetition

### Observation: Deliberate repetition for emphasis
Repeats key phrases intentionally rather than varying synonyms. Repetition functions as cognitive search or emphasis.

**Evidence:**
- `hs-2026-09-01-it-depends`: "It depends" repeated 5+ times in one passage
- `mb-2026-08-26-locking-time`: "finalise" repeated in question form

**Confidence:** high

### Observation: Near-synonym accumulation
Accumulates related terms rather than selecting one precise word.

**Evidence:**
- `hs-2026-09-01-human-system`: "feelings, love & hate, relationships, reflexes, experiences"
- `hs-2026-09-01-infra`: "People and their feelings and reactions"

**Confidence:** moderate

---

## Vocabulary register

### Observation: Ordinary vocabulary over abstraction
Prefers concrete, ordinary words. Avoids inflating to abstract nouns when simple language works.

**Evidence:**
- `hs-2026-09-01-infra`: "People and their feelings and reactions are also infra" (uses "infra" as shorthand but the rest is ordinary)
- `mb-2026-08-29-rego`: "Should we remove this Rego gate entirely or should we default to true?" (direct technical question)

**Confidence:** high

### Observation: Technical shorthand when appropriate
Uses domain-specific terms (`locking`, `backfill`, `evidence`, `state`) without explanation when context supports it.

**Evidence:**
- `mb-2026-08-30-backfill`: "automatic backfill should not distribute 9 players evenly across 3 teams"
- `mb-2026-08-26-existing-data`: "opponent level evidence"

**Confidence:** high

### Observation: Abbreviations and informal markers
Uses `IMO`, `alot` (typo preserved), `+` for "and", `vs` without formality.

**Evidence:**
- `mb-2026-08-20-weekly-summary`: "IMO"
- `mb-2026-08-26-locking-time`: "alot"
- `hs-2026-09-01-human-system`: "+ a lot of other factors"

**Confidence:** high

---

## Questions

### Observation: Questions inside reasoning
Asks genuine questions mid-reasoning, not just as rhetorical hooks. Questions can remain unanswered.

**Evidence:**
- `mb-2026-08-30-finalisation`: "do we really need all of these?"
- `mb-2026-08-30-finalisation`: "If a match has started, the pre-match plan is finalised." (statement followed by implicit question)
- `mb-2026-08-29-rego`: "Should we remove this Rego gate entirely or should we default to true?"

**Confidence:** high

### Observation: Challenge questions
Questions that challenge assumptions or push back on suggestions.

**Evidence:**
- `mb-2026-08-29-english`: "Do not use 'hospitering' or 'hospitant' if this is not valid english"
- `mb-2026-08-30-finalisation`: "Another thing I have noticed is all the 'complete', 'finalize', 'lock' functionality at the differetn stages and routes, do we really need all of these?"

**Confidence:** high

### Observation: Self-check questions
Questions that check own understanding or invite correction.

**Evidence:**
- `mb-2026-08-30-kicks-weekly`: "I am also not sure I understand what you mean by 'true matchday mode' here"
- `music-2026-08-21-vocal-bleed`: "What about vocal bleed in drums mics?"

**Confidence:** high

---

## Sentence behaviour

### Observation: High variation in sentence length
Sentences range from very short (3-5 words) to very long (50+ words) within the same passage. No consistent target length.

**Evidence:**
- `hs-2026-09-01-infra`: 8 words
- `hs-2026-09-01-it-depends`: 80+ word sentence with accumulation

**Confidence:** high

### Observation: Fragments used for emphasis
Uses sentence fragments deliberately, not as errors.

**Evidence:**
- `hs-2026-09-01-infra`: "People and their feelings and reactions are also infra" (fragment functioning as standalone)
- `agent-2026-08-18-subfolder`: "I need a subfolder in .matchboard-work, I have multiple programmes here"

**Confidence:** moderate

### Observation: Long sentences for exploration
Long sentences used when working through a problem, not for decoration.

**Evidence:**
- `hs-2026-09-01-it-depends`: entire passage is one accumulating thought
- `mb-2026-08-29-situational-flows`: long sentence exploring different modes

**Confidence:** high

### Observation: Short compression after exploration
After long exploration, may compress into very short statement.

**Evidence:**
- `hs-2026-09-01-it-depends`: "Because it depends." (3 words after long list)
- `agent-2026-08-26-landed`: "I think we have landed this now"

**Confidence:** moderate

---

## Paragraph behaviour

### Observation: Paragraphs follow thought movement
Breaks paragraphs when footing changes, not for visual rhythm. Some paragraphs are dense; others are single lines.

**Evidence:**
- `hs-2026-09-01-uncertainty`: single long paragraph
- `hs-2026-09-01-it-depends`: multiple short paragraphs for emphasis

**Confidence:** moderate

### Observation: Asymmetry accepted
Paragraphs within the same passage vary significantly in length. No effort to balance.

**Evidence:**
- Across all samples, paragraph lengths are irregular

**Confidence:** high

---

## Emotional language

### Observation: Direct irritation or correction
States irritation or disagreement directly without softening.

**Evidence:**
- `mb-2026-08-29-english`: "Do not use 'hospitering' or 'hospitant' if this is not valid english"
- `hs-2026-09-01-public-language-problem`: "I have a problem with the way the agent is writing"

**Confidence:** high

### Observation: Enthusiasm without inflation
Shows enthusiasm with ordinary language, not superlatives.

**Evidence:**
- `mb-2026-08-29-situational-flows`: "There are different modes on the coach side I think as well"
- `mb-2026-08-27-demo-data`: "This is an opportunity to have some fun and be creative IMO"

**Confidence:** moderate

### Observation: Understatement
Downplays rather than inflates.

**Evidence:**
- `hs-2026-09-01-uncertainty`: "this is purely my thoughts"
- `mb-2026-08-26-landed`: "I think we have landed this now"

**Confidence:** moderate

---

## Humour and irony

### Observation: Dry escalation to absurdity
Lists ordinary factors, then includes absurd ones for contrast.

**Evidence:**
- `hs-2026-09-01-it-depends`: "which color it has, what shape it has, what country of origin it has" (escalation from reasonable to absurd)

**Confidence:** moderate

### Observation: Understated sarcasm
Sharp but not cruel. Aimed at ideas/systems, not individuals.

**Evidence:**
- `hs-2026-09-01-uncertainty`: "I also like some dry-humour, occasional sarcasm and opposite comparison etc. personally"

**Confidence:** high (self-reported)

### Observation: Opposite comparison
Uses contrast to expose contradiction.

**Evidence:**
- `hs-2026-09-01-it-depends`: "Everyone hates when a consultant says this, but I actually love it"

**Confidence:** high

---

## Punctuation and orthography

### Observation: Preserved typos in raw corpus
Does not self-correct typos mid-flow (`differetn`, `alot`).

**Evidence:**
- `mb-2026-08-30-finalisation`: "differetn"
- `mb-2026-08-26-locking-time`: "alot"

**Confidence:** high (but should not be replicated artificially)

### Observation: Ampersand in lists
Uses `&` in informal lists.

**Evidence:**
- `hs-2026-09-01-human-system`: "love & hate"
- `hs-2026-09-01-uncertainty`: "dry-humour, occasional sarcasm and opposite comparison etc."

**Confidence:** moderate

### Observation: Hyphenation varies
Uses `dry-humour`, `matchday`, `post-match` without consistent rules.

**Confidence:** moderate

---

## What this model does NOT prescribe

- **Sentence-length targets:** No "average 15 words" rule. Variation is the pattern.
- **Required repetition:** Repetition appears when the thought returns, not as a quota.
- **Mandatory humour:** Humour arises from the situation, not inserted per instruction.
- **Uncertainty as hedging:** Uncertainty is epistemic stance, not politeness strategy.
- **Fragment requirement:** Fragments appear for emphasis, not every paragraph.
- **Typo replication:** Typos are artifacts of chat speed, not deliberate style. Do not introduce errors artificially.

---

## Confidence summary

| Behaviour | Confidence | Surface variation |
|-----------|------------|-------------------|
| Clause accumulation | high | consistent across surfaces |
| Simple connectives | high | consistent |
| Qualification after commitment | high | stronger in reflective |
| First-person uncertainty | high | consistent |
| Deliberate repetition | high | strongest in reflective/argumentative |
| Ordinary vocabulary | high | consistent |
| Technical shorthand | high | technical surface only |
| Questions in reasoning | high | consistent |
| Sentence length variation | high | consistent |
| Paragraph asymmetry | high | consistent |
| Direct correction | high | argumentative surface |
| Dry humour/absurd escalation | moderate | reflective/argumentative |
| Opposite comparison | high | reflective/argumentative |

---

## Surface notes

### Reflective / conceptual
- Longer accumulative sentences
- More uncertainty markers
- More humour/absurd escalation
- First-person dominant

### Technical
- More questions (decision points)
- Technical shorthand without explanation
- Shorter sentences on average
- Direct correction when needed

### Argumentative / correction
- Direct imperatives ("Do not use...")
- Short compression
- Challenge questions
- Less qualification, more certainty

### Explanatory
- Mix of technical and ordinary
- Questions as inquiry, not challenge
- Moderate sentence length

---

## Held-out for evaluation

The following samples should **not** be used for profile compilation. Reserve for held-out evaluation:

- `coach-2026-08-31-belonging` (coaching surface)
- `mb-2026-08-29-collab-counter` (technical surface)
- `hs-2026-09-01-infra` (reflective surface)

These will be used to test whether profile-guided generation resembles held-out author behaviour without having seen these specific samples during compilation.

---

## Update protocol

When new corpus evidence is added:

1. Assess which surface(s) it belongs to
2. Compare against existing observations
3. Strengthen, weaken, or contradict existing observations as warranted
4. Update confidence levels
5. Retain uncertainty where evidence is mixed

Do not assume every new sample confirms the profile. A new sample may reveal that an observed behaviour is chat-specific rather than stable.

---

**Do not load raw corpus for normal generation.** Load this model instead.
