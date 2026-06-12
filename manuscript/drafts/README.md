# Drafts

**Working directory for active editing passes.**

---

## Structure

```
drafts/
├── README.md              # This file
├── active/                # Current working draft
│   └── human.md           # Active work in progress
├── pass-a/                # De-patterning work
├── pass-b/                # Causal tightening work
├── pass-c/                # Language & load balancing
├── pass-d/                # Continuity & concept return
└── pass-e/                # Final read integrity
```

---

## Workflow

### Starting a Pass

1. Declare the pass in `docs/working-session.md`
2. Copy `manuscript/human.md` to the appropriate pass directory:
   ```bash
   cp manuscript/human.md manuscript/drafts/pass-a/human.md
   ```
3. Work on the copy in the pass directory
4. Optionally symlink or copy to `active/` for convenience

### Completing a Pass

1. Verify completion criteria (see `docs/editing-log.md`)
2. Update ledgers as needed
3. Merge changes back to `manuscript/human.md`
4. Log the pass in `docs/editing-log.md`
5. Clean up the pass directory

---

## Rules

- Only **one pass active at a time**
- Never work directly on `manuscript/human.md` during a pass
- Pass directories are temporary — clean them after merging
- The `active/` directory is for convenience only

---

## Pass Definitions

| Pass | Purpose | Key Constraint |
|------|---------|----------------|
| A | De-patterning | Must not reduce length |
| B | Causal tightening | No new ideas |
| C | Language & load | No concept simplification |
| D | Continuity | No concept restarts |
| E | Final integrity | No material changes unless violation |
