#!/bin/bash
set -e

KERNEL="../kernel/out/Image.gz-dtb"
RAMDISK="../rootfs/initramfs.cpio.gz"
OUT="../K5Pro_Ubuntu22.04_boot.img"

mkbootimg \
    --kernel $KERNEL \
    --ramdisk $RAMDISK \
    --output $OUT \
    --base 0x80000000 \
    --pagesize 2048 \
    --cmdline "console=ttyMSM0,115200n8 root=/dev/ram0 rw"
