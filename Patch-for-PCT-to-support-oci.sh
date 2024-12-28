#!/bin/bash
# Make by lurenjbd 2024-12-26
# Patch to enable PCT in PVE 8 to support OCI format containers.

########### Variable ###########
# 8.3.x Patches
PATCH_BASE64_83='
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
9rSnPe1pT3va0572tKc97WlPSH8AjHa2zQAoAAA='

# 8.2.x Patches
PATCH_BASE64_82='
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
pz3t6UX6H1fiYm4AKAAA'

########### Function ###########

apply_patch(){
    TARGET_DIR=$1
    PATCH_FILE=$2

    ORIGINAL_FILE="${PATCH_FILE%.diff}"
    ORIGINAL_PATH="$TARGET_DIR/$ORIGINAL_FILE"
    BACKUP_PATH="$ORIGINAL_PATH.bak"

    if [ -e "$BACKUP_PATH" ]; then
        echo "Backup file already exists: $BACKUP_PATH"
    elif [ -e "$ORIGINAL_PATH" ]; then
        echo "Backup $ORIGINAL_PATH to $BACKUP_PATH"
        cp "$ORIGINAL_PATH" "$BACKUP_PATH"
    else
        echo "Original file not found: $ORIGINAL_PATH"
        exit 1
    fi

    if patch --dry-run -d "$TARGET_DIR" < "/tmp/$PATCH_FILE" ; then
        echo "$PATCH_FILE Patch can be apply successfully."
        patch -d "$TARGET_DIR" < "/tmp/$PATCH_FILE" >/dev/null 2>&1
    else
        echo "$PATCH_FILE Patch cannot be apply. Please check the patch file and target directory."
        Fail_NeedToRestore=1
    fi
    echo
}

restore_patch(){
    TARGET_DIR=$1
    TARGET_FILE=$2

    ORIGINAL_PATH="$TARGET_DIR/$TARGET_FILE"
    BACKUP_PATH="$ORIGINAL_PATH.bak"
    
    if [ -e "$BACKUP_PATH" ]; then
        mv $BACKUP_PATH $ORIGINAL_PATH
        echo "Restore $ORIGINAL_PATH file successfully."
    else
        echo "Backup file $BACKUP_PATH not found."
    fi

}

load_module() {
    local module=$1
    local params=$2
    local modules_file="/etc/modules"
    local modprobe_conf_file="/etc/modprobe.d/$module.conf"

    if ! lsmod | grep -q "$module"; then
    echo "$module is not loaded, loading module..."
    if [[ -n "$params" ]]; then
        modprobe "$module" $params
    else
        modprobe "$module"
    fi
    else
    echo "$module is already loaded."
    fi

    if ! grep -q "$module" "$modules_file"; then
    echo "Adding $module to $modules_file"
    echo "$module" >> "$modules_file"
    fi
    if [[ -n "$params" && ! -f "$modprobe_conf_file" ]]; then
    echo "options $module $params" > "$modprobe_conf_file"
    fi
}

if_already_patch(){
    if [ -f /usr/share/perl5/PVE/LXC/Setup/Oci.pm ]; then
    echo "The patch has already been applied. Please do not apply it again."
    echo "If you need to revert, use the -R / --restore option."
    echo "该补丁已执行，请不要再次执行。"
    echo "如需恢复，请使用 -R / --restore 参数。"
    exit 1
    fi
}

cleanup() {
    rm -f /tmp/patch_files.tar.gz /tmp/LXC.pm.diff /tmp/Config.pm.diff /tmp/Setup.pm.diff
    if [ -n "$Need_RestartAPI" ]; then
    echo -e "\nrestart pve WebUI service ..."
    systemctl restart pveproxy.service && systemctl restart pvedaemon.service
    fi
}
trap cleanup EXIT


PVE_VERSION=$(pveversion | awk -F'/' '{print $2}' | awk -F'-' '{print $1}')
MIN_VERSION="8.0.0"
if [[ "$(echo -e "$MIN_VERSION\n$PVE_VERSION" | sort -V | head -n1)" != "$MIN_VERSION" ]]; then
    echo "The current PVE version $PVE_VERSION is lower than $MIN_VERSION. Please upgrade the PVE system version."
    exit 1
fi

########### Main ###########

echo -e "\nI have understood the purpose of this script and voluntarily assume the corresponding risks."
echo "我已了解该脚本的作用，并自愿承担对应的风险。"
read -p "Please enter y/Y to continue execution (请输入 y/Y 继续执行): " user_input
case "$user_input" in
    y|Y) Need_RestartAPI=1;;
    *)
        echo "Invalid input or operation canceled, exiting the script."
        echo "输入无效或用户取消操作，脚本退出。"
        exit 1
        ;;
