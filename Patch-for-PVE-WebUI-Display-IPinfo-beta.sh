#!/bin/bash
# Make by lurenjbd 2025-02-14
# Edited 2025-04-02
# Patch to make PCT WebUI display IP information.

########### Variable ###########

MIN_VERSION="8.1.0"
RESTORE_MODE=0
SKIP_CONFIRM=0
LANGUAGE="zh_cn"

# 颜色代码
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
NC='\033[0m' 

#  Patches BASE64
PATCH_BASE64='
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'

########### Function ###########
show_usage() {
    echo -e "${BLUE}==========================================================${NC}"
    echo -e "${BLUE}         PVE WebUI Display IP Info Patch Tool${NC}"
    echo -e "${BLUE}==========================================================${NC}"
    echo -e "用法 (Usage): $0 [选项 (Options)]"
    echo ""
    echo -e "选项 (Options):"
    echo -e "  -h, --help       显示此帮助信息 (Show this help message)"
    echo -e "  -R, --restore    恢复原始文件 (Restore original files)"
    echo -e "  -y, --yes        跳过确认提示 (Skip confirmation prompts)"
    echo -e "  -c, --chinese    使用中文显示消息（默认）"
    echo -e "  -e, --english    Use English for messages"
    echo ""
    echo -e "${BLUE}==========================================================${NC}"
}


printf_msg() {
    local text_zh="$1"
    local text_en="$2"
    local type="${3:-INFO}"
    
    local color=$BLUE
    case "$type" in
        SUCCESS) color=$GREEN ;;
        WARNING) color=$YELLOW ;;
        ERROR) color=$RED ;;
        *) color=$BLUE ;;
    esac
    
    if [[ "$LANGUAGE" == "zh_cn" ]]; then
        echo -e "${color}${text_zh}${NC}"
    else
        echo -e "${color}${text_en}${NC}"
    fi
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
            -y|--yes)
                SKIP_CONFIRM=1
                shift
                ;;
            -c|--chinese)
                LANGUAGE="zh_cn"
                shift
                ;;
            -e|--english)
                LANGUAGE="en_us"
                shift
                ;;
            *)
                printf_msg "错误: 未知选项 $1" "Error: Unknown option $1" "ERROR"
                show_usage
                exit 1
                ;;
        esac
    done
}


generate_path() {
    CREATE_NEW_FILE=0
    
    FIRST_LINE_PATH=$(awk 'NR==1 {print $2}' "$1")
    SECOND_LINE_PATH=$(awk 'NR==2 {print $2}' "$1")
    
    if [[ "$FIRST_LINE_PATH" == "/dev/null" ]]; then
        CREATE_NEW_FILE=1
    fi
    TARGET_FILE="${SECOND_LINE_PATH}"
    
    if [[ ! "${SECOND_LINE_PATH}" =~ ^/ ]]; then
        TARGET_FILE=""
    fi
}


check_ready() {
    generate_path "$1"

    if [[ -z "$TARGET_FILE" ]]; then
        printf_msg "无法从补丁中获取目标文件路径: $1" "Cannot get target file path from patch: $1" "ERROR"
        return 1
    fi

    BACKUP_FILE="$TARGET_FILE.bak"
    
    if [ -e "$BACKUP_FILE" ]; then
        printf_msg "备份文件已存在: $BACKUP_FILE" "Backup file already exists: $BACKUP_FILE" "WARNING"
    elif [ -e "$TARGET_FILE" ]; then
        NEED_BACKUP_FILES+=("$TARGET_FILE")
    else
        if [[ "$CREATE_NEW_FILE" -eq 1 ]]; then
            printf_msg "将创建新文件: $TARGET_FILE" "Will create new file: $TARGET_FILE" "SUCCESS"
        else
            printf_msg "未找到目标文件: $TARGET_FILE" "Target file not found: $TARGET_FILE" "ERROR"
            return 1
        fi
    fi

    TARGET_DIR=$(dirname "$TARGET_FILE")
    
    if [[ ! -d "$TARGET_DIR" && "$CREATE_NEW_FILE" -eq 1 ]]; then
        printf_msg "目标目录不存在，将创建: $TARGET_DIR" "Target directory does not exist, will create: $TARGET_DIR" "INFO"
        mkdir -p "$TARGET_DIR"
    fi

    PATCH_FILE="$1"
    if ! patch --dry-run -d "$TARGET_DIR" < "$PATCH_FILE" >/dev/null 2>&1; then
        # 8.3.3 之后的版本需要特殊处理
        if [[ "$FIX_VERSION" == "8.3.x" && "$TARGET_DIR" == "/usr/share/pve-manager/js" ]]; then
            PATCH_FILE=$(echo "$1" | sed 's/8\.3\.x/8.3.3/')
            if patch --dry-run -d "$TARGET_DIR" < "$PATCH_FILE" >/dev/null 2>&1; then
                printf_msg "补丁 $PATCH_FILE 可以成功应用" "$PATCH_FILE Patch can be apply successfully." "SUCCESS"
                CHECK_PATCH_PASS+=("$PATCH_FILE")
                return 0
            fi
        fi
        printf_msg "补丁 $PATCH_FILE 无法应用。请检查补丁文件和目标目录。" "$PATCH_FILE Patch cannot be apply. Please check the patch file and target directory." "ERROR"
        patch --dry-run -d "$TARGET_DIR" < "$PATCH_FILE" # 如果检查不通过，需要打印出是哪个部分不通过
        return 1
    else
        printf_msg "补丁 $PATCH_FILE 可以成功应用" "$PATCH_FILE Patch can be apply successfully." "SUCCESS"
        CHECK_PATCH_PASS+=("$1")
        return 0
    fi
}


