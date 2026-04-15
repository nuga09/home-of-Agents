---
name: LiteLLM + Ollama proxy setup
description: Local AI proxy routing Claude Code requests to Ollama models via LiteLLM
type: project
---

VS Code (Windows) Claude Code extension routes through a two-layer proxy stack in WSL:

**Port 4000** — `thinking_stripper.py` (uvicorn FastAPI proxy)
- Strips `thinking` param and `interleaved-thinking` beta headers before forwarding
- Required because LiteLLM passes thinking→Ollama's `think:true` which most models reject

**Port 4001** — LiteLLM proxy
- Routes Claude model names to local Ollama models
- Config: `~/.claude/litellm_config.yaml`

**Model mappings (6-24B only, small models removed):**
- `claude-haiku-*` → `mistral:7b`
- `claude-sonnet-*` → `deepseek-coder:6.7b`
- `claude-opus-*` → `deepseek-r1:7b`
- All support `[1m]` suffix variants (e.g. `claude-opus-4-6[1m]`)

**Windows claude settings** (`C:\Users\nugad\.claude\settings.json`):
- `ANTHROPIC_BASE_URL: http://localhost:4000`
- `ANTHROPIC_AUTH_TOKEN: sentinel-local`

**Why:** VS Code runs on Windows, opens WSL folders via `\\wsl.localhost\Ubuntu\...`, uses bundled `claude.exe` (not WSL claude binary). LiteLLM in WSL is accessible from Windows via WSL2 port forwarding.

**Systemd services:**
- `litellm.service` — LiteLLM on port 4001
- `litellm-proxy.service` — thinking stripper on port 4000 (depends on litellm.service)

**How to apply:** When debugging VS Code Claude issues, check both services are running and test with `curl http://localhost:4000/health/liveliness`.
