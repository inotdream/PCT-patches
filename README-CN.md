# PCT Patches for PVE

[中文文档](https://github.com/lurenJBD/PCT-pacthes/blob/main/README-CN.md) | [English](https://github.com/lurenJBD/PCT-pacthes/blob/main/README.md)

---

### 简介

> [!CAUTION]
> 如果曾使用过与 LXC/PCT 相关的其他脚本，运行该脚本可能会导致不可预估的问题。
>
> **集群用户请注意：** 本脚本尚未在集群环境中测试，因此 **不建议在集群环境中使用**。
>
> **兼容性声明：** 本脚本 **仅在全新安装的 PVE 8.2、8.3 系统上测试通过**。其他版本或非全新安装环境可能存在未知风险。未在ARM64架构的PVE上测试过，不建议ARM64版本PVE用户使用！！！
>
> 使用本脚本前，请务必备份重要数据。脚本导致的一切数据丢失，由使用者承担，运行脚本视为同意该声明！
>
> 使用本脚本修改后，请尽量不要更新PVE版本，如需要更新PVE版本前请务必恢复修改，避免意外发生
>
> 如果你之前使用脚本的旧版，请先恢复一次，在应用新版的补丁，本次补丁移除了 PVE 8.0 和 8.1 的支持

让 PVE 8.2 ~ 8.3 的 PCT 支持 OCI 类型容器的补丁

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

- [X] 快照 (Snapshots)
- [X] 备份 (Backup)
- [X] 模板 (template) + 完整克隆 (Full Clone)
- [X] 防火墙 (Firewall)

### 不支持的 PCT 功能

- [ ] 模板  (template) + 链接克隆 (Linked Clone)

### 创建容器的步骤

从 Release 选择一个模板下载，本ReadMe推荐使用 Lineage18.1-houdini.tar.gz

创建容器时 **不要勾选(Don't)** `非特权容器(Unprivileged container)`，密码随意输入，不会生效的

分配 rootfs空间大小不低于 5GB，内存不小于 4GB，关闭 Swap，即填写0

配置网络 IPv4 选择 DHCP，IPv6 选哪个都一样，容器都会获得一个无状态IPv6地址

创建完成容器后，去 资源(Resouces) 添加一个 挂载点(Mount Point)，路径(Path) 填写`/data`，空间大小推荐不小于 25G

{可选} 点击 Add 添加一个 Mount Entry，Soucre Path 填 `/dev/dri`，Target Path 填 `/dev/dri`，Create Type 选 `dir`

这个参数等效于手动向配置文件里写 `lxc.mount.entry: /dev/dri dev/dri none bind,optional,create=dir`

接着去 选项(Options)菜单，将终端类型 (Console mode) 修改为 `shell`，不然无法在WebUI访问容器终端

将 Apparmor profile 改为 `unconfined`，功能(Features) 勾选 `AutoDev` 和 `FUSE`，

配置 lxc.init.cmd 参数为 `/init androidboot.hardware=redroid androidboot.redroid_gpu_mode=auto`

具体别的参数可以参考 Redroid 的文档

lxc.mount.auto 将三个参数 `proc`,`sys`,`cgroup`都改为 `mixed`
