#!/bin/bash
set -euo pipefail

if [ "$#" -lt 2 ]; then
  echo "Usage: $0 <target-dir> <spec-driven|feature-list>"
  exit 1
fi

TARGET_DIR="$1"
MODE="$2"
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
TEMPLATE_DIR="$(cd "$SCRIPT_DIR/../templates" && pwd)"

mkdir -p "$TARGET_DIR"

copy_template() {
  cp "$TEMPLATE_DIR/$1" "$TARGET_DIR/$2"
}

copy_template "agents.md" "AGENTS.md"
copy_template "architecture.md" "ARCHITECTURE.md"
ln -sfn "AGENTS.md" "$TARGET_DIR/CLAUDE.md"
copy_template "readiness-check.md" "readiness-check.md"
mkdir -p "$TARGET_DIR/docs/lessons" "$TARGET_DIR/docs/features" "$TARGET_DIR/docs/decisions"
copy_template "docs-agents.md" "docs/AGENTS.md"

case "$MODE" in
  spec-driven)
    mkdir -p "$TARGET_DIR/specs/draft" "$TARGET_DIR/specs/active" "$TARGET_DIR/specs/archive"
    copy_template "specs-agents.md" "specs/AGENTS.md"
    copy_template "active-spec.md" "specs/active/01-initial-plan.md"
    copy_template "docs-decision.md" "docs/decisions/00-initial-decision.md"
    copy_template "docs-feature.md" "docs/features/00-initial-feature.md"
    copy_template "docs-lesson.md" "docs/lessons/00-initial-lesson.md"
    ;;
  feature-list)
    copy_template "feature-list.json" "feature_list.json"
    copy_template "progress.md" "progress.md"
    copy_template "session-handoff.md" "session-handoff.md"
    copy_template "docs-feature.md" "docs/features/00-initial-feature.md"
    copy_template "docs-lesson.md" "docs/lessons/00-initial-lesson.md"
    ;;
  *)
    echo "Unknown mode: $MODE"
    echo "Expected one of: spec-driven, feature-list"
    exit 1
    ;;
esac

echo "Scaffolded $MODE harness in $TARGET_DIR"
echo "Review every copied template before using it in a real repo."
echo "Created CLAUDE.md symlink -> AGENTS.md"
