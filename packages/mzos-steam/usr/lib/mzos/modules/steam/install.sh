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

dpkg --add-architecture i386

echo "i386 architecture enabled."


echo
echo "[UPDATE]"

apt update


echo
echo "[INSTALL]"

apt install -y steam


echo
echo "Steam installation completed."