restore_patch(){
	generate_path "$1"
	
	if [[ -z "$TARGET_FILE" ]]; then
		printf_msg "无法从补丁获取目标文件路径: $1" "Cannot get target file path from patch: $1" "ERROR"
		return 1
	fi
	
	BACKUP_FILE="$TARGET_FILE.bak"
    
    if [[ "$CREATE_NEW_FILE" -eq 1 ]]; then
        if [ -e "$TARGET_FILE" ]; then
            rm -f "$TARGET_FILE"
            printf_msg "已删除新创建的文件 $TARGET_FILE" "Deleted newly created file $TARGET_FILE" "INFO"
        else
            printf_msg "文件不存在，无需删除: $TARGET_FILE" "File does not exist, no need to delete: $TARGET_FILE" "INFO"
        fi
    else
        TARGET_DIR=$(dirname "$TARGET_FILE")
        PATCH_FILE="$1"
        
        printf_msg "尝试反向应用补丁: $PATCH_FILE" "Trying to reverse apply patch: $PATCH_FILE" "INFO"
        
        if [ -e "$TARGET_FILE" ] && patch -R --dry-run -d "$TARGET_DIR" < "$PATCH_FILE" >/dev/null 2>&1; then
            patch -R -d "$TARGET_DIR" < "$PATCH_FILE" > /dev/null 2>&1
            printf_msg "成功反向应用补丁，恢复文件 $TARGET_FILE" "Successfully reverse applied patch to restore $TARGET_FILE" "SUCCESS"
        elif [ -e "$BACKUP_FILE" ]; then
            printf_msg "反向应用补丁失败，使用备份文件恢复" "Reverse patch failed, using backup file to restore" "WARNING"
            mv $BACKUP_FILE $TARGET_FILE
            printf_msg "成功恢复文件 $TARGET_FILE" "Restore $TARGET_FILE file successfully." "SUCCESS"
        else
            printf_msg "未找到备份文件 $BACKUP_FILE 且无法反向应用补丁" "Backup file $BACKUP_FILE not found and cannot reverse apply patch." "WARNING"
        fi
    fi
}


arrays_equal() {
    local arr1=("${!1}")
    local arr2=("${!2}")

    if [ ${#arr1[@]} -ne ${#arr2[@]} ]; then
        printf_msg "补丁检查失败！" "Patch check Failed!" "ERROR"
        return 1
    fi

    local sorted1=$(printf '%s\n' "${arr1[@]}" | sort)
    local sorted2=$(printf '%s\n' "${arr2[@]}" | sort)
    
    if [ "$sorted1" = "$sorted2" ]; then
        printf_msg "补丁检查通过！可以应用到当前PVE版本" "Patch check passed! Can work with this version of PVE" "SUCCESS"
        return 0
    fi
}


check_running_vms() {
    local running_vms=0
    local running_cts=0

    if command -v qm &> /dev/null; then
        running_vms=$(qm list | grep running | wc -l)
    fi

    if command -v pct &> /dev/null; then
        running_cts=$(pct list | grep running | wc -l)
    fi

    total=$((running_vms + running_cts))
    echo "$total"
}

cleanup() {
    rm -rf /tmp/patch_files.tar.gz /tmp/pct-webui-patch
    if [ "$Need_RestartAPI" -eq 1 ]; then
        printf_msg "正在重启PVE Web界面服务..." "Restarting PVE Web UI services..." "INFO"
        systemctl restart pveproxy.service && systemctl restart pvedaemon.service
    fi
}
trap cleanup EXIT

read_user_input() {
    local prompt_zh="$1"
    local prompt_en="$2"
    local result
    
    if [[ "$LANGUAGE" == "zh_cn" ]]; then
        read -p "$prompt_zh" result
    else
        read -p "$prompt_en" result
    fi
    
    echo "$result"
}


########### Main ###########

PATCH_FILE_LIST=()
CHECK_PATCH_PASS=()
NEED_BACKUP_FILES=()
Need_RestartAPI=0

parse_arguments "$@"

PVE_VERSION=$(pveversion | awk -F'/' '{print $2}' | awk -F'-' '{print $1}')

if [[ "$(echo -e "$MIN_VERSION\n$PVE_VERSION" | sort -V | head -n1)" != "$MIN_VERSION" ]]; then
    printf_msg "当前PVE版本 $PVE_VERSION 低于 $MIN_VERSION。请升级PVE系统版本。" "The current PVE version $PVE_VERSION is lower than $MIN_VERSION. Please upgrade the PVE system version." "WARNING"
    exit 1
fi

if [[ "$SKIP_CONFIRM" -ne 1 ]]; then
    printf_msg "我已了解该脚本的作用，并自愿承担对应的风险。" "I have understood the purpose of this script and voluntarily assume the corresponding risks." "INFO"
    user_input=$(read_user_input "请输入 y/Y 继续执行: " "Please enter y/Y to continue: ")
    case "$user_input" in
        y|Y) Need_RestartAPI=1;;
        *)
            printf_msg "输入无效或用户取消操作，脚本退出。" "Invalid input or operation canceled, exiting the script." "ERROR"
            exit 1
            ;;
    esac
