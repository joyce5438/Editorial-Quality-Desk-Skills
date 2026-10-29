#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
SOURCE_SKILL="$ROOT/SKILL.md"
SOURCE_REFS="$ROOT/references"

TARGETS=(
  "$ROOT/skills/ideo-edit"
  "$ROOT/plugins/ideo-edit/skills/ideo-edit"
)

for target in "${TARGETS[@]}"; do
  mkdir -p "$target/references"
  cp "$SOURCE_SKILL" "$target/SKILL.md"
  rm -rf "$target/references"
  cp -R "$SOURCE_REFS" "$target/references"
done

echo "Ideo Edit package copies synchronized from root source."
