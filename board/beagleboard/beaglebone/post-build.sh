#!/bin/sh
set -eu

BOARD_DIR="$(dirname "$0")"

#cp "${BOARD_DIR}/uEnv.txt" "${BINARIES_DIR}/uEnv.txt"

#install -m 0644 -D "${BOARD_DIR}/extlinux.conf" "${BINARIES_DIR}/extlinux/extlinux.conf"

# Falcon mode expects a device tree blob at the raw 'args' sector, not plain text
cp "${BINARIES_DIR}/am335x-boneblack.dtb" "${BINARIES_DIR}/args"
"${HOST_DIR}/bin/fdtput" -t s "${BINARIES_DIR}/args" /chosen bootargs "$(cat "${BOARD_DIR}/args")"