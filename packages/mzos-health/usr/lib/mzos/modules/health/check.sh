#!/usr/bin/env bash

set -e

VERSION="0.2.0"


fix_system() {

    if [ "$(id -u)" -ne 0 ]; then
        echo "Health fix requires root privileges."
        exit 1
    fi

    echo
    echo "[FIX]"

    SOURCES="/etc/apt/sources.list"

    echo "Updating Debian repositories..."

    if [ -f "$SOURCES" ]; then

        sed -i \
        's/main non-free-firmware/main contrib non-free non-free-firmware/g' \
        "$SOURCES"

        echo "Repositories updated."

    else

        echo "sources.list not found."
        exit 1

    fi


    echo "Enabling i386 architecture..."

    dpkg --add-architecture i386


    echo "Updating package database..."

    apt update


    echo
    echo "Fix completed."
}


check_apt() {

    echo
    echo "[APT]"

    SOURCES="/etc/apt/sources.list"


    if grep -qE '(^| )main($| )' "$SOURCES"; then
        echo "main                OK"
    else
        echo "main                MISSING"
    fi


    if grep -qE '(^| )contrib($| )' "$SOURCES"; then
        echo "contrib             OK"
    else
        echo "contrib             MISSING"
    fi


    if grep -qE '(^| )non-free($| )' "$SOURCES"; then
        echo "non-free            OK"
    else
        echo "non-free            MISSING"
    fi


    if grep -qE '(^| )non-free-firmware($| )' "$SOURCES"; then
        echo "non-free-firmware   OK"
    else
        echo "non-free-firmware   MISSING"
    fi


    echo
    echo "Multiarch:"


    if dpkg --print-foreign-architectures | grep -q i386; then
        echo "i386                OK"
    else
        echo "i386                MISSING"
    fi
}

echo "================================"
echo "        MzOS Health Check"
echo "================================"


if [ "$1" = "--fix" ]; then
    fix_system
fi


echo
echo "[SYSTEM]"


if command -v hostnamectl >/dev/null; then
    OS=$(hostnamectl | grep "Operating System" | cut -d ':' -f2 | sed 's/^ *//')
    echo "OS      : $OS"
else
    echo "OS      : Unknown"
fi


echo "Kernel  : $(uname -r)"


if command -v echo >/dev/null; then
    if [ -n "$XDG_CURRENT_DESKTOP" ]; then
        echo "Desktop : $XDG_CURRENT_DESKTOP"
    else
        echo "Desktop : Unknown"
    fi
fi



echo
echo "[HARDWARE]"


if command -v lscpu >/dev/null; then
    CPU=$(cat /proc/cpuinfo | grep "model name" | head -1 | cut -d ':' -f2 | sed 's/^ *//')
    echo "CPU     : $CPU"
else
    echo "CPU     : Unknown"
fi


if command -v free >/dev/null; then
    RAM=$(free -h | awk '/Mem:/ {print $2}')
    echo "RAM     : $RAM"
else
    echo "RAM     : Unknown"
fi


if command -v lspci >/dev/null; then
    GPU=$(lspci | grep -E "VGA|3D" | cut -d ':' -f3- | sed 's/^ *//')
    echo "GPU     : $GPU"
else
    echo "GPU     : Unknown"
fi



echo
echo "[GAMING]"

if command -v glxinfo >/dev/null; then

    if [ -n "$DISPLAY" ]; then

        OPENGL=$(glxinfo | grep "OpenGL renderer" | cut -d ':' -f2 | sed 's/^ *//')
        echo "OpenGL  : $OPENGL"

    else

        echo "OpenGL  : Skipped (no display)"

    fi

else

    echo "OpenGL  : Unknown"

fi

if command -v vulkaninfo >/dev/null; then
    echo "Vulkan  : Available"
else
    echo "Vulkan  : Not detected"
fi


check_apt


echo
echo "[STATUS]"
echo "Health Check completed."
