#!/usr/bin/env bash

set -e

echo "================================"
echo "       MzOS Wine Installer"
echo "================================"
echo

if [ "$(id -u)" -ne 0 ]; then
    echo "This installer must be run as root."
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

apt install -y wine wine32 wine64


echo
echo "Wine installation completed."
