#!/bin/bash

KERNEL=kernel/out/Image.gz-dtb
RAMDISK=rootfs/initramfs.cpio.gz
OUT=K5Pro_Ubuntu22.04_boot.img

mkbootimg \
  --kernel $KERNEL \
  --ramdisk $RAMDISK \
  --output $OUT
