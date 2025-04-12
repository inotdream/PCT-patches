#!/bin/bash
# Make by lurenjbd 2025-02-10
# Edited 2025-03-29
# Patch to make PCT support OCI.

########### Variable ###########

MIN_VERSION="8.2.0"
RESTORE_MODE=0
DEBUG_MODE=0
SKIP_CONFIRM=0

#  Patches BASE64
PATCH_BASE64='
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
QCAQCOR+5W9nhFc6AGgBAA=='

########### Function ###########
show_usage() {
    echo "=========================================================="
    echo "                 PVE OCI Support Patch Tool"
    echo "=========================================================="
    echo "用法 (Usage): $0 [选项 (Options)]"
    echo ""
    echo "选项 (Options):"
    echo "  -h, --help       显示此帮助信息 (Show this help message)"
    echo "  -R, --restore    恢复原始文件 (Restore original files)"
    echo "  -v, --verbose    显示调试信息 (Display debugging information)"
    echo "  -y, --yes        跳过确认提示 (Skip confirmation prompts)"
    echo ""
    echo "=========================================================="
}


printf_msg() {
    echo -e "${1}"
    echo -e "${2:-$1}"
}

parse_arguments() {
    while [[ $# -gt 0 ]]; do
        case "$1" in
            -h|--help)
                show_usage
                exit 0
                ;;
            -R|--restore)
                RESTORE_MODE=1
                shift
                ;;
            -v|--verbose)
                DEBUG_MODE=1
                shift
                ;;
            -y|--yes)
                SKIP_CONFIRM=1
                shift
                ;;
            *)
                printf_msg "错误: 未知选项 $1" "Error: Unknown option $1"
                show_usage
                exit 1
                ;;
        esac
    done
}


generate_path() {
    PATCH_DIR=$(dirname "$1")
    PATCH_FILE=$(basename "$1")
    if [[ "$DEBUG_MODE" -eq 1 ]]; then
        echo "PATCH_DIR: ${PATCH_DIR}"
        echo "PATCH_FILE: ${PATCH_FILE}"
    fi

    if [[ "$PATCH_DIR" == *"js"* ]]; then
        TARGET_PATH="/usr/share/pve-manager/js"
        TARGET_FILE="${TARGET_PATH}/${PATCH_FILE%.diff}" 
    elif [[ "$PATCH_DIR" == *"perl5"* ]]; then
        TARGET_PATH="/usr/share/perl5"
        FIXED_PATH=$(echo "${PATCH_FILE%.diff}" | sed 's/_/\//g')
        if [[ "$DEBUG_MODE" -eq 1 ]]; then
            echo "FIXED_PATH: $FIXED_PATH"
        fi
        TARGET_FILE="${TARGET_PATH}/${FIXED_PATH}"
    else
        echo "Unsupported directory: $PATCH_DIR"
        TARGET_FILE=""
        return 1
    fi
    if [[ "$DEBUG_MODE" -eq 1 ]]; then
        echo "TARGET_FILE: ${TARGET_FILE}"
    fi
}


check_ready() {
    generate_path $1

    BACKUP_FILE="$TARGET_FILE.bak"
	if [ -e "$BACKUP_FILE" ]; then
		printf_msg "备份文件已存在: $BACKUP_FILE" "Backup file already exists: $BACKUP_FILE"
	elif [ -e "$TARGET_FILE" ]; then
        NEED_BACKUP_FILES+=("$TARGET_FILE")
	else
		printf_msg "未找到目标文件: $TARGET_FILE" "Target file not found: $TARGET_FILE"
	fi

    TARGET_DIR=$(dirname "$TARGET_FILE")
    if patch --dry-run -d "$TARGET_DIR" < "$1" >/dev/null 2>&1; then
        printf_msg "补丁 $1 可以成功应用" "$1 Patch can be apply successfully."
        CHECK_PATCH_PASS+=("$1")
    else
        printf_msg "补丁 $1 无法应用。请检查补丁文件和目标目录。" "$1 Patch cannot be apply. Please check the patch file and target directory."
    fi
}


restore_patch(){
	generate_path $1
	
	BACKUP_FILE="$TARGET_FILE.bak"
    
    if [ -e "$BACKUP_FILE" ]; then
        mv $BACKUP_FILE $TARGET_FILE
        printf_msg "成功恢复文件 $TARGET_FILE" "Restore $TARGET_FILE file successfully."
    else
        printf_msg "未找到备份文件 $BACKUP_FILE" "Backup file $BACKUP_FILE not found."
    fi
}


