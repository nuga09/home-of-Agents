#!/usr/bin/env bash
# Claude Code - Local Model Switcher
# Usage: source ~/.claude/local-models.sh [model|cloud]
# Models available on this machine via Ollama

OLLAMA_URL="http://localhost:11434"

# Available local models
declare -A MODELS=(
  [qwen3.5]="qwen3.5:9b"                  # 6.6 GB - general purpose
  [gemma4]="gemma4:e4b"                   # 9.6 GB - general purpose
  [qwen3]="qwen3:14b""         # 9.0 GB - reasoning/thinking model
  [nomic-embed]="nomic-embed-text:latest" # 274 MB - embeddings
)

use_local() {
  local model_key="${1:-qwen3.6-coder}"
  local model_name="${MODELS[$model_key]}"

  if [[ -z "$model_name" ]]; then
    echo "Unknown model: $model_key"
    echo "Available: ${!MODELS[*]}"
    return 1
  fi

  # Check Ollama is running
  if ! curl -sf "$OLLAMA_URL/api/tags" > /dev/null 2>&1; then
    echo "Ollama not running. Start it with: ollama serve"
    return 1
  fi

  export ANTHROPIC_AUTH_TOKEN=ollama
  export ANTHROPIC_BASE_URL="$OLLAMA_URL"
  export ANTHROPIC_MODEL="$model_name"

  echo "Switched to LOCAL: $model_name"
  echo "Run 'claude' to start a session with this model."
}

use_cloud() {
  unset ANTHROPIC_AUTH_TOKEN
  unset ANTHROPIC_BASE_URL
  unset ANTHROPIC_MODEL
  echo "Switched to CLOUD (Anthropic API)"
}

list_models() {
  echo "=== Local Models (Ollama) ==="
  for key in "${!MODELS[@]}"; do
    printf "  %-18s %s\n" "$key" "${MODELS[$key]}"
  done | sort
  echo ""
  echo "Usage:"
  echo "  source ~/.claude/local-models.sh qwen3.5"
  echo "  source ~/.claude/local-models.sh gemma4"
  echo "  source ~/.claude/local-models.sh qwen3:14b""
  echo "  source ~/.claude/local-models.sh cloud"
}

# If called with an argument, act on it
if [[ "${BASH_SOURCE[0]}" != "${0}" ]]; then
  # Script is being sourced
  case "${1:-}" in
    cloud)       use_cloud ;;
    list|"")     list_models ;;
    *)           use_local "$1" ;;
  esac
else
  echo "This script must be sourced, not executed."
  echo "Usage: source ~/.claude/local-models.sh [model|cloud|list]"
fi
