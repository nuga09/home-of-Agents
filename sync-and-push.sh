#!/usr/bin/env bash
set -euo pipefail

CLAUDE_DIR="$HOME/.claude"
AGENT_DIR="$HOME/Agent"

echo "Syncing from $CLAUDE_DIR → $AGENT_DIR"

# Rules
rsync -a "$CLAUDE_DIR/rules/" "$AGENT_DIR/rules/"

# Skills
rsync -a "$CLAUDE_DIR/skills/" "$AGENT_DIR/skills/"

# Plugins (exclude session/volatile files)
rsync -a \
  --exclude='*.jsonl' \
  "$CLAUDE_DIR/plugins/" "$AGENT_DIR/plugins/"

# Agents
rsync -a "$CLAUDE_DIR/agents/" "$AGENT_DIR/agents/"

# Templates
rsync -a "$CLAUDE_DIR/templates/" "$AGENT_DIR/templates/"

# Commands
rsync -a "$CLAUDE_DIR/commands/" "$AGENT_DIR/commands/"

# Config files
cp "$CLAUDE_DIR/settings.json" "$AGENT_DIR/settings.json"
cp "$CLAUDE_DIR/local-models.sh" "$AGENT_DIR/local-models.sh"
cp "$CLAUDE_DIR/litellm_config.yaml" "$AGENT_DIR/litellm_config.yaml"
cp "$CLAUDE_DIR/thinking_stripper.py" "$AGENT_DIR/thinking_stripper.py"
cp "$CLAUDE_DIR/impeccable_CLAUDE.md" "$AGENT_DIR/impeccable_CLAUDE.md"

# Memory (exclude session .jsonl files)
rsync -a \
  --exclude='*.jsonl' \
  "$CLAUDE_DIR/projects/-home-nugad/memory/" \
  "$AGENT_DIR/projects/-home-nugad/memory/"

# Check for changes
cd "$AGENT_DIR"

if git diff --quiet && git diff --cached --quiet && [ -z "$(git ls-files --others --exclude-standard)" ]; then
  echo "Nothing to commit — already up to date."
  exit 0
fi

git add -A

TIMESTAMP=$(date '+%Y-%m-%d %H:%M:%S')
CHANGED=$(git diff --cached --name-only | wc -l | tr -d ' ')

git commit -m "$(cat <<EOF
chore: sync from .claude [$TIMESTAMP]

$CHANGED file(s) updated.

Co-Authored-By: Claude Sonnet 4.6 <noreply@anthropic.com>
EOF
)"

git push origin master

echo "Done — $CHANGED file(s) pushed to origin/master."
