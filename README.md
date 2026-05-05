# OpenClaw Railway Template

One-click deploy of [OpenClaw](https://openclaw.ai) on [Railway](https://railway.com) — no Docker required, no CLI setup.
Built on Nixpacks. Persistent storage via Railway Volume.

[![Deploy on Railway](https://railway.com/button.svg)](https://railway.com/deploy/J-4fzl?referralCode=qGKtrS&utm_medium=integration&utm_source=template&utm_campaign=cojack)

---

## What you get

- OpenClaw Gateway running on Railway
- Control UI at `https://<your-domain>/openclaw`
- Persistent storage (workspace, config, sessions survive redeploys)
- Token-based auth (no password to manage)
- Sandbox mode **off** by default (required for Railway Hobby plan)

---

## Deploy in 5 steps

1. Click **Deploy on Railway** above
2. Set the required environment variables (see below)
3. Attach a **Volume** mounted at `/data`
4. Enable **HTTP Proxy** on port `8080` under Public Networking
5. Open `https://<your-railway-domain>/openclaw` and connect with your `OPENCLAW_GATEWAY_TOKEN`

---

## Required Environment Variables

| Variable | Description |
|---|---|
| `OPENCLAW_GATEWAY_PORT` | Must be `8080` |
| `OPENCLAW_GATEWAY_TOKEN` | Your admin secret — generate with `openssl rand -hex 32` |
| `OPENCLAW_STATE_DIR` | Set to `/data/.openclaw` |
| `OPENCLAW_WORKSPACE_DIR` | Set to `/data/workspace` |

### Optional (but recommended)

| Variable | Description |
|---|---|
| `ANTHROPIC_API_KEY` | Powers Claude models |
| `OPENAI_API_KEY` | Alternative: GPT models |
| `OPENCLAW_MODEL` | Default model, e.g. `anthropic/claude-sonnet-4-6` |
| `BRAVE_API_KEY` | Enables `web_search` tool |

---

## Railway Volume (required)

Attach a volume at `/data` to persist:
- Config and auth (`/data/.openclaw/`)
- Workspace files (`/data/workspace/`)
- Sessions and memory

Without a volume, everything resets on every redeploy.

---

## Connect a channel

After deploy, open the Control UI at `/openclaw` and onboard a channel:

- **Telegram** — fastest, just a bot token from [@BotFather](https://t.me/BotFather)
- **Discord** — bot token from [Discord Developer Portal](https://discord.com/developers)
- See [all channels](https://docs.openclaw.ai/channels)

---

## Important: Railway Hobby Plan

> **No Docker** on Railway Hobby plan.

This template uses **Nixpacks** (not Docker). Do **not** change `agents.defaults.sandbox.mode` — leave it as `off`. Enabling sandbox mode will break the agent.

---

## Links

- [OpenClaw Docs](https://docs.openclaw.ai)
- [OpenClaw on GitHub](https://github.com/openclaw/openclaw)
- [Railway Docs](https://docs.railway.com)
