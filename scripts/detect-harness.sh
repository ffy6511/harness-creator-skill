#!/bin/bash
set -euo pipefail

ROOT="${1:-.}"

has() {
  test -e "$ROOT/$1"
}

echo "Harness detection for: $ROOT"
echo

echo "Signals:"
for path in \
  "AGENTS.md" \
  "ARCHITECTURE.md" \
  "CLAUDE.md" \
  "specs/AGENTS.md" \
  "specs/active" \
  "docs/AGENTS.md" \
  "docs/lessons" \
  "docs/features" \
  "docs/decisions" \
  "feature_list.json" \
  "progress.md" \
  "session-handoff.md" \
  "init.sh" \
  "readiness-check.md"
do
  if has "$path"; then
    echo "  [x] $path"
  else
    echo "  [ ] $path"
  fi
done

echo

if has "specs/AGENTS.md" || has "specs/active" || has "docs/decisions"; then
  echo "Detected mode: spec-driven"
  echo "Recommendation: preserve the active spec as the main state source and keep docs as the durable knowledge companion."
elif has "feature_list.json" || has "progress.md"; then
  echo "Detected mode: feature-list-driven"
  echo "Recommendation: preserve the existing feature/progress control plane."
elif has "AGENTS.md" || has "ARCHITECTURE.md" || has "CLAUDE.md" || has "init.sh" || has "readiness-check.md"; then
  echo "Detected mode: minimal harness"
  echo "Recommendation: add only the weakest missing subsystem."
else
  echo "Detected mode: greenfield / no visible harness"
  echo "Recommendation: clarify architecture, workflow style, and readiness path before scaffolding."
fi
