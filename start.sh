#!/usr/bin/env bash
set -euo pipefail

PORT="${PORT:-8080}"

mkdir -p /data /workspace

if [ ! -L /workspace ]; then
  rm -rf /workspace || true
  ln -s /data/workspace /workspace
fi

chown -h coder:coder /workspace || true
chown -R coder:coder /data /workspace || true

exec code-server \
  --user-data-dir /data \
  --bind-addr 0.0.0.0:"${PORT}"
