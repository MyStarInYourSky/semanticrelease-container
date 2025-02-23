FROM node:23-alpine

LABEL org.opencontainers.image.source = "https://github.com/mystarinyoursky/semanticrelease-container"

ENV NODE_PACKAGE_COMMITLINT_VER=19.7.1
ENV NODE_PACKAGE_SEMANITICRELEASE_VER=11.0.1
ENV NODE_PATH="/app/node_modules"

## Set Workdir
WORKDIR /app

## Install Dependencies
RUN apk add --no-cache \
    git \
    curl \
    bash \
    github-cli

## Install Commitlint
RUN npm install \
    commitlint@${NODE_PACKAGE_COMMITLINT_VER} \
    conventional-changelog-conventionalcommits \
    @commitlint/config-conventional@${NODE_PACKAGE_COMMITLINT_VER} \
    @semantic-release/github@${NODE_PACKAGE_SEMANITICRELEASE_VER} \
    @semantic-release/exec

## Make sure node_modules is in path
ENV PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/app/node_modules/.bin
