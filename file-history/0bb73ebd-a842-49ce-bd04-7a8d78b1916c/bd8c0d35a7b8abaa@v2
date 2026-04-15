#!/usr/bin/env bash
# Claude Code - Local Model Switcher
# Usage: source ~/.claude/local-models.sh [model|cloud]
# Models available on this machine via Ollama

OLLAMA_URL="http://localhost:11434"

# Available local models
declare -A MODELS=(
  [llama3.2]="llama3.2:3b"          # 2.0 GB - fast, general purpose
  [phi3.5]="phi3.5:3.8b"            # 2.2 GB - fast, efficient
  [mistral]="mistral:7b"            # 4.4 GB - strong general reasoning
  [deepseek-coder]="deepseek-coder:6.7b"  # 3.8 GB - coding focused
  [deepseek-r1]="deepseek-r1:7b"    # 4.7 GB - reasoning/thinking model
)

use_local() {
  local model_key="${1:-deepseek-coder}"
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
  echo "  source ~/.claude/local-models.sh llama3.2"
  echo "  source ~/.claude/local-models.sh deepseek-coder"
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
