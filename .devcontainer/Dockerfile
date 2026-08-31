ARG NODE_VARIANT=24-bookworm
FROM mcr.microsoft.com/devcontainers/javascript-node:${NODE_VARIANT}

ARG OPENCODE_VERSION=1.18.8

USER root

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        jq \
        ripgrep \
        procps \
        lsof \
        ca-certificates \
        gnupg \
    && rm -rf /var/lib/apt/lists/*

RUN npm install --global \
        "opencode-ai@${OPENCODE_VERSION}" \
    && npm cache clean --force

RUN mkdir -p /etc/claude-code
COPY managed-settings.json /etc/claude-code/managed-settings.json

USER node