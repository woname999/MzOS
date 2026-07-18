#!/usr/bin/env bash

set -e

echo "================================"
echo "      MzOS Steam Uninstaller"
echo "================================"
echo

if [ "$(id -u)" -ne 0 ]; then
    echo "Error: uninstaller must run as root."
    exit 1
fi


echo "[CHECK]"

if dpkg -s steam-installer >/dev/null 2>&1; then
    echo "Steam package detected."
else
    echo "Steam is not installed."
    exit 0
fi


echo
echo "[REMOVE]"

apt remove -y steam-installer


echo
echo "[VERIFY]"

if dpkg -s steam-installer >/dev/null 2>&1; then
    echo "Steam removal failed."
    exit 1
else
    echo "Steam removed successfully."
fi
