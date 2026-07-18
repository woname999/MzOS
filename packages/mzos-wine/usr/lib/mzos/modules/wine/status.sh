#!/usr/bin/env bash

echo "================================"
echo "        MzOS Wine Status"
echo "================================"
echo

if command -v wine >/dev/null 2>&1; then
    echo "[WINE]"
    echo "Version : $(wine --version)"
    echo "Status  : Installed"
else
    echo "[WINE]"
    echo "Status : Not installed"
fi
