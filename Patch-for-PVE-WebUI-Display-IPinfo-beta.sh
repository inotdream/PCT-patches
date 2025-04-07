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
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'

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

            cp "$NEW_PATCH_FILE" "$1"
            if patch --dry-run -d "$TARGET_DIR" < "$NEW_PATCH_FILE" >/dev/null 2>&1; then
                printf_msg "补丁 $1 可以成功应用（使用 8.3.3 版本）" "$1 Patch can be apply successfully (using version 8.3.3)."
                CHECK_PATCH_PASS+=("$1")
                return
            fi
        fi
        printf_msg "补丁 $1 无法应用。请检查补丁文件和目标目录。" "$1 Patch cannot be apply. Please check the patch file and target directory."
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


cleanup() {
    rm -rf /tmp/patch_files.tar.gz /tmp/webui-patch
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
PATCH_TMP_DIR=$(find /tmp/webui-patch/${FIX_VERSION} -name "*.diff")

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

if grep -q "my \$list = \[\];" /usr/share/perl5/PVE/LXC.pm; then
    printf_msg "该补丁已执行，请不要再次执行。如需恢复，请使用 -R 或 --restore 参数。" "The patch has already been applied. Please do not apply it again. If you need to revert, use the -R or --restore option."
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
