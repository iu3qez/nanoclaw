#!/bin/bash
# Watches Claude OAuth token expiry and forces refresh when expired.
# Runs via systemd timer every 5 minutes.

CREDS_FILE="$HOME/.claude/.credentials.json"
LOG_TAG="[token-refresh]"

if [ ! -f "$CREDS_FILE" ]; then
  echo "$LOG_TAG credentials file not found" >&2
  exit 0
fi

# Read expiresAt (epoch ms)
expires_at=$(python3 -c "
import json, sys
with open('$CREDS_FILE') as f:
    d = json.load(f)
print(d.get('claudeAiOauth', {}).get('expiresAt', 0))
" 2>/dev/null)

if [ -z "$expires_at" ] || [ "$expires_at" = "0" ]; then
  echo "$LOG_TAG no expiresAt found" >&2
  exit 0
fi

now_ms=$(date +%s%3N)
diff_ms=$((expires_at - now_ms))
diff_min=$((diff_ms / 60000))

if [ "$diff_ms" -gt 0 ]; then
  # Token still valid, nothing to do
  echo "$LOG_TAG token valid for ${diff_min}m, skipping"
  exit 0
fi

echo "$LOG_TAG token expired ${diff_min#-}m ago, forcing refresh..."

# Run a minimal claude command to trigger token refresh
timeout 30 /home/sf/.local/bin/claude -p "ping" --output-format text --max-turns 1 > /dev/null 2>&1
rc=$?

if [ $rc -eq 0 ]; then
  echo "$LOG_TAG refresh successful"
else
  echo "$LOG_TAG refresh failed (exit $rc)" >&2
fi
