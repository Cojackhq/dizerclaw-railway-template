#!/bin/sh
mkdir -p /data/.openclaw
cat > /data/.openclaw/openclaw.json << 'EOF'
{
  "gateway": {
    "controlUi": {
      "allowedOrigins": ["*"]
    },
    "trustedProxies": ["*"]
  }
}
EOF
OPENCLAW_GATEWAY_PORT=${PORT} ./node_modules/.bin/openclaw gateway --allow-unconfigured
