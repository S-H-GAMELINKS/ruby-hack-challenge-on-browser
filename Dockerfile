FROM ghcr.io/coder/code-server:latest

USER root
RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y \
    build-essential autoconf ruby pkg-config \
    libssl-dev zlib1g-dev libyaml-dev libreadline-dev \
    libgdbm-dev libffi-dev libncurses5-dev xz-utils \
    git ca-certificates curl gosu && \
    rm -rf /var/lib/apt/lists/*

RUN mkdir -p /workspace /data

COPY start.sh /usr/local/bin/start.sh
RUN chmod +x /usr/local/bin/start.sh

USER coder
WORKDIR /workspace

ENTRYPOINT ["/usr/local/bin/start.sh"]
