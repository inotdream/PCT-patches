### Introduction

> [!CAUTION]
> If you have previously used other scripts related to LXC/PCT, running this script may cause unpredictable issues.
>
> **Cluster user note:** This script has not been tested in a cluster environment and therefore **is not recommended** for use in a cluster environment.
>
> **Compatibility Disclaimer:** This script **has only been tested on fresh installations of PVE 8.0, 8.1, 8.2, and 8.3**. Other versions or non-new installations may have unknown risks. Not tested on ARM64 architecture PVE, not recommended for ARM64 version PVE users!!
>
> Be sure to back up important data before using this script. All data loss caused by the script is the responsibility of the user, and running the script is considered as agreeing to this statement!
>

Patch to enable PCT in PVE 8 to support OCI format containers.

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

- [x] Snapshots
- [x] Backup
- [x] template + Full Clone
- [x] Firewall

### Unsupported PCT Features

- [ ] template + Linked Clone

### Steps to create a container

Download the redroid12.tar.gz template from Release, which is based on the official Redroid Docker image.

When creating containers **Don't check the box** `Unprivileged container`, enter the password as you wish, it won't take effect.

Allocate Storage space not less than 30GB, memory not less than 4GB, turn off Swap, that is, fill in 0.

Configure the network IPv4 choose DHCP, IPv6 choose which is the same, the container will get a stateless IPv6 address, if you do not want to assign IPv6, please modify your router device settings

After creating the container, you need to change the terminal type (Console mode) to `shell`, otherwise you can not access the container terminal in WebUI.

Finally, execute these codes in the shell of PVE, or manually edit the configure of the container.

Here's a demo with a container ID of 100

```bash
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
