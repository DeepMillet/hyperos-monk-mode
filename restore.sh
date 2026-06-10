#!/bin/bash

# ==========================================
# HyperOS Monk Mode Debloater
# Target: Xiaomi 15T / HyperOS
# ==========================================

GREEN='\033[0;32m'
RED='\033[0;31m'
BLUE='\033[0;34m'
NC='\033[0m'

echo -e "${BLUE}Initializing HyperOS Monk Mode...${NC}"

if ! command -v adb &> /dev/null; then
    echo -e "${RED}Error: ADB not found. Install android-tools.${NC}"
    exit 1
fi

DEVICE=$(adb devices | grep -w "device" | awk '{print $1}')
if [ -z "$DEVICE" ]; then
    echo -e "${RED}Error: No device connected or USB debugging disabled.${NC}"
    exit 1
fi

echo -e "${GREEN}Target Locked: $DEVICE${NC}\n"

# 1. Analytics & Tracking (The silent battery killers)
ANALYTICS=(
    "com.miui.analytics"
    "com.miui.msa.global"
    "com.xiaomi.joyose"
    "com.miui.daemon"
    "com.miui.bugreport"
)

# 2. Xiaomi Bloatware (Duplicate apps)
XIAOMI_BLOAT=(
    "com.miui.weather2"
    "com.miui.compass"
    "com.miui.notes"
    "com.miui.videoplayer"
    "com.miui.player"
    "com.xiaomi.scanner"
    "com.xiaomi.mipicks"
    "com.miui.yellowpage"
    "com.miui.browser"
)

# 3. Google Bloatware (Unnecessary background services)
GOOGLE_BLOAT=(
    "com.google.android.videos"
    "com.google.android.apps.podcasts"
    "com.google.android.projection.gearhead"
)

remove_packages() {
    local target_array=("$@")
    for pkg in "${target_array[@]}"; do
        echo -n "Purging $pkg... "
        adb shell pm uninstall --user 0 "$pkg" > /dev/null 2>&1
        if [ $? -eq 0 ]; then
            echo -e "${GREEN}Removed${NC}"
        else
            echo -e "${RED}Not Found / Failed${NC}"
        fi
    done
}

echo -e "${BLUE}[ PHASE 1: Purging Analytics ]${NC}"
remove_packages "${ANALYTICS[@]}"

echo -e "\n${BLUE}[ PHASE 2: Purging Xiaomi Bloat ]${NC}"
remove_packages "${XIAOMI_BLOAT[@]}"

echo -e "\n${BLUE}[ PHASE 3: Purging Google Bloat ]${NC}"
remove_packages "${GOOGLE_BLOAT[@]}"

echo -e "\n${GREEN}System Optimized. Welcome to Monk Mode.${NC}"
