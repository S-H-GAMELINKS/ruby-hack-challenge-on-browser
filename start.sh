#!/usr/bin/env bash
set -euo pipefail

PORT="${PORT:-8080}"

mkdir -p /workspace /data

chown -R 1000:1000 /workspace /data || true
chmod 775 /workspace /data || true

exec gosu coder:coder code-server \
  --user-data-dir /data \
  --bind-addr 0.0.0.0:"$PORT"
