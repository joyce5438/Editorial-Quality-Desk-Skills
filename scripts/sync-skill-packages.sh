#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
SOURCE_SKILL="$ROOT/SKILL.md"
SOURCE_REFS="$ROOT/references"

TARGETS=(
  "$ROOT/skills/editorial-quality-desk"
  "$ROOT/plugins/editorial-quality-desk/skills/editorial-quality-desk"
)

for target in "${TARGETS[@]}"; do
  mkdir -p "$target/references"
  cp "$SOURCE_SKILL" "$target/SKILL.md"
  rm -rf "$target/references"
  cp -R "$SOURCE_REFS" "$target/references"
done

echo "Editorial Quality Desk package copies synchronized from root source."
