#!/bin/bash

set -e -x

debootstrap --verbose --arch=amd64 --variant=minbase \
    --include=dialog,lsb-release,ca-certificates,wget,apt-utils,aptitude,net-tools,git,jq \
    bullseye bullseye http://deb.debian.org/debian

mount --types proc proc /root/debian-normalized/bullseye/proc
mount --types sysfs sysfs /root/debian-normalized/bullseye/sys
mount --bind /dev/pts /root/debian-normalized/bullseye/dev/pts

echo "OK."
