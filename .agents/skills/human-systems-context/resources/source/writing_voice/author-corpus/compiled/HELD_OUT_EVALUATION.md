# Held-Out Evaluation Set

**Purpose:** Test whether profile-guided generation resembles held-out author behaviour without having seen these specific samples during compilation.

**Version:** 1.0  
**Created:** 2026-09-01

---

## Held-out samples

The following samples are **reserved for evaluation only**. They must NOT be used for profile compilation.

### 1. Coaching surface
**File:** `raw/coaching/seed-coaching.md` (to be created)  
**Sample:** `coach-2026-08-31-belonging`  
**Domain:** Coaching / player development  
**Provenance:** `direct-user-message`

**Excerpt:**
> [Reserved - not shown to prevent accidental contamination]

### 2. Technical surface
**File:** `raw/technical/seed-technical.md`  
**Sample:** `mb-2026-08-29-collab-counter`  
**Domain:** Matchboard / collaboration flows  
**Provenance:** `direct-user-message`

**Excerpt:**
> A request for players should also be an email for visibility as quickly as possible. If we are to support requesting specific players, we must also support rejecting that specific player and providing a counter-suggestion.

### 3. Reflective surface
**File:** `raw/reflective/seed-reflective.md`  
**Sample:** `hs-2026-09-01-infra`  
**Domain:** Human System / infrastructure  
**Provenance:** `direct-user-message`

**Excerpt:**
> People and their feelings and reactions are also infra

### 4. Matchboard thought trail
**File:** `thought-trails/matchboard/mb-cross-team-collaboration.md`  
**Domain:** Matchboard / cross-team collaboration  
**Provenance:** `direct-user-message sequence`

### 5. Coaching thought trail
**File:** `thought-trails/coaching/coach-interest-belonging.md`  
**Domain:** Coaching / player belonging  
**Provenance:** `direct-user-message sequence`

---

## Evaluation procedure

### Step 1: Generate test passages

For each held-out sample:

1. Create a new seed on a similar topic (but not the same)
2. Generate a passage using **only** the compiled models:
   - `LANGUAGE_MODEL.md`
   - `THOUGHT_MOVEMENT_MODEL.md` (for substantial writing)
   - `CONTRASTIVE_MODEL.md`
   - Relevant surface profile
3. Do NOT load the held-out sample itself

### Step 2: Compare against held-out sample

Compare the generated passage against the held-out sample on these dimensions:

| Dimension | Question | Rating (1-5) |
|-----------|----------|--------------|
| Clause construction | Does it show similar accumulation patterns? | |
| Connectives | Does it use simple connectives similarly? | |
| Uncertainty markers | Does it show similar epistemic stance? | |
| Repetition | Does it repeat key phrases deliberately? | |
| Vocabulary register | Does it mix ordinary/technical similarly? | |
| Questions | Does it use questions in reasoning similarly? | |
| Sentence variation | Does it show similar length variation? | |
| Emotional presence | Does it show similar emotional traces? | |
| Humour/irony | Does it show similar dry humour (if applicable)? | |
| Compression | Does it compress after exploration? | |

### Step 3: Compare against generic baseline

Generate the same passage using generic model defaults (no compiled profiles). Compare:

| Question | Profile-guided | Generic | Winner |
|----------|---------------|---------|--------|
| Closer to held-out author behaviour? | | | |
| Avoids model-default drift? | | | |
| Preserves uncertainty appropriately? | | | |
| Shows thought movement (not just expansion)? | | | |

### Step 4: Historical-overlap check

Run the overlap detection script:

```bash
node scripts/overlap-check.js <generated-passage> .agents/skills/human-systems-context/resources/source/writing_voice/author-corpus/
```

Verify:
- No flagged overlaps with historical corpus (except legitimate current-seed)
- Common phrases not falsely flagged
- Project terminology not falsely rejected

### Step 5: Reader test

Run the reader test on the profile-guided generation:

- Does it read as authentic voice?
- Does it avoid generic AI structure?
- Does the thought develop (not just expand)?
- Is uncertainty preserved?

---

## Success criteria

Profile-guided generation passes if:

1. ✓ Average rating ≥3.5 across all dimensions (Step 2)
2. ✓ Profile-guided wins ≥7/10 comparisons against generic (Step 3)
3. ✓ No suspicious historical overlap detected (Step 4)
4. ✓ Reader test reports authentic voice without generic AI structure (Step 5)

---

## Test fixtures

### Test A: New Human System seed (reflective surface)

**Seed:** [Create new 1-2 sentence seed about a Human System concept not in corpus]

**Generate:**
- With compiled profiles
- With generic defaults

**Compare:** Against `hs-2026-09-01-infra` (held-out)

### Test B: Technical reasoning (technical surface)

**Seed:** [Create new technical problem not in Matchboard corpus]

**Generate:**
- With compiled profiles + technical surface
- With generic defaults

**Compare:** Against `mb-2026-08-29-collab-counter` (held-out)

### Test C: Reflective conceptual writing (reflective surface)

**Seed:** [Create new reflective question not in corpus]

**Generate:**
- With compiled profiles + thought movement model
- With generic defaults

**Compare:** Against `hs-2026-09-01-infra` (held-out)

### Test D: Final integrity test (novel topic)

**Seed:** Completely novel topic not represented in:
- Raw corpus
- Thought trails
- Human System papers
- Matchboard material

**Example seed:** "What does it mean for a software system to age gracefully?"

**Generate:**
- With compiled profiles (reflective surface)
- With thought movement model
- With generic defaults

**Check:**
1. Does it show author-like linguistic behaviour?
2. Does it avoid recognizable historical phrases?
3. Does it avoid generic polished AI structure?
4. Does the thought develop rather than merely expand?
5. Does it still sound plausible on a subject the author never discussed?

**This is the strongest practical test.**

---

## Recording results

Create a test results file:

```markdown
# Held-Out Evaluation Results

**Date:** [DATE]
**Evaluator:** [AGENT/HUMAN]

## Test A: Reflective surface
- Rating: X/5
- Profile vs. Generic: X/10 wins for profile
- Overlap check: PASS/FAIL
- Reader test: PASS/FAIL

## Test B: Technical surface
[...]

## Test C: Reflective conceptual
[...]

## Test D: Novel topic (integrity test)
[...]

## Overall verdict
PASS / FAIL / PARTIAL

## Notes
[...]
```

---

## Update protocol

When new author material is explicitly added to the corpus:

1. Assess whether it should be added to held-out set or compilation set
2. If added to compilation, remove from held-out
3. If held-out set becomes too small (<3 samples), add new held-out samples
4. Re-run evaluation after major profile updates

---

**Do not use held-out samples for compilation.** They are the evaluation baseline.
