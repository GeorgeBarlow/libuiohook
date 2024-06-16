#!/bin/sh
set -e

rm -Rf /etc/apt/sources.list.d
bash -c 'source /etc/lsb-release && echo "
deb [arch=amd64,i386] http://us.archive.ubuntu.com/ubuntu ${DISTRIB_CODENAME} main universe
deb [arch=amd64,i386] http://us.archive.ubuntu.com/ubuntu ${DISTRIB_CODENAME}-updates main universe
deb [arch=amd64,i386] http://us.archive.ubuntu.com/ubuntu ${DISTRIB_CODENAME}-backports main universe
# This only seems to be required on GitHub images
deb [arch=amd64,i386] https://ppa.launchpadcontent.net/ubuntu-toolchain-r/test/ubuntu ${DISTRIB_CODENAME} main
" > /etc/apt/sources.list'

dpkg --add-architecture i386
apt-get update -m

apt-get install \
    binutils-i686-linux-gnu \
    gcc-i686-linux-gnu

apt-get install \
    libx11-dev:i386 \
    libxtst-dev:i386 \
    libxt-dev:i386 \
    libxinerama-dev:i386 \
    libx11-xcb-dev:i386 \
    libxkbcommon-dev:i386 \
    libxkbcommon-x11-dev:i386 \
    libxkbfile-dev:i386
