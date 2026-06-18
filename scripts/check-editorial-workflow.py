#!/usr/bin/env python3
"""
Editorial Workflow Validation Script

Checks for common drift patterns in the human-system repository.

Exit codes:
- 0: All checks passed
- 1: One or more checks failed
- 2: Script error (missing files, etc.)

Usage:
    python3 scripts/check-editorial-workflow.py

Run before committing editorial workflow changes.
"""

import os
import sys
import re
from pathlib import Path

# Configuration
REPO_ROOT = Path(__file__).parent.parent
MANUSCRIPT_PATH = REPO_ROOT / "manuscript" / "human.md"
CURRENT_STATE_PATH = REPO_ROOT / "docs" / "current-state.md"
README_PATH = REPO_ROOT / "README.md"
SKILL_PATH = REPO_ROOT / ".agents" / "skills" / "human-systems-context" / "SKILL.md"

# Patterns that indicate stale or problematic content
# Note: These check for DIRECT claims, not references to claims in other files
STALE_PATTERNS = {
    "publication_ready": [
        r"\*\*Status:\*\*\s*Publication-ready",
        r"is publication-ready",
        r"manuscript is publication-ready",
    ],
    "final_claims": [
        r"final editorial pass complete",
        r"all contracts met",
        r"all issues resolved",
    ],
    "framework_metadata": [
        r"four pulls.*explicit",
        r"fifteen resistance categories",
        r"four power families",
        r"five contradictions.*with",
        r"six diagnostic questions",
    ],
}

# Files that should exist
REQUIRED_FILES = [
    "AGENTS.md",
    "README.md",
    "manuscript/human.md",
    "docs/current-state.md",
    ".agents/skills/human-systems-context/SKILL.md",
]


def check_file_exists(path: Path, description: str) -> bool:
    """Check if a required file exists."""
    if path.exists():
        print(f"✓ {description}: {path.relative_to(REPO_ROOT)}")
        return True
    else:
        print(f"✗ {description} MISSING: {path.relative_to(REPO_ROOT)}")
        return False


def check_no_stale_claims(file_path: Path, file_label: str) -> bool:
    """Check that a file does not contain stale publication or framework claims."""
    if not file_path.exists():
        return True  # Skip if file doesn't exist (caught by other check)
    
    content = file_path.read_text()
    issues = []
    
    for category, patterns in STALE_PATTERNS.items():
        for pattern in patterns:
            if re.search(pattern, content, re.IGNORECASE):
                issues.append(f"  - {category}: '{pattern}' found")
    
    if issues:
        print(f"✗ {file_label} contains stale claims:")
        for issue in issues:
            print(issue)
        return False
    else:
        print(f"✓ {file_label}: No stale claims detected")
        return True


def check_word_count_consistency() -> bool:
    """Check that word count in current-state.md matches manuscript."""
    import subprocess
    
    # Get actual word count
    try:
        result = subprocess.run(
            ["wc", "-w", str(MANUSCRIPT_PATH)],
            capture_output=True,
            text=True
        )
        actual_count = int(result.stdout.split()[0])
    except Exception as e:
        print(f"✗ Could not get manuscript word count: {e}")
        return False
    
    # Get stated word count in current-state.md
    if not CURRENT_STATE_PATH.exists():
        print(f"✗ current-state.md does not exist")
        return False
    
    content = CURRENT_STATE_PATH.read_text()
    match = re.search(r"Word count[:\s]+(\d+)", content, re.IGNORECASE)
    
    if not match:
        print(f"⚠ current-state.md: Word count not found (may need update)")
        return True  # Warning, not failure
    
    stated_count = int(match.group(1))
    
    if stated_count == actual_count:
        print(f"✓ Word count consistent: {actual_count}")
        return True
    else:
        print(f"✗ Word count mismatch: stated={stated_count}, actual={actual_count}")
        return False


def check_single_current_state() -> bool:
    """Verify only one current-state.md exists."""
    current_state_files = list(REPO_ROOT.rglob("current-state.md"))
    
    if len(current_state_files) == 1:
        print(f"✓ Single current-state file: {current_state_files[0].relative_to(REPO_ROOT)}")
        return True
    else:
        print(f"✗ Multiple current-state files found:")
        for f in current_state_files:
            print(f"  - {f.relative_to(REPO_ROOT)}")
        return False


def check_manuscript_canonical() -> bool:
    """Verify manuscript canonical path is clear."""
    manuscript = REPO_ROOT / "manuscript" / "human.md"
    skill_manuscript = REPO_ROOT / ".agents" / "skills" / "human-systems-context" / "resources" / "source" / "book_work" / "human.md"
    
    if not manuscript.exists():
        print(f"✗ Canonical manuscript missing: {manuscript.relative_to(REPO_ROOT)}")
        return False
    
    if skill_manuscript.exists():
        # Check if current-state.md marks it as stale
        content = CURRENT_STATE_PATH.read_text() if CURRENT_STATE_PATH.exists() else ""
        if "stale snapshot" in content.lower() or "do not edit" in content.lower():
            print(f"✓ Skill manuscript copy marked as stale snapshot")
        else:
            print(f"⚠ Skill manuscript copy exists but may not be marked as stale")
    
    print(f"✓ Canonical manuscript exists: {manuscript.relative_to(REPO_ROOT)}")
    return True


def check_no_pass_blending() -> bool:
    """Check that current-state.md declares at most one active pass."""
    if not CURRENT_STATE_PATH.exists():
        return True
    
    content = CURRENT_STATE_PATH.read_text()
    
    # Count active pass declarations
    active_matches = re.findall(r"\*\*Active pass:\*\*\s*(\w+)", content)
    
    if len(active_matches) == 0:
        print(f"✓ No active pass declared (correct for between-passes state)")
        return True
    elif len(active_matches) == 1:
        print(f"✓ Single active pass declared: {active_matches[0]}")
        return True
    else:
        print(f"✗ Multiple active passes declared: {active_matches}")
        return False


def run_all_checks() -> int:
    """Run all validation checks. Return exit code."""
    print("=" * 60)
    print("Editorial Workflow Validation")
    print("=" * 60)
    print()
    
    all_passed = True
    
    # Check required files
    print("--- Required Files ---")
    for file_path in REQUIRED_FILES:
        full_path = REPO_ROOT / file_path
        if not check_file_exists(full_path, file_path):
            all_passed = False
    print()
    
    # Check for stale claims
    print("--- Stale Claims Check ---")
    stale_files = [
        (README_PATH, "README.md"),
        (CURRENT_STATE_PATH, "current-state.md"),
    ]
    for file_path, label in stale_files:
        if not check_no_stale_claims(file_path, label):
            all_passed = False
    print()
    
    # Check word count consistency
    print("--- Word Count Consistency ---")
    if not check_word_count_consistency():
        all_passed = False
    print()
    
    # Check single current-state file
    print("--- Single Current-State File ---")
    if not check_single_current_state():
        all_passed = False
    print()
    
    # Check manuscript canonical path
    print("--- Manuscript Canonical Path ---")
    if not check_manuscript_canonical():
        all_passed = False
    print()
    
    # Check no pass blending
    print("--- Active Pass Declaration ---")
    if not check_no_pass_blending():
        all_passed = False
    print()
    
    # Summary
    print("=" * 60)
    if all_passed:
        print("✓ All checks passed")
        print("=" * 60)
        return 0
    else:
        print("✗ Some checks failed - review before committing")
        print("=" * 60)
        return 1


if __name__ == "__main__":
    os.chdir(REPO_ROOT)
    sys.exit(run_all_checks())
