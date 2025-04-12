# PCT Patches for PVE

[中文文档](https://github.com/lurenJBD/PCT-pacthes/blob/main/README-CN.md) | [English](https://github.com/lurenJBD/PCT-pacthes/blob/main/README.md)

---

### 简介

> [!CAUTION]
> 如果曾使用过与 LXC/PCT 相关的其他脚本，运行该脚本可能会导致不可预估的问题。
>
> **集群用户请注意：** 本脚本尚未在集群环境中测试，因此 **不建议在集群环境中使用**。
>
> **兼容性声明：** 本脚本 **仅在全新安装的 PVE 8.2、8.3 和 8.4 系统上测试通过**。其他版本或非全新安装环境可能存在未知风险。未在ARM64架构的PVE上测试过，不建议ARM64版本PVE用户使用！！！
>
> 使用本脚本前，请务必备份重要数据。脚本导致的一切数据丢失，由使用者承担，运行脚本视为同意该声明！
>
> 使用本脚本修改后，请尽量不要更新PVE版本，如需要更新PVE版本前请务必恢复修改，避免意外发生
>
> 如果你之前使用脚本的旧版，请先恢复一次，在应用新版的补丁，本次补丁移除了 PVE 8.0 和 8.1 的支持

让 PVE 8.2 ~ 8.4 的 PCT 支持 OCI 类型容器的补丁

> [!TIP]
> 运行脚本修改后，会对部分别的PCT容器产生影响，比如 PCT容器 里运行Docker或挂载NFS
>
> 为避免发生此类影响，请不要将 Redroid(OCI)容器 设为开机自启动，推荐设置一个Debian之类的容器自启动
>
> 如果不想设置自启动，建议(自PVE系统运行以来）第一启动PCT容器为非OCI容器，就是说运行OCI容器前，请先运行一个非OCI容器

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

从 Release 选择一个模板下载，推荐使用 lineage19.1-x86_64-houdini-magisk-gapps.tar.gz

创建容器时 **不要勾选(Don't)** 非特权容器(Unprivileged container)，密码随意输入，不会生效的

分配 rootfs空间大小不低于 5GB，内存不小于 4GB，关闭 Swap，即填写0

配置网络 IPv4 选择 DHCP，IPv6 选哪个都一样，容器都会获得一个无状态IPv6地址

如果想关闭IPv6，请在 lxc.init.cmd 参数里添加 `androidboot.disable_ipv6=1` 【仅限github发布的模板支持】

创建完成容器后，去 资源(Resouces) 添加一个 挂载点(Mount Point)，路径(Path) 填写`/data`，空间大小推荐不小于 25G

【可选】 点击 Add 添加一个 Mount Entry，Soucre Path 填 `/dev/dri`，Target Path 填 `/dev/dri`，Create Type 选 `dir`

这个参数等效于手动向配置文件里写 `lxc.mount.entry: /dev/dri dev/dri none bind,optional,create=dir`

接着去 选项(Options)菜单，将终端类型 (Console mode) 修改为 `shell`，不然无法在WebUI访问容器终端

将 Apparmor profile 改为 `unconfined`，功能(Features) 勾选 `AutoDev` 和 `FUSE`，

配置 lxc.init.cmd 参数为 `/init androidboot.hardware=redroid androidboot.redroid_gpu_mode=auto`

具体别的参数可以参考 Redroid 的文档

lxc.mount.auto 将三个参数 `proc`,`sys`,`cgroup`都改为 `mixed`

效果截图

为OCI类型容器添加的 Mount Entry 功能（仅限OCI容器使用）
![Image](https://github.com/user-attachments/assets/660b1df1-4ad6-49bc-8982-617b115af164)

为OCI类型容器添加的 Apparmor profile ，lxc.init.cmd 和 lxc.mount.auto（后两者仅限OCI容器使用）
![Image](https://github.com/user-attachments/assets/0b0dfee6-564a-4363-ad3b-a68e1b5ceaf4)




### 为 PCT WebUI 添加 IP Info 显示界面

感谢 Gabriel Goller(来自pve-devel) 提供的参考

支持 PVE 8.1 ~ 8.4

使用方法

```bash
wget -q https://github.com/lurenJBD/PCT-pacthes/raw/refs/heads/main/Patch-for-PVE-WebUI-Display-IPinfo-beta.sh
bash Patch-for-PVE-WebUI-Display-IPinfo-beta.sh
```
撤销修改

```bash
bash Patch-for-PVE-WebUI-Display-IPinfo-beta.sh -R
```

效果截图

PCT主界面显示IP信息
![Image](https://github.com/user-attachments/assets/6fee1c85-578f-48bd-b44b-e8c01c2f9c17)

IP信息详细
![Image](https://github.com/user-attachments/assets/60037ce5-ca58-4a9e-88eb-91f022560a70)

