#!/usr/bin/env bash

set -e

echo "================================"
echo " MzOS RiotLauncher Uninstaller"
echo "================================"
echo

if [ "$(id -u)" -ne 0 ]; then
    echo "This uninstaller must be run as root."
    exit 1
fi

echo "RiotLauncher uninstall is not implemented yet."
