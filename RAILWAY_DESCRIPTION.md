# Deploy and Host Ministers T on Railway

[![Deploy on Railway](https://railway.com/button.svg)](https://railway.com/deploy/J-4fzl?referralCode=qGKtrS&utm_medium=integration&utm_source=template&utm_campaign=generic)

Ministers T is a ready-to-run AI Chief of Staff agent powered by OpenClaw, deployable in minutes on Railway. Connect it to Telegram and get a fully autonomous AI assistant that manages tasks, answers questions, and runs workflows — no servers, no DevOps, no hassle.

## About Hosting Ministers T

Hosting Ministers T requires a persistent process that stays online to handle incoming Telegram messages and run autonomous agent workflows. The gateway needs an LLM API key (OpenRouter, Anthropic, or OpenAI), a Telegram bot token from BotFather, and a secure gateway auth token to protect your instance. Railway manages the container lifecycle, health checks, automatic restarts, and persistent storage through a mounted volume — so your agent's memory, config, and sessions survive redeploys. Configuration is entirely through environment variables set at deploy time; no files to edit, no CLI required.

## Common Use Cases

- **Personal AI Chief of Staff** — Manage tasks, reminders, research, and decisions directly from Telegram
- **Team productivity bot** — Deploy one instance per team member; each gets their own private AI assistant
- **Business automation** — Connect to APIs, monitor emails, summarize reports, and triage information on schedule

## Dependencies for Ministers T Hosting

- **Telegram Bot Token** — From [@BotFather](https://t.me/BotFather) — free, takes 60 seconds
- **LLM API Key** — [OpenRouter](https://openrouter.ai) (recommended, free tier available) or [Anthropic](https://console.anthropic.com) / [OpenAI](https://platform.openai.com)

### Deployment Dependencies

- [OpenClaw GitHub Repository](https://github.com/openclaw/openclaw) — The underlying AI agent framework
- [OpenClaw Documentation](https://docs.openclaw.ai) — Full configuration and channel setup reference
- [Railway Volumes Documentation](https://docs.railway.com/volumes) — For persistent storage setup
- [Telegram BotFather](https://t.me/BotFather) — To create your Telegram bot token
- [OpenRouter](https://openrouter.ai) — Free LLM API access (no credit card required to start)

### Implementation Details

This template deploys OpenClaw as a local Node.js dependency (not a global install) so the binary is always available in Railway's Railpack runtime. The gateway runs in foreground mode with `--allow-unconfigured` so it starts cleanly before any config is applied. Port binding uses Railway's injected `$PORT` variable via shell expansion. A 5GB volume at `/data` persists all agent state, memory, and workspace files across deploys.

```json
{
  "startCommand": "OPENCLAW_GATEWAY_PORT=${PORT:-8080} ./node_modules/.bin/openclaw gateway --allow-unconfigured"
}
```

After deploy, open `https://<your-domain>/openclaw`, authenticate with your `OPENCLAW_GATEWAY_TOKEN`, and connect your Telegram bot through the Control UI.

## Why Deploy Ministers T on Railway?

Railway is a singular platform to deploy your infrastructure stack. Railway will host your infrastructure so you don't have to deal with configuration, while allowing you to vertically and horizontally scale it.

By deploying Ministers T on Railway, you are one step closer to supporting a complete full-stack application with minimal burden. Host your servers, databases, AI agents, and more on Railway.
