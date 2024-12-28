### 简介

> [!CAUTION]
> 如果曾使用过与 LXC/PCT 相关的其他脚本，运行该脚本可能会导致不可预估的问题。
>
> **集群用户请注意：** 本脚本尚未在集群环境中测试，因此 **不建议在集群环境中使用**。
>
> **兼容性声明：** 本脚本 **仅在全新安装的 PVE 8.0、8.1、8.2、8.3 系统上测试通过**。其他版本或非全新安装环境可能存在未知风险。
>
> 使用本脚本前，请务必备份重要数据。脚本导致的一切数据丢失，由使用者承担，运行脚本视为同意该声明！
>

让 PVE 8 的 PCT 支持 OCI 类型容器的补丁

### 使用方法

```bash
wget -q https://github.com/lurenJBD/PCT-pacthes/raw/refs/heads/main/Patch-for-PCT-to-support-oci.sh
bash Patch-for-PCT-to-support-oci.sh
```
撤销补丁修改

```bash
bash Patch-for-PCT-to-support-oci.sh -R
```

### 支持的 PCT 功能

- [x] 快照 (Snapshots)
- [x] 备份 (Backup)
- [x] 模板 (template) + 完整克隆 (Full Clone)
- [x] 防火墙 (Firewall)

### 不支持的 PCT 功能

- [ ] 模板  (template) + 链接克隆 (Linked Clone)

### 创建容器的步骤

从 Release 下载基于Redroid官方发布Docker镜像制作的 redroid12.tar.gz 模板

创建容器时 **不要勾选(Don't)** `非特权容器(Unprivileged container)`，密码随意输入，不会生效的

分配 存储空间不小于 30GB，内存不小于 4GB，关闭 Swap，即填写0

配置网络 IPv4 选择 DHCP，IPv6 选哪个都一样，容器都会获得一个无状态IPv6地址，如果不想分配IPv6，请修改路由器设备设置

创建完成容器后，需要将终端类型 (Console mode) 修改为 `shell`，不然无法在WebUI访问容器终端

最后在 PVE 的 shell 里执行这些代码，或者手动编辑容器的配置

这里以容器ID为 100 作为演示

```shell
ctid=100
cat >> /etc/pve/lxc/$ctid.conf <<EOF
lxc.mount.auto: proc:mixed sys:mixed cgroup:mixed
lxc.autodev: 1
lxc.autodev.tmpfs.size: 25000000
lxc.apparmor.profile: unconfined
lxc.init.cmd: /init androidboot.hardware=redroid androidboot.redroid_gpu_mode=auto
lxc.mount.entry: /dev/fuse dev/fuse none bind,create=file 0 0
lxc.mount.entry: /dev/net/tun dev/tun none bind,optional,create=file 0 0
lxc.mount.entry: /dev/snd dev/snd none bind,optional,create=dir
lxc.mount.entry: /dev/dri dev/dri none bind,optional,create=dir
lxc.mount.entry: \$rootfs/data data none bind 0 0
EOF
```
