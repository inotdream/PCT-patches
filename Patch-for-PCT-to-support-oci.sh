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
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'

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
    local arr1=("$1")
    local arr2=("$2")

    if [[ $(echo "${arr1[@]}" | tr ' ' '\n' | sort | tr '\n' ' ') == $(echo "${arr2[@]}" | tr ' ' '\n' | sort | tr '\n' ' ') ]]; then
        printf_msg "补丁检查通过！可以应用到当前PVE版本" "Patch check passed! Can work with this version of PVE"
    else
        printf_msg "补丁检查失败！可能不支持当前PVE版本" "Patch check Failed! Maybe doesn't support this version of PVE"
        exit 1
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
            Need_RestartAPI=0
            exit 1
            ;;
    esac
else
    Need_RestartAPI=1
fi

rm -rf /tmp/patch_files.tar.gz /tmp/pct-patch
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

arrays_equal $PATCH_FILE_LIST $CHECK_PATCH_PASS

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
