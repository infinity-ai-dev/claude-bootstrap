#!/usr/bin/env bash
# Regenera payload/ a partir do ambiente Claude desta máquina (a "referência").
# Rode aqui no host de dev sempre que skills/regras globais mudarem, e commite.
set -euo pipefail
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
rm -rf "$SCRIPT_DIR/payload/skills" "$SCRIPT_DIR/payload/rules"
mkdir -p "$SCRIPT_DIR/payload/rules"
# -L resolve symlinks (algumas skills apontam para .agents/skills)
cp -rL "$HOME/.claude/skills" "$SCRIPT_DIR/payload/skills"
cp "$HOME/.claude/rules/"*.md "$SCRIPT_DIR/payload/rules/"
echo "payload/ regenerado:"
du -sh "$SCRIPT_DIR/payload/skills"/* "$SCRIPT_DIR/payload/rules"
