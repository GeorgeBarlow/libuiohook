#!/bin/sh
set -e

rm -Rf /etc/apt/sources.list.d
bash -c 'source /etc/lsb-release && echo "
deb [arch=amd64,i386] http://us.archive.ubuntu.com/ubuntu ${DISTRIB_CODENAME} main universe
deb [arch=amd64,i386] http://us.archive.ubuntu.com/ubuntu ${DISTRIB_CODENAME}-updates main universe
deb [arch=amd64,i386] http://us.archive.ubuntu.com/ubuntu ${DISTRIB_CODENAME}-backports main universe
# This only seems to be required on GitHub images
deb [arch=amd64,i386] https://ppa.launchpadcontent.net/ubuntu-toolchain-r/test/ubuntu ${DISTRIB_CODENAME} main

deb [arch=arm64,armhf] http://ports.ubuntu.com/ubuntu-ports ${DISTRIB_CODENAME} main universe
deb [arch=arm64,armhf] http://ports.ubuntu.com/ubuntu-ports ${DISTRIB_CODENAME}-updates main universe
deb [arch=arm64,armhf] http://ports.ubuntu.com/ubuntu-ports ${DISTRIB_CODENAME}-backports main universe
# This only seems to be required on GitHub images
deb [arch=arm64,armhf] https://ppa.launchpadcontent.net/ubuntu-toolchain-r/test/ubuntu ${DISTRIB_CODENAME} main
" > /etc/apt/sources.list'

dpkg --add-architecture armhf
apt-get update -m

apt-get install \
    binutils-arm-linux-gnueabihf \
    gcc-arm-linux-gnueabihf

apt-get install \
    libx11-dev:armhf \
    libxtst-dev:armhf \
    libxt-dev:armhf \
    libxinerama-dev:armhf \
    libx11-xcb-dev:armhf \
    libxkbcommon-dev:armhf \
    libxkbcommon-x11-dev:armhf \
    libxkbfile-dev:armhf
