#!/usr/bin/env bash

echo "================================"
echo "        MzOS Health Check"
echo "================================"
echo

echo "[SYSTEM]"

if [ -f /etc/os-release ]; then
    . /etc/os-release
    echo "OS      : $PRETTY_NAME"
else
    echo "OS      : Unknown"
fi

echo "Kernel  : $(uname -r)"
echo "Desktop : ${XDG_CURRENT_DESKTOP:-Unknown}"

echo

echo "[HARDWARE]"

if [ -r /proc/cpuinfo ]; then
    CPU=$(grep -m1 "model name" /proc/cpuinfo | cut -d ':' -f2 | xargs)
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
    OPENGL=$(glxinfo | grep "OpenGL renderer" | cut -d ':' -f2 | sed 's/^ *//')
    echo "OpenGL  : $OPENGL"
else
    echo "OpenGL  : Not installed"
fi

if command -v vulkaninfo >/dev/null; then
    echo "Vulkan  : Available"
else
    echo "Vulkan  : Not detected"
fi

echo

echo "[STATUS]"
echo "Health Check completed."
