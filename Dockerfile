FROM ghcr.io/coder/code-server:latest

USER root
RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y \
    build-essential autoconf ruby pkg-config \
    libssl-dev zlib1g-dev libyaml-dev libreadline-dev \
    libgdbm-dev libffi-dev libncurses5-dev xz-utils \
    git ca-certificates curl && \
    rm -rf /var/lib/apt/lists/*

RUN mkdir -p /workspace /data && chown -R coder:coder /workspace /data

USER coder
WORKDIR /workspace