esac

if [[ "$1" == "--restore" || "$1" == "-R" ]]; then
    restore_patch "/usr/share/perl5/PVE" "LXC.pm"
    restore_patch "/usr/share/perl5/PVE/LXC" "Config.pm"
    restore_patch "/usr/share/perl5/PVE/LXC" "Setup.pm"
    restore_patch "/usr/share/lxc/config" "oci.common.conf"
    rm /usr/share/perl5/PVE/LXC/Setup/Oci.pm
    modules=("binder_linux" "tun")
    for module in "${modules[@]}"; do
        if grep -q "$module" /etc/modules; then
        echo "remove $module in /etc/modules"
        sed -i "/^$module$/d" /etc/modules
        fi
    done
    rm /etc/modprobe.d/binder_linux.conf
    exit 0
fi

if ! command -v patch &> /dev/null; then
    echo "The 'patch' command is not found. Installing it now ..."
    apt update
    apt install -y patch
    clear 
    echo "The 'patch' command install successfully."
fi

if_already_patch

PATCH_VERSION=$(echo $PVE_VERSION |  awk -F'.' '{print $1"."$2}' )
case $PATCH_VERSION in
    8.3) echo "$PATCH_BASE64_83" | base64 -d > /tmp/patch_files.tar.gz ;;
    *) echo "$PATCH_BASE64_82" | base64 -d > /tmp/patch_files.tar.gz ;;
esac
tar -xzf /tmp/patch_files.tar.gz -C /tmp

Fail_Patches=()
apply_patch "/usr/share/perl5/PVE" "LXC.pm.diff"
apply_patch "/usr/share/perl5/PVE/LXC" "Config.pm.diff"
apply_patch "/usr/share/perl5/PVE/LXC" "Setup.pm.diff"
if [ -n "$Fail_NeedToRestore" ]; then
    restore_patch "/usr/share/perl5/PVE" "LXC.pm"
    restore_patch "/usr/share/perl5/PVE/LXC" "Config.pm"
    restore_patch "/usr/share/perl5/PVE/LXC" "Setup.pm"
    echo "The current PVE version is $PVE_VERSION."
    echo "If you need to submit an issue, please take a screenshot of this message and include it in your report."
    echo "当前 PVE 版本为 $PVE_VERSION。"
    echo "如需提交问题，请截图当前信息并附在报告中。"
    exit 1
fi

if [ ! -e /usr/share/lxc/config/oci.common.conf.bak ]; then
    echo "Patching /usr/share/lxc/config/oci.common.conf"
    cp /usr/share/lxc/config/oci.common.conf /usr/share/lxc/config/oci.common.conf.bak
    sed -i 's/^#lxc.hook.start-host/lxc.hook.start-host/' /usr/share/lxc/config/oci.common.conf
    sed -i 's/^#lxc.hook.stop/lxc.hook.stop/' /usr/share/lxc/config/oci.common.conf
    echo "lxc.include = /usr/share/lxc/config/common.conf.d/" >> /usr/share/lxc/config/oci.common.conf
fi
if [ ! -e /usr/share/perl5/PVE/LXC/Setup/Oci.pm ]; then
    echo "Creating /usr/share/perl5/PVE/LXC/Setup/Oci.pm"
    cp /usr/share/perl5/PVE/LXC/Setup/Unmanaged.pm /usr/share/perl5/PVE/LXC/Setup/Oci.pm
    sed -i 's/Unmanaged/Oci/g; s/unmanaged/oci/g' /usr/share/perl5/PVE/LXC/Setup/Oci.pm
    echo
fi

if ! ls /dev/snd/control* 1>/dev/null 2>&1; then
    echo "No /dev/snd/control* found, attempting to load appropriate module."
    audio_device=$(lspci | grep -i audio | tr '[:upper:]' '[:lower:]')
    if [[ "$audio_device" =~ "intel|amd" ]]; then
        snd_module=snd_hda_intel
    elif [[ "$audio_device" =~ "realtek" ]]; then
        snd_module=snd_hda_codec_realtek
    else
        snd_module=snd-dummy
    fi
    modprobe "$snd_module"
    if ! ls /dev/snd/control* 1>/dev/null 2>&1; then
    echo "Still not found /dev/snd/control* after module load, unloading module."
    rmod "$snd_module"
    fi
fi

load_module "binder_linux" "devices=binder,hwbinder,vndbinder"
load_module "tun"

echo -e "\nAll done! Make by lurenjbd"
