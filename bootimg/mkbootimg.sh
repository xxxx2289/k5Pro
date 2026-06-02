#!/bin/bash
set -e

KERNEL="../kernel/out/Image.gz-dtb"
RAMDISK="../debian-rootfs/initramfs.cpio.gz"
OUTPUT="../K5Pro_Linux_boot.img"

mkbootimg \
  --kernel $KERNEL \
  --ramdisk $RAMDISK \
  --output $OUTPUT
