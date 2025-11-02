#!/usr/bin/env bash
set -euo pipefail

PORT="${PORT:-8080}"

mkdir -p /data /workspace
chown -R coder:coder /data /workspace || true

exec code-server \
  --user-data-dir /data \
  --bind-addr 0.0.0.0:"${PORT}"
