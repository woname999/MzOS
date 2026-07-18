#!/usr/bin/env bash

set -e

echo "================================"
echo "   MzOS RiotLauncher Installer"
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
echo "RiotLauncher installation is not implemented yet."

