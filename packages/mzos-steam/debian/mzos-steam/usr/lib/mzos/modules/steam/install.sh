#!/usr/bin/env bash

set -e

echo "================================"
echo "      MzOS Steam Installer"
echo "================================"
echo

echo "[CHECK]"

if [ "$(id -u)" -ne 0 ]; then
    echo "This installer must be run as root."
    exit 1
fi

ARCH=$(dpkg --print-architecture)

echo "Architecture : $ARCH"

if [ "$ARCH" != "amd64" ]; then
    echo "Unsupported architecture."
    exit 1
fi

echo "System OK."
echo
echo "Steam installation is not implemented yet."