arrays_equal() {
    local arr1=("${!1}")
    local arr2=("${!2}")

    if [ ${#arr1[@]} -ne ${#arr2[@]} ]; then
        printf_msg "补丁检查失败！" "Patch check Failed!"
        if [[ "$DEBUG_MODE" -eq 1 ]]; then
            echo "PATCH_FILE_LIST长度: ${#arr1[@]}"
            echo "CHECK_PATCH_PASS长度: ${#arr2[@]}"
            echo "缺少的补丁: "
            comm -23 <(printf '%s\n' "${arr1[@]}" | sort) <(printf '%s\n' "${arr2[@]}" | sort)
        fi
        return 1
    fi

    local sorted1=$(printf '%s\n' "${arr1[@]}" | sort)
    local sorted2=$(printf '%s\n' "${arr2[@]}" | sort)
    
    if [ "$sorted1" = "$sorted2" ]; then
        printf_msg "补丁检查通过！可以应用到当前PVE版本" "Patch check passed! Can work with this version of PVE"
        return 0
    fi
}


load_module() {
    local module=$1
    local params=$2
    local modules_file="/etc/modules"
    local modprobe_conf_file="/etc/modprobe.d/$module.conf"

    if ! lsmod | grep -q "$module"; then
    printf_msg "$module 模块未加载，正在加载..." "$module is not loaded, loading module..."
    if [[ -n "$params" ]]; then
        modprobe "$module" $params
    else
        modprobe "$module"
    fi
    else
    printf_msg "$module 模块已加载" "$module is already loaded."
    fi

    if ! grep -q "$module" "$modules_file"; then
    printf_msg "添加 $module 到 $modules_file" "Adding $module to $modules_file"
    echo "$module" >> "$modules_file"
    fi
    if [[ -n "$params" && ! -f "$modprobe_conf_file" ]]; then
    echo "options $module $params" > "$modprobe_conf_file"
    fi
}

check_running_vms() {
    local running_vms=0
    local running_cts=0

    if command -v qm &> /dev/null; then
        running_vms=$(qm list | grep running | wc -l)
        if [[ "$DEBUG_MODE" -eq 1 ]]; then
            echo "运行中的虚拟机数量: $running_vms"
        fi
    fi

    if command -v pct &> /dev/null; then
        running_cts=$(pct list | grep running | wc -l)
        if [[ "$DEBUG_MODE" -eq 1 ]]; then
            echo "运行中的容器数量: $running_cts"
        fi
    fi

    echo $((running_vms + running_cts))
}

cleanup() {
    rm -rf /tmp/patch_files.tar.gz /tmp/pct-patch
    if [ "$Need_RestartAPI" -eq 1 ]; then
        printf_msg "正在重启PVE Web界面服务..." "Restarting PVE Web UI services..."
        systemctl restart pveproxy.service && systemctl restart pvedaemon.service
    fi
}
trap cleanup EXIT




########### Main ###########

PATCH_FILE_LIST=()
CHECK_PATCH_PASS=()
NEED_BACKUP_FILES=()
Need_RestartAPI=0

parse_arguments "$@"

if [[ "$DEBUG_MODE" -eq 1 ]]; then
    printf_msg "已启用调试模式，将显示更多调试信息" "Debug mode enabled, more debugging information will be displayed"
fi

PVE_VERSION=$(pveversion | awk -F'/' '{print $2}' | awk -F'-' '{print $1}')

if [[ "$DEBUG_MODE" -eq 1 ]]; then
    echo "PVE_VERSION: $PVE_VERSION"
fi

if [[ "$(echo -e "$MIN_VERSION\n$PVE_VERSION" | sort -V | head -n1)" != "$MIN_VERSION" ]]; then
    printf_msg "当前PVE版本 $PVE_VERSION 低于 $MIN_VERSION。请升级PVE系统版本。" "The current PVE version $PVE_VERSION is lower than $MIN_VERSION. Please upgrade the PVE system version."
    exit 1
fi

if [[ "$SKIP_CONFIRM" -ne 1 ]]; then
    printf_msg "我已了解该脚本的作用，并自愿承担对应的风险。" "I have understood the purpose of this script and voluntarily assume the corresponding risks."
    read -p "请输入 y/Y 继续执行 (Please enter y/Y to continue): " user_input
    case "$user_input" in
        y|Y) Need_RestartAPI=1;;
        *)
            printf_msg "输入无效或用户取消操作，脚本退出。" "Invalid input or operation canceled, exiting the script."
            exit 1
            ;;
    esac
else
    Need_RestartAPI=1
fi

echo "$PATCH_BASE64" | base64 -d > /tmp/patch_files.tar.gz
tar -xzf /tmp/patch_files.tar.gz -C /tmp
FIX_VERSION=$(echo $PVE_VERSION |  awk -F'.' '{print $1"."$2".x"}' )
PATCH_TMP_DIR=$(find /tmp/pct-patch/${FIX_VERSION} -name "*.diff")

if [[ -z "$PATCH_TMP_DIR" ]]; then
    printf_msg "未找到适用于PVE版本 ${FIX_VERSION} 的补丁文件。" "No patch files found for PVE version ${FIX_VERSION}."
    Need_RestartAPI=0
    exit 1
fi