else
    Need_RestartAPI=1
fi

echo "$PATCH_BASE64" | base64 -d > /tmp/patch_files.tar.gz
tar -xzf /tmp/patch_files.tar.gz -C /tmp
FIX_VERSION=$(echo $PVE_VERSION |  awk -F'.' '{print $1"."$2".x"}' )
PATCH_TMP_DIR=$(find -L /tmp/pct-webui-patch/${FIX_VERSION} -name "*.diff")

if [[ -z "$PATCH_TMP_DIR" ]]; then
    printf_msg "未找到适用于PVE版本 ${FIX_VERSION} 的补丁文件。" "No patch files found for PVE version ${FIX_VERSION}." "WARNING"
    Need_RestartAPI=0
    exit 1
fi

if [[ "$RESTORE_MODE" -eq 1 ]]; then
    if ! grep -q "xtype: 'pveIPView'" /usr/share/pve-manager/js/pvemanagerlib.js; then
        printf_msg "未检测到补丁应用的痕迹，无需恢复。" "No patch application detected, no need to restore." "WARNING"
        Need_RestartAPI=0
        exit 0
    fi

    for FILE in $PATCH_TMP_DIR; do
        restore_patch "$FILE"
    done
    
    printf_msg "恢复完成，已还原到原始状态" "Restoration completed, system has been reverted to original state" "SUCCESS"
    exit 0
fi

if ! command -v patch &> /dev/null; then
    printf_msg "未找到 'patch' 命令，正在安装..." "The 'patch' command is not found. Installing it now..." "INFO"
    apt update
    apt install -y patch
    clear 
    printf_msg "'patch' 命令安装成功" "The 'patch' command was installed successfully" "SUCCESS"
fi

if grep -q "xtype: 'pveIPView'" /usr/share/pve-manager/js/pvemanagerlib.js; then
    printf_msg "该补丁已执行，请不要再次执行。如需恢复，请使用 -R 或 --restore 参数。" "The patch has already been applied. Please do not apply it again. If you need to revert, use the -R or --restore option." "WARNING"
    Need_RestartAPI=0
    exit 1
fi

for FILE in $PATCH_TMP_DIR; do
    check_ready "$FILE"
    PATCH_FILE_LIST+=("$FILE")
done

if ! arrays_equal PATCH_FILE_LIST[@] CHECK_PATCH_PASS[@]; then
    printf_msg "由于补丁检查不通过，脚本停止执行" "Script stop execution due to patch check failure" "ERROR"
    Need_RestartAPI=0
    exit 1
fi

for FILE in "${NEED_BACKUP_FILES[@]}"; do
    BACKUP_FILE="$FILE.bak"
    printf_msg "备份 $FILE 到 $BACKUP_FILE" "Backing up $FILE to $BACKUP_FILE" "INFO"
    cp "$FILE" "$BACKUP_FILE"
done

for FILE in "${CHECK_PATCH_PASS[@]}"; do
    printf_msg "应用补丁: $FILE" "Applying patch: $FILE" "INFO"
    generate_path $FILE
    TARGET_DIR=$(dirname "$TARGET_FILE")
    PATCH_FILE=$FILE
    patch -d "$TARGET_DIR" < "$PATCH_FILE" > /dev/null 2>&1
done

printf_msg "所有操作已完成！" "All operations completed successfully!" "SUCCESS"
printf_msg "作者: lurenjbd" "Author: lurenjbd" "INFO"

RUNNING_VMS=$(check_running_vms)
if [ -n "$RUNNING_VMS" ] && [ "$RUNNING_VMS" -gt 0 ]; then
    printf_msg "检测到当前有 $RUNNING_VMS 个运行中的虚拟机或容器，建议重启PVE宿主机以确保补丁完全生效。" \
               "Detected $RUNNING_VMS running VMs or containers, it is recommended to restart the PVE host to ensure the patch takes full effect." "WARNING"
fi
