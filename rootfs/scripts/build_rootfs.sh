#!/bin/bash
set -e

ROOTFS_DIR="../rootfs/ubuntu"
INITRAMFS_DIR="../rootfs/initramfs"
ARCH=arm64
UBUNTU_VERSION=jammy

mkdir -p $ROOTFS_DIR $INITRAMFS_DIR

# 构建最小 Ubuntu rootfs
sudo debootstrap --arch=$ARCH $UBUNTU_VERSION $ROOTFS_DIR http://ports.ubuntu.com/ubuntu-ports

# 创建 init 脚本，作为 Linux 启动桥
cat << 'EOF' | sudo tee $INITRAMFS_DIR/init
#!/bin/sh
mount -t proc proc /proc
mount -t sysfs sys /sys
mount -t devtmpfs devtmpfs /dev
echo "Booting Ubuntu on K5 Pro..."
exec /sbin/init
EOF

sudo chmod +x $INITRAMFS_DIR/init

# 打包 initramfs
cd $INITRAMFS_DIR
sudo find . | cpio -H newc -o | gzip > ../initramfs.cpio.gz
