#!/bin/bash

set -e

KERNEL_MAJOR_VER=$(uname -r | cut -d. -f1,2)
TARBALL_PATH="/usr/src/linux-source-${KERNEL_MAJOR_VER}.tar.xz"
if [ ! -f "$TARBALL_PATH" ]; then
    TARBALL_PATH=$(find /usr/src -maxdepth 1 -name "linux-source-*.tar.xz" | sort -V | tail -n 1)
fi

if [ -z "$TARBALL_PATH" ] || [ ! -f "$TARBALL_PATH" ]; then
    echo "Error: linux-source tarball not found."
    exit 1
fi

echo "Extracting vxlan sources from $TARBALL_PATH..."

TEMP_DIR=$(mktemp -d)
tar -xf "$TARBALL_PATH" -C "$TEMP_DIR" --wildcards "*/drivers/net/vxlan"
SRC_DIR=$(find "$TEMP_DIR" -maxdepth 1 -type d -name "linux-*" | head -n 1)

if [ ! -d "$SRC_DIR/drivers/net/vxlan" ]; then
    echo "Error: vxlan directory not found in archive."
    rm -rf "$TEMP_DIR"
    exit 1
fi

# Create Kbuild file from the original Makefile to avoid conflicts with the existing Makefile
cp "$SRC_DIR/drivers/net/vxlan/Makefile" ./Kbuild

cp "$SRC_DIR/drivers/net/vxlan/"*.[ch] ./
rm -rf "$TEMP_DIR"

patch -p0 < ignore_df.patch

# Rewriting Kbuild for vxlan2 module...
sed -i -E 's/obj-\$\(CONFIG_VXLAN\)\s*\+=\s*vxlan\.o/obj-m += vxlan2.o/g' Kbuild
sed -i 's/vxlan-/vxlan2-/g' Kbuild
sed -i 's/vxlan-objs/vxlan2-objs/g' Kbuild
