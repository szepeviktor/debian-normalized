#!/bin/bash

set -e -x

umount /root/debian-normalized/bullseye/proc
umount /root/debian-normalized/bullseye/sys
umount /root/debian-normalized/bullseye/dev/pts

rm -rf /root/debian-normalized/bullseye

echo "OK."
