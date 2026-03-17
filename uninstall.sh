#!/usr/bin/env bash
set -euo pipefail

REPO_DIR="$(cd "$(dirname "$0")" && pwd)"
COMMANDS_SRC="$REPO_DIR/commands"
COMMANDS_DST="$HOME/.claude/commands"

for file in "$COMMANDS_SRC"/*.md; do
  name="$(basename "$file")"
  target="$COMMANDS_DST/$name"

  if [ -L "$target" ]; then
    rm "$target"
    echo "✓  Removed $name"
  fi
done

echo "Done."
