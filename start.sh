#!/usr/bin/env bash
set -euo pipefail
PORT="${PORT:-8080}"

mkdir -p /workspace /data

exec code-server \
  --user-data-dir /data \
  --bind-addr 0.0.0.0:"$PORT"
