#!/bin/sh
set -e

apt-get install \
    libx11-dev:amd64 \
    libxtst-dev:amd64 \
    libxt-dev:amd64 \
    libxinerama-dev:amd64 \
    libx11-xcb-dev:amd64 \
    libxkbcommon-dev:amd64 \
    libxkbcommon-x11-dev:amd64 \
    libxkbfile-dev:amd64
