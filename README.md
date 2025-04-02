# PCT Patches for PVE

[中文文档](https://github.com/lurenJBD/PCT-pacthes/blob/main/README-CN.md) | [English](https://github.com/lurenJBD/PCT-pacthes/blob/main/README.md)

---

### Introduction

> [!CAUTION]
> If you have previously used other scripts related to LXC/PCT, running this script may cause unpredictable issues.
>
> **Cluster user note:** This script has not been tested in a cluster environment and therefore **is not recommended** for use in a cluster environment.
>
> **Compatibility Disclaimer:** This script **has only been tested on fresh installations of PVE 8.2 and 8.3**. Other versions or non-new installations may have unknown risks. Not tested on ARM64 architecture PVE, not recommended for ARM64 version PVE users!!
>
> Be sure to back up important data before using this script. All data loss caused by the script is the responsibility of the user, and running the script is considered as agreeing to this statement!
> 
> After using this script to modify your system, try to avoid updating the PVE version. If you need to update PVE, please be sure to revert the modifications before updating to avoid unexpected issues.
>
> If you have previously used an older version of this script, please revert the changes first, then apply the new patch. This patch has removed support for PVE 8.0 and 8.1.

Patch to enable PCT in PVE 8.2 ~ 8.3 to support OCI format containers.

### Usage

```bash
wget -q https://github.com/lurenJBD/PCT-pacthes/raw/refs/heads/main/Patch-for-PCT-to-support-oci.sh
bash Patch-for-PCT-to-support-oci.sh
```

Revert Patch Modifications

```bash
bash Patch-for-PCT-to-support-oci.sh -R
```

### Supported PCT Features

- [X] Snapshots
- [X] Backup
- [X] template + Full Clone
- [X] Firewall

### Unsupported PCT Features

- [ ] template + Linked Clone

### Steps to create a container

Download the Lineage18.1-houdini.tar.gz template from Release section.

When creating containers **Don't check the box** `Unprivileged container`, enter the password as you wish, it won't take effect.

Allocate Storage space not less than 5GB, memory not less than 4GB, turn off Swap, that is, fill in 0.

Configure the network IPv4 choose DHCP, IPv6 choose any option, the container will get a stateless IPv6 address.

After creating the container, go to Resources and add a Mount Point, with Path set to `/data`, and recommended size not less than 25GB.

{Optional} Click Add to add a Mount Entry, with Source Path `/dev/dri`, Target Path `/dev/dri`, and Create Type set to `dir`.

This parameter is equivalent to manually writing `lxc.mount.entry: /dev/dri dev/dri none bind,optional,create=dir` in the configuration file.

Next, go to the Options menu and change the terminal type (Console mode) to `shell`, otherwise you cannot access the container terminal in WebUI.

Change Apparmor profile to `unconfined`, and check `AutoDev` and `FUSE` in Features.

Configure the lxc.init.cmd parameter to `/init androidboot.hardware=redroid androidboot.redroid_gpu_mode=auto`.

For other parameters, please refer to the Redroid documentation.

Change lxc.mount.auto to set all three parameters `proc`, `sys`, and `cgroup` to `mixed`.