if [[ "$RESTORE_MODE" -eq 1 ]]; then

    for FILE in $PATCH_TMP_DIR; do
        echo
        restore_patch "$FILE"
        echo
    done

    mv /usr/share/lxc/config/oci.common.conf.bak /usr/share/lxc/config/oci.common.conf
    rm /usr/share/perl5/PVE/LXC/Setup/Oci.pm
    
    modules=("binder_linux" "mac80211_hwsim")
    for module in "${modules[@]}"; do
        if grep -q "$module" /etc/modules; then
        printf_msg "从 /etc/modules 中移除 $module" "Removing $module from /etc/modules"
        sed -i "/^$module$/d" /etc/modules
        fi
    done
    rm /etc/modprobe.d/binder_linux.conf
    
    printf_msg "恢复完成，已还原到原始状态" "Restoration completed, system has been reverted to original state"
    exit 0
fi

if ! command -v patch &> /dev/null; then
    printf_msg "未找到 'patch' 命令，正在安装..." "The 'patch' command is not found. Installing it now..."
    apt update
    apt install -y patch
    clear 
    printf_msg "'patch' 命令安装成功" "The 'patch' command was installed successfully"
fi

if [ -f /usr/share/perl5/PVE/LXC/Setup/Oci.pm ]; then
    printf_msg "该补丁已执行，请不要再次执行。如需恢复，请使用 -R 或 --restore 参数。" "The patch has already been applied. Please do not apply it again. If you need to revert, use the -R or --restore option."
    Need_RestartAPI=0
    exit 1
fi

for FILE in $PATCH_TMP_DIR; do
    echo
    check_ready "$FILE"
    PATCH_FILE_LIST+=("$FILE")
    echo
done

if [[ "$DEBUG_MODE" -eq 1 ]]; then
    echo "PATCH_FILE_LIST: ${PATCH_FILE_LIST[@]}"
    echo "CHECK_PATCH_PASS: ${CHECK_PATCH_PASS[@]}"
    echo "NEED_BACKUP_FILES: ${NEED_BACKUP_FILES[@]}"
fi

if ! arrays_equal PATCH_FILE_LIST[@] CHECK_PATCH_PASS[@]; then
    printf_msg "由于补丁检查不通过，脚本停止执行" "Script stop execution due to patch check failure"
    Need_RestartAPI=0
    exit 1
fi

for FILE in "${NEED_BACKUP_FILES[@]}"; do
    BACKUP_FILE="$FILE.bak"
    printf_msg "备份 $FILE 到 $BACKUP_FILE" "Backing up $FILE to $BACKUP_FILE"
    cp "$FILE" "$BACKUP_FILE"
done

for FILE in "${CHECK_PATCH_PASS[@]}"; do
    printf_msg "应用补丁: $FILE" "Applying patch: $FILE"
    generate_path $FILE
    TARGET_DIR=$(dirname "$TARGET_FILE")
    patch -d "$TARGET_DIR" < "$FILE"
done

if [ ! -e /usr/share/lxc/config/oci.common.conf.bak ]; then
    printf_msg "修改 /usr/share/lxc/config/oci.common.conf" "Patching /usr/share/lxc/config/oci.common.conf"
    cp /usr/share/lxc/config/oci.common.conf /usr/share/lxc/config/oci.common.conf.bak
    sed -i 's/^#lxc.hook.start-host/lxc.hook.start-host/' /usr/share/lxc/config/oci.common.conf
    sed -i 's/^#lxc.hook.stop/lxc.hook.stop/' /usr/share/lxc/config/oci.common.conf
    echo "lxc.include = /usr/share/lxc/config/common.conf.d/" >> /usr/share/lxc/config/oci.common.conf
fi
if [ ! -e /usr/share/perl5/PVE/LXC/Setup/Oci.pm ]; then
    printf_msg "创建 /usr/share/perl5/PVE/LXC/Setup/Oci.pm" "Creating /usr/share/perl5/PVE/LXC/Setup/Oci.pm"
    cp /usr/share/perl5/PVE/LXC/Setup/Unmanaged.pm /usr/share/perl5/PVE/LXC/Setup/Oci.pm
    sed -i 's/Unmanaged/Oci/g; s/unmanaged/oci/g' /usr/share/perl5/PVE/LXC/Setup/Oci.pm
    echo
fi

load_module "binder_linux" "devices=binder,hwbinder,vndbinder"
load_module "mac80211_hwsim"

printf_msg "所有操作已完成！" "All operations completed successfully!"
printf_msg "作者: lurenjbd" "Author: lurenjbd"

RUNNING_VMS=$(check_running_vms)
if [ "$RUNNING_VMS" -gt 0 ]; then
    printf_msg "检测到当前有 $RUNNING_VMS 个运行中的虚拟机或容器，建议重启PVE宿主机以确保补丁完全生效。" \
               "Detected $RUNNING_VMS running VMs or containers, it is recommended to restart the PVE host to ensure the patch takes full effect."
fi
