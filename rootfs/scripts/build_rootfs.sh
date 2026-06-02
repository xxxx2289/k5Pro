#!/bin/bash
set -e

ROOTFS_DIR="../debian-rootfs"
DEBIAN_VERSION="bookworm"
ARCH="arm64"

sudo apt update
sudo apt install -y debootstrap qemu-user-static

mkdir -p $ROOTFS_DIR

sudo debootstrap \
  --arch=$ARCH \
  $DEBIAN_VERSION \
  $ROOTFS_DIR \
  http://deb.debian.org/debian

# 清理
sudo chroot $ROOTFS_DIR apt clean

# 生成 initramfs（最简）
cd $ROOTFS_DIR
sudo find . | cpio -H newc -o | gzip > ../initramfs.cpio.gz
