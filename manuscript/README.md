# Manuscript

**The working text of "Human System".**

---

## Core File

**`human.md`** — THE manuscript. One continuous walk.

This file is the canonical working text. It is not divided into chapters. Concepts accumulate as the walk continues. Chapter seams are discovered late, not imposed early.

---

## Structure

```
manuscript/
├── README.md           # This file
├── human.md            # The canonical working manuscript
├── drafts/             # Active editing pass work
│   ├── README.md
│   ├── active/         # Current working draft
│   └── pass-[a-e]/     # Pass-specific work directories
├── canonical/          # Locked, pass-complete versions
│   └── v0.1/           # First complete walk (when ready)
└── notes/              # Editorial memory
    ├── pattern-ledger.md       # Banned patterns (binding)
    └── seam-observations.md    # Where chapters might emerge
```

---

## Rules

1. **`human.md` is the source of truth** — all other files support work on this file
2. **Never edit `human.md` directly during a pass** — use `drafts/` directories
3. **One pass at a time** — declare the pass in `docs/current-state.md` before beginning (Class 5 work only; see ADR 002 §4)
4. **Ledger updates are mandatory** — no pass is complete without updating the Pattern Ledger and Concept Return Log
5. **Seams are observed, not decided** — chapter boundaries are discovered, not imposed

---

## Editing Passes

| Pass | Purpose | Invariant |
|------|---------|-----------|
| A | De-patterning | Must not reduce length |
| B | Causal tightening | No new ideas |
| C | Language & load balancing | No concept simplification |
| D | Continuity & concept return | No concept restarts |
| E | Final read integrity | No material changes unless violation |

See `docs/logs/editing-log.md` for completion criteria and templates.

---

## Before You Begin

1. Confirm Class 5 (Manuscript Work) applies and was explicitly requested (ADR 002 §4)
2. Read `docs/current-state.md` to confirm current state
3. Read `.agents/skills/human-systems-context/resources/source/book_work/writing-working-agreement.md`
4. Read `.agents/skills/human-systems-context/resources/source/book_work/EDITING_CHARTER.md`
5. Declare your pass in `docs/current-state.md`
6. Begin work in the appropriate `drafts/` directory

---

## Voice Reminders

- Spoken continuity overrides written clarity
- Long paragraphs are normal; short paragraphs are exceptional
- No punchlines, tidy landings, or rhetorical closures
- No binary contrast patterns ("not X, but Y")
- No direct definitions of enablement
- No turning insight into advice
- Behavior before abstraction
- Endings leave residue, not resolution
