#!/bin/bash
set -e

ROOTFS_DIR="../rootfs/ubuntu"
ARCH=arm64
UBUNTU_VERSION=jammy

mkdir -p $ROOTFS_DIR

# 安装 debootstrap
sudo apt update
sudo apt install -y debootstrap qemu-user-static cpio

# 构建最小 Ubuntu 22.04 rootfs
sudo debootstrap --arch=$ARCH $UBUNTU_VERSION $ROOTFS_DIR http://ports.ubuntu.com/ubuntu-ports

# 生成 initramfs
cd $ROOTFS_DIR
sudo find . | cpio -H newc -o | gzip > ../initramfs.cpio.gz
