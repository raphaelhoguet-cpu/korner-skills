#!/usr/bin/env bash
set -euo pipefail

REPO_DIR="$(cd "$(dirname "$0")" && pwd)"
COMMANDS_SRC="$REPO_DIR/commands"
COMMANDS_DST="$HOME/.claude/commands"

mkdir -p "$COMMANDS_DST"

for file in "$COMMANDS_SRC"/*.md; do
  name="$(basename "$file")"
  target="$COMMANDS_DST/$name"

  if [ -L "$target" ]; then
    rm "$target"
  elif [ -f "$target" ]; then
    echo "⚠  $name already exists (not a symlink) — skipping. Remove it manually to install."
    continue
  fi

  ln -s "$file" "$target"
  echo "✓  $name → $target"
done

echo ""
echo "Done. Available commands in Claude Code:"
for file in "$COMMANDS_SRC"/*.md; do
  echo "  /$(basename "$file" .md)"
done
