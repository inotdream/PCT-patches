#!/bin/bash
# Make by lurenjbd 2025-02-14
# Edited 2025-04-02
# Patch to make PCT WebUI display IP information.

########### Variable ###########

MIN_VERSION="8.0.0"
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

printf_msg "所有操作已完成！" "All operations completed successfully!"
printf_msg "作者: lurenjbd" "Author: lurenjbd"
