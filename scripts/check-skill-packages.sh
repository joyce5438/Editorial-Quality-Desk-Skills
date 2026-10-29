#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
SOURCE_SKILL="$ROOT/SKILL.md"
SOURCE_REFS="$ROOT/references"

TARGETS=(
  "$ROOT/skills/ideo-edit"
  "$ROOT/plugins/ideo-edit/skills/ideo-edit"
)

failed=0
for target in "${TARGETS[@]}"; do
  if ! cmp -s "$SOURCE_SKILL" "$target/SKILL.md"; then
    echo "::error file=${target#$ROOT/}/SKILL.md::Packaged SKILL.md is out of sync with root SKILL.md"
    failed=1
  fi
  if ! diff -qr "$SOURCE_REFS" "$target/references"; then
    echo "::error::Packaged references in ${target#$ROOT/} are out of sync with root references/"
    failed=1
  fi
done

if [[ "$failed" -ne 0 ]]; then
  echo
  echo "Run: bash scripts/sync-skill-packages.sh"
  exit 1
fi

echo "All packaged skill copies match the root source."
