## 简介

> [!CAUTION]
> 如果您曾使用过与 LXC/PCT 相关的其他脚本，使用本脚本可能会导致不可预估的问题。
>
> **集群用户请注意：** 本脚本尚未在集群环境中测试，因此 **不建议在集群环境中使用**。
>
> **兼容性声明：** 本脚本 **仅在全新安装的 PVE 8.0、8.1、8.2、8.3 系统上测试通过**。其他版本或非全新安装环境可能存在未知风险。
>
> 使用本脚本前，请务必备份重要数据。脚本导致的一切数据丢失，由使用者承担，运行脚本视为同意该声明！
>


该脚本让 PVE 8 的 PCT支持 OCI 类型容器的补丁

## 使用方法

```shell
wget -q https://github.com/lurenJBD/PCT-pacthes/raw/refs/heads/main/Patch-for-PCT-to-support-oci.sh
bash Patch-for-PCT-to-support-oci.sh
```
撤销补丁修改

```shell
bash Patch-for-PCT-to-support-oci.sh -R
```

### 支持的 PCT 功能：

- [x] 快照
- [x] 备份
- [x] 模板 + 完整克隆(Full Clone)
- [x] 防火墙

### 不支持的 PCT 功能：

- [ ] 模板 + 链接克隆(Linked Clone)

