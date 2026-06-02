# K5 Pro Linux Project (SD636)

Fork 后即可使用 GitHub Actions 自动生成 boot.img

## 功能
- Debian 12 / Ubuntu 22.04 ARM64 rootfs
- CAF Kernel 4.9
- framebuffer 显示 + shell
- SSH / apt / Python / GCC 可用

## 使用步骤
1. Actions -> Build Kernel
2. Actions -> Build RootFS
3. Actions -> Build boot.img
4. 下载 boot.img
5. fastboot boot K5Pro_Linux_boot.img
6. 测试成功后可 flash:
   fastboot flash boot K5Pro_Linux_boot.img
