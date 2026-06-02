#!/bin/bash
set -e

ROOTFS_DIR="../rootfs/debian-rootfs"
DEBIAN_VERSION="bookworm"
ARCH="arm64"

mkdir -p $ROOTFS_DIR

sudo debootstrap --arch=$ARCH $DEBIAN_VERSION $ROOTFS_DIR http://deb.debian.org/debian

cd $ROOTFS_DIR
sudo find . | cpio -H newc -o | gzip > ../initramfs.cpio.gz
