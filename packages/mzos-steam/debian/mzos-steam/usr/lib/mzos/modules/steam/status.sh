#!/usr/bin/env bash

echo "================================"
echo "      MzOS Steam Status"
echo "================================"
echo

echo "[STEAM]"

if dpkg -s steam-installer >/dev/null 2>&1; then

    VERSION=$(dpkg -s steam-installer | grep Version | cut -d ':' -f2 | sed 's/^ //')

    echo "Package : Installed"
    echo "Version : $VERSION"

else

    echo "Package : Not installed"
    exit 1

fi


echo
echo "[STATUS]"
echo "Steam is ready."
