FROM ghcr.io/coder/code-server:latest

USER root
RUN apt update && apt install -y \
    build-essential autoconf pkg-config \
    libssl-dev zlib1g-dev libyaml-dev libreadline-dev \
    libgdbm-dev libffi-dev libncurses5-dev xz-utils \
    git ca-certificates ruby && \
    rm -rf /var/lib/apt/lists/*

RUN mkdir -p /data /workspace && chown -R coder:coder /data /workspace

USER coder
WORKDIR /workspace

COPY --chown=coder:coder start.sh /home/coder/start.sh
ENTRYPOINT ["/bin/bash", "/home/coder/start.sh"]
