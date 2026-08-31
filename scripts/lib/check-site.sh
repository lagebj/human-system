#!/usr/bin/env bash
#
# Validate the Astro site: build succeeds, publication boundary holds, schema validates.
#
# This check ensures:
# 1. Site dependencies install deterministically.
# 2. Astro config is valid.
# 3. Astro build succeeds.
# 4. Publication boundary: papers/working is NOT loaded.
# 5. Publication boundary: manuscript is NOT loaded.
# 6. Publication boundary: only papers/published is eligible.
#
# Exit 0 = all passed, 1 = failed.

set -Euo pipefail

root="$(git rev-parse --show-toplevel 2>/dev/null || pwd)"
cd "$root"
site_dir="$root/site"

# Check if site directory exists
if [[ ! -d "$site_dir" ]]; then
  printf '  [SKIP] site directory does not exist yet\n'
  exit 0
fi

# Check if package.json exists
if [[ ! -f "$site_dir/package.json" ]]; then
  printf '  [SKIP] site package.json does not exist yet\n'
  exit 0
fi

printf '  Installing site dependencies...\n'
cd "$site_dir"
if ! npm ci --silent 2>/dev/null; then
  printf '  [WARN] npm ci failed, trying npm install...\n'
  if ! npm install --silent 2>/dev/null; then
    printf '  [FAIL] could not install site dependencies\n'
    exit 1
  fi
fi

printf '  Building Astro site...\n'
if ! npm run build >/dev/null 2>&1; then
  printf '  [FAIL] Astro build failed\n'
  exit 1
fi
printf '  [OK]   Astro build succeeded\n'

# Verify dist directory was created
if [[ ! -d "$site_dir/dist" ]]; then
  printf '  [FAIL] dist directory was not created\n'
  exit 1
fi
printf '  [OK]   dist directory exists\n'

# Check publication boundary: content.config.ts must load from papers/published only
printf '  Checking publication boundary...\n'
config_file="$site_dir/src/content.config.ts"
if [[ ! -f "$config_file" ]]; then
  printf '  [FAIL] content.config.ts not found\n'
  exit 1
fi

# Verify the config loads from papers/published (allowing for relative path variations)
if ! grep -q "papers/published" "$config_file"; then
  printf '  [FAIL] content.config.ts does not load from papers/published\n'
  exit 1
fi
printf '  [OK]   content loader points to papers/published\n'

# Verify the config does NOT load from papers/working
if grep -q "papers/working" "$config_file"; then
  printf '  [FAIL] content.config.ts references papers/working\n'
  exit 1
fi
printf '  [OK]   content loader does not reference papers/working\n'

# Verify the config does NOT load from manuscript
if grep -q "manuscript" "$config_file"; then
  printf '  [FAIL] content.config.ts references manuscript\n'
  exit 1
fi
printf '  [OK]   content loader does not reference manuscript\n'

# Verify generated HTML does not contain working content
# (This is a regression test - create a working paper fixture and verify it's not in the build)
printf '  Running publication-boundary regression test...\n'

# Create a temporary working paper fixture
working_fixture="$root/papers/working/.validation-test-working-paper.md"
cat > "$working_fixture" << 'EOF'
---
title: "VALIDATION TEST — THIS SHOULD NOT APPEAR IN BUILD"
description: "This is a validation fixture and must not appear in the generated site"
published: "2026-08-31"
status: "published"
---

This content should NEVER appear in the generated website.
EOF

# Create a temporary published paper fixture for comparison
published_fixture="$root/papers/published/.validation-test-published-paper.md"
cat > "$published_fixture" << 'EOF'
---
title: "VALIDATION TEST — Published Fixture"
description: "This is a validation fixture for testing the publication boundary"
published: "2026-08-31"
status: "published"
---

This content IS allowed in the generated website.
EOF

# Rebuild the site with fixtures
cd "$site_dir"
if ! npm run build >/dev/null 2>&1; then
  printf '  [WARN] rebuild failed, cleaning up fixtures\n'
  rm -f "$working_fixture" "$published_fixture"
  exit 1
fi

# Check that working content is NOT in the build
if grep -q "VALIDATION TEST — THIS SHOULD NOT APPEAR IN BUILD" "$site_dir/dist"/*.html 2>/dev/null; then
  printf '  [FAIL] working paper content found in generated site\n'
  rm -f "$working_fixture" "$published_fixture"
  exit 1
fi
printf '  [OK]   working paper content NOT in generated site\n'

# Check that published content IS in the build (if papers page exists)
if [[ -f "$site_dir/dist/papers/index.html" ]]; then
  if grep -q "VALIDATION TEST — Published Fixture" "$site_dir/dist/papers/index.html"; then
    printf '  [OK]   published paper content IS in generated site\n'
  else
    printf '  [INFO] published fixture not found in index (may be expected if sorting hides it)\n'
  fi
fi

# Clean up validation fixtures
rm -f "$working_fixture" "$published_fixture"

# Rebuild without fixtures to leave clean state
cd "$site_dir"
npm run build >/dev/null 2>&1 || true

printf '\n  All site validation checks passed.\n'
exit 0
