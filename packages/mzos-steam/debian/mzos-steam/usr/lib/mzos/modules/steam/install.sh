#!/usr/bin/env bash

set -e

echo "================================"
echo "      MzOS Steam Installer"
echo "================================"
echo

if [ "$(id -u)" -ne 0 ]; then
    echo "Error: installer must run as root."
    exit 1
fi


echo "[CHECK]"

ARCH=$(dpkg --print-architecture)

echo "Architecture : $ARCH"

if [ "$ARCH" != "amd64" ]; then
    echo "Unsupported architecture."
    exit 1
fi


echo
echo "[MULTIARCH]"

if dpkg --print-foreign-architectures | grep -q i386; then
    echo "i386 architecture already enabled."
else
    dpkg --add-architecture i386
    echo "i386 architecture enabled."
fi


echo
echo "[UPDATE]"

apt update


echo
echo "[INSTALL]"

if dpkg -s steam-installer >/dev/null 2>&1; then
    echo "Steam already installed."
else
    apt install -y steam-installer
fi


echo
echo "[VERIFY]"

if dpkg -s steam-installer >/dev/null 2>&1; then
    echo "Steam installation verified."
else
    echo "Steam installation failed."
    exit 1
fi


echo
echo "Steam installation completed."
