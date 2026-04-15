# Claude Local/Cloud Setup

Run Claude Code against local Ollama models or Anthropic's cloud API, switchable per shell session.

---

## Architecture

```
Claude Code
    │
    ├── [cloud mode]  ──►  Anthropic API  (OAuth, seph_sky@yahoo.com)
    │
    └── [local mode]  ──►  LiteLLM proxy :4000  ──►  Ollama :11434
                                                          ├── llama3.2:3b
                                                          ├── phi3.5:3.8b
                                                          ├── deepseek-coder:6.7b
                                                          ├── deepseek-r1:7b
                                                          ├── mistral:7b
                                                          └── nomic-embed-text
```

---

## Quick Start

Open a terminal and source your shell config if needed:

```bash
source ~/.bashrc
```

### Switch to local models
```bash
claude-local
```
Sets `ANTHROPIC_BASE_URL=http://localhost:4000` and a local API key.
All Claude Code requests are routed to your local Ollama models.

### Switch to cloud (Anthropic)
```bash
claude-cloud
```
Unsets the local env vars. Claude Code falls back to your OAuth subscription.

### Check current mode
```bash
claude-status
```
Shows active mode, proxy health, and the list of available models.

---

## Local Models

| Proxy name | Ollama model | Size | Best for |
|------------|-------------|------|----------|
| `llama3.2` | llama3.2:3b | 2.0 GB | Fast general tasks |
| `phi3.5` | phi3.5:3.8b | 2.2 GB | Compact reasoning |
| `deepseek-coder` | deepseek-coder:6.7b | 3.8 GB | Code generation |
| `mistral` | mistral:7b | 4.1 GB | General purpose |
| `deepseek-r1` | deepseek-r1:7b | 4.7 GB | Step-by-step reasoning |
| `nomic-embed-text` | nomic-embed-text | 274 MB | Embeddings only |

### Claude name aliases (for API compatibility)
| Claude name | Maps to |
|-------------|---------|
| `claude-haiku-4-5-20251001` | llama3.2:3b |
| `claude-sonnet-4-6` | deepseek-coder:6.7b |
| `claude-opus-4-6` | deepseek-r1:7b |

> **RAM note:** You have 7.4 GB RAM. Run one 7B model at a time.
> llama3.2:3b and phi3.5 can run alongside each other.

---

## LiteLLM Proxy

The proxy runs as a systemd user service on port 4000.

```bash
# Status
systemctl --user status litellm

# Start / stop / restart
systemctl --user start litellm
systemctl --user stop litellm
systemctl --user restart litellm

# View logs
journalctl --user -u litellm -f

# List registered models
curl http://localhost:4000/v1/models
```

Config file: `~/.claude/litellm_config.yaml`
Service file: `~/.config/systemd/user/litellm.service`

---

## Calling models directly via API

The proxy exposes an OpenAI-compatible API. No auth key needed (local only).

```bash
curl http://localhost:4000/v1/chat/completions \
  -H "Content-Type: application/json" \
  -d '{
    "model": "deepseek-coder",
    "messages": [{"role": "user", "content": "Write a Python hello world"}],
    "max_tokens": 200
  }'
```

---

## Adding a new model

1. Pull the model in Ollama:
   ```bash
   ollama pull <model-name>
   ```

2. Add an entry to `~/.claude/litellm_config.yaml`:
   ```yaml
   - model_name: my-model
     litellm_params:
       model: ollama/<model-name>
       api_base: http://localhost:11434
   ```

3. Restart the proxy:
   ```bash
   systemctl --user restart litellm
   ```

---

## Removing a model

```bash
ollama rm <model-name>
```
Then remove its entry from `~/.claude/litellm_config.yaml` and restart the proxy.

---

## Troubleshooting

**`claude-local` warns "proxy not responding"**
```bash
systemctl --user start litellm
# wait ~10s for startup, then retry
```

**Model responds slowly on first use**
Normal — Ollama loads the model into RAM on first request (cold start).
Subsequent requests are fast. 7B models typically take 5–15s to cold-start.

**Switching modes doesn't affect an already-running Claude Code session**
The env vars only apply to new Claude Code processes started in that shell.
Open a new terminal after switching, or restart Claude Code.

**Check what mode Claude Code is currently using**
```bash
echo ${ANTHROPIC_BASE_URL:-"cloud (not set)"}
```
