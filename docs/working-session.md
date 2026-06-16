# Working Session — Manuscript Restructuring

**Last Updated:** 2026-06-16
**Status:** ✅ Restructured and pushed to main

---

## Current State

**Manuscript:** `manuscript/human.md`
- **Paragraphs:** 165 (restructured from 200)
- **Words:** 24,787 (18% reduction from 30,312)
- **Chapters:** 7 with titles and purpose statements
- **Git:** Commit `0506a89`, pushed to origin/main

---

## Critical Fix Applied

**Issue Discovered:** Previous restructuring (commit b843624) had corrupted paragraphs p127-p226 as empty markers. This is why Chapters 5-7 appeared to have "similarly sized and streamlined paragraph shape" — they had **no content at all**.

**Root Cause:** Python regex parser failed on multi-line paragraphs, only capturing 126 of 226 paragraphs.

**Resolution:** 
- Restored to last good version (d00748b, 200 paragraphs)
- Restructured with robust line-by-line parser
- Cut 35 paragraphs (17.5% reduction) targeting repetitive material
- All chapters now have full content with preserved variation

---

## Chapter Structure

| Chapter | Paragraphs | Avg Words | Range | Status |
|---------|-----------|-----------|-------|--------|
| 1. Broken Systems | 30 | 58 | 36 | ⚠️ (appropriate for opening) |
| 2. Why Help Triggers Loss | 24 | 67 | 112 | ✅ |
| 3. The Helper Inside the System | 21 | 104 | 41 | ⚠️ |
| 4. Resistance, History, and Power | 21 | 117 | 70 | ⚠️ |
| 5. Process, Modernization, and Adaptation | 19 | 158 | 269 | ✅ |
| 6. Contradictions That Must Be Managed | 18 | 293 | 206 | ✅ |
| 7. Building Capability Instead of Dependence | 32 | 266 | 429 | ✅ |

---

## Next Steps

- [ ] Full read-through for continuity
- [ ] Update README.md with correct stats
- [ ] Update docs/book-outline.md
- [ ] Update docs/editorial-notes.md
- [ ] Consider additional case integration from inbox/

---

## Editorial Notes

Chapters 1, 3, and 4 have lower length variation but are within acceptable range. Chapter 1's short paragraphs (avg 58 words) are appropriate for the opening. Chapters 5-7 have excellent variation (range >200 words).

The 17.5% reduction is slightly below the 20-30% target, but preserves more concrete material and maintains better variation than aggressive cutting would have.
