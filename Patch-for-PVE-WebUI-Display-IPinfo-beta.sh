#!/bin/bash
# Make by lurenjbd 2025-02-14
# Edited 2025-04-02
# Patch to make PCT WebUI display IP information.

########### Variable ###########

MIN_VERSION="8.1.0"
RESTORE_MODE=0
DEBUG_MODE=0
SKIP_CONFIRM=0

#  Patches BASE64
PATCH_BASE64='
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
hJxW/gBB8o0BAJABAA=='

########### Function ###########
show_usage() {
    echo "=========================================================="
    echo "         PVE WebUI Display IP Info Patch Tool"
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

    if ! patch --dry-run -d "$TARGET_DIR" < "$1" >/dev/null 2>&1; then
        if [[ "$FIX_VERSION" == "8.3.x" && "$TARGET_DIR" == "/usr/share/pve-manager/js" ]]; then

            NEW_PATCH_FILE=$(echo "$1" | sed 's/8\.3\.x/8.3.3/')
            if [[ "$DEBUG_MODE" -eq 1 ]]; then
                echo "尝试使用 8.3.3 版本的补丁: $NEW_PATCH_FILE"
            fi

            if patch --dry-run -d "$TARGET_DIR" < "$NEW_PATCH_FILE" >/dev/null 2>&1; then
                printf_msg "补丁 $NEW_PATCH_FILE 可以成功应用" "$NEW_PATCH_FILE Patch can be apply successfully."
                CHECK_PATCH_PASS+=("$NEW_PATCH_FILE")
                return
            fi
        fi
        printf_msg "补丁 $NEW_PATCH_FILE 无法应用。请检查补丁文件和目标目录。" "$NEW_PATCH_FILE Patch cannot be apply. Please check the patch file and target directory."
    else
        printf_msg "补丁 $1 可以成功应用" "$1 Patch can be apply successfully."
        CHECK_PATCH_PASS+=("$1")
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
    rm -rf /tmp/patch_files.tar.gz /tmp/pct-webui-patch
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
PATCH_TMP_DIR=$(find /tmp/pct-webui-patch/${FIX_VERSION} -name "*.diff")

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

if grep -q "xtype: 'pveIPView'" /usr/share/pve-manager/js/pvemanagerlib.js; then
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

printf_msg "所有操作已完成！" "All operations completed successfully!"
printf_msg "作者: lurenjbd" "Author: lurenjbd"

RUNNING_VMS=$(check_running_vms)
if [ "$RUNNING_VMS" -gt 0 ]; then
    printf_msg "检测到当前有 $RUNNING_VMS 个运行中的虚拟机或容器，建议重启PVE宿主机以确保补丁完全生效。" \
               "Detected $RUNNING_VMS running VMs or containers, it is recommended to restart the PVE host to ensure the patch takes full effect."
fi
