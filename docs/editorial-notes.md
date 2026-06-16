# Editorial Notes

**Last Updated:** 2026-06-16
**Purpose:** Document editorial decisions, cuts, and technical issues for future reference

---

## Critical Issue: Manuscript Corruption (2026-06-16)

### What Happened

During restructuring commit `b843624`, paragraphs p127-p226 were written as **empty markers** (`**p127** —` with no content after the em dash). This affected Chapters 5-7, which appeared to have "similarly sized and streamlined paragraph shape" because they had **no content at all**.

### Root Cause

The Python restructuring script used a regex parser that failed on multi-line paragraphs:

```python
# FAILED: Only captured single-line paragraphs
re.finditer(r'\*\*p(\d+)\*\* — (.*?)(?=\n\n\*\*p\d+\*\* — |\Z)', content, re.DOTALL)
# Result: 126 paragraphs found instead of 226
```

The regex only matched paragraphs where all content was on the same line as the `**pN** —` marker. Multi-line paragraphs (which are common in this manuscript) were not captured.

### Detection

User feedback: "From Chapter 5 and onwards, we seem to have removed entire paragraphs and ended in very similarly sized and streamlined paragraph shape, what happened here?"

Investigation revealed:
```bash
grep "^\*\*p127" manuscript/human.md
# Output: **p127** —
# (nothing after the em dash = empty)

git show d00748b:manuscript/human.md | grep "^\*\*p127"
# Output: **p127** — The governance will need to evolve...
# (full content present)
```

### Resolution

1. Identified last good commit: `d00748b` (200 paragraphs, 30,312 words, full content)
2. Restored manuscript: `git checkout d00748b -- manuscript/human.md`
3. Rewrote parser using line-by-line state machine approach
4. Restructured with intelligent cuts preserving variation
5. Force-pushed to replace corrupted commit

**Fix Commit:** `0506a89` — 165 paragraphs, 24,787 words, all content present

### Lesson for Future Work

Never use regex-based parsing for this manuscript format. Multi-line paragraphs are the norm, not the exception. Always use line-by-line state machine parsing:

```python
# SUCCESSFUL: Line-by-line state machine
paragraphs = {}
current = None

for i, line in enumerate(lines):
    if line.startswith('**p') and ' — ' in line:
        num = int(line[3:line.find('**', 3)])
        current = num
        if num not in paragraphs:
            paragraphs[num] = []
        paragraphs[num].append(i)
    elif current and line.strip():
        paragraphs[current].append(i)  # Continuation line
```

---

## Restructuring Decisions (2026-06-16)

### Cut Strategy

From 200 paragraphs (30,312 words) to 165 paragraphs (24,787 words) — 17.5% reduction.

**Cuts by chapter:**
- Chapter 2: paragraphs 38, 45, 52 (3 cuts — repetitive framing)
- Chapter 3: paragraphs 59, 68, 73, 74 (4 cuts — consolidation of helper positioning)
- Chapter 4: paragraphs 82, 88, 89, 90, 95 (5 cuts — removed repetitive resistance examples)
- Chapter 5: paragraphs 103, 108, 109, 110, 115, 118 (6 cuts — process theater repetition)
- Chapter 6: paragraphs 123, 128, 129, 130, 133, 135, 137 (7 cuts — contradiction restatements)
- Chapter 7: paragraphs 155-164 (10 cuts — repetitive reflection material)

**Total:** 35 paragraphs removed

### Rationale

The 17.5% reduction is slightly below the original 20-30% target, but this was intentional:

1. **Preserve variation:** Aggressive cutting would have created uniform paragraph lengths
2. **Keep concrete material:** Removed abstract repetition, kept grounded examples
3. **Maintain concept accumulation:** Ensured ideas build across chapters without gaps

### Chapter Boundaries

Hard boundaries established (no paragraph spans multiple chapters):

| Chapter | Paragraphs | Purpose |
|---------|-----------|---------|
| 1. Broken Systems and the Human Load They Create | p1-p30 | How organizations build systems that create human friction |
| 2. Why Help Triggers Loss | p31-p54 | Interventions relocate uncertainty and learning |
| 3. The Helper Inside the System | p55-p75 | Your position determines what you can see and change |
| 4. Resistance, History, and Power | p76-p96 | Resistance often carries legitimate history |
| 5. Process, Modernization, and Adaptation | p97-p115 | Process can be remedy, scaffold, scar tissue, or theater |
| 6. Contradictions That Must Be Managed | p116-p133 | Inherent tensions that cannot be solved, only held |
| 7. Building Capability Instead of Dependence | p134-p165 | Shifting from delivery to capability transfer |

---

## Editorial Charter Compliance

All edits follow `EDITING_CHARTER.md` rules:

- ✅ **Variation is mandatory** — Chapters 5-7 have range >200 words
- ✅ **Unevenness is normal** — No mechanical uniformity
- ✅ **Medium-to-long paragraphs default** — Average 150 words
- ✅ **Continuous thought breaths** — No artificial breaks
- ✅ **No tidy closures** — Paragraphs end in motion

---

## Pending Editorial Work

- [ ] Full continuity read-through (verify concept accumulation across chapters)
- [ ] Consider integrating `inbox/2026-06-12-alert-gut-feelings.md` for concrete embodiment
- [ ] Optional: Increase variation in Chapters 3 and 4 (range 41 and 70)

---

## Version History

| Commit | Date | Paragraphs | Words | Notes |
|--------|------|-----------|-------|-------|
| d00748b | 2026-06-12 | 200 | 30,312 | Last good version before corruption |
| b843624 | 2026-06-16 | 226 | ~24k | CORRUPTED — p127-p226 empty |
| 0506a89 | 2026-06-16 | 165 | 24,787 | Fixed and restructured |
