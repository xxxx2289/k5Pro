#!/bin/bash
set -e

ROOTFS=rootfs/ubuntu
ARCH=arm64

mkdir -p $ROOTFS

debootstrap --arch=$ARCH jammy $ROOTFS http://ports.ubuntu.com/ubuntu-ports

# initramfs
cd $ROOTFS
find . | cpio -H newc -o | gzip > ../initramfs.cpio.gz
