# K5 Pro Linux Project (Snapdragon 636)

这是一个把联想 K5 Pro 移植成 Linux 系统的项目。

支持：

- Debian 12 ARM64
- Ubuntu 22.04 ARM64
- CAF Linux Kernel（Android 4.9）

---

## 功能状态

✔ 可启动 Linux  
✔ 支持 shell / SSH  
✔ 支持 apt / dnf  
✔ 支持 framebuffer 显示  

❌ 不支持摄像头  
❌ 不支持通话  
❌ GPU 加速暂时不可用  

---

## 使用方法

### 1. 编译 kernel
在 GitHub Actions 运行：
build_kernel.yml

---

### 2. 构建 rootfs
运行：
build_rootfs.yml 或本地脚本

---

### 3. 打包 boot.img

```bash
bash bootimg/mkbootimg.sh
