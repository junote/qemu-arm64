#!/bin/bash

pushd ${IMAGES_DIR}

# qemu-system-aarch64 -nographic -machine virt -cpu cortex-a57  \
#     -smp 2 -m  2048 -machine type=virt  \
#     -kernel Image                      \
#     -append 'rdinit=/linuxrc console=ttyAMA0,38400 nokaslr'
#     -initrd rootfs.cpio.gz

qemu-system-aarch64 -nographic -machine virt -cpu cortex-a57  \
    -kernel Image -no-acpi                     \
    -append 'rdinit=/linuxrc console=ttyAMA0,38400 nokaslr keep_bootcon'  \
    -initrd rootfs.cpio.gz -smp 2 -m 1024    \
    -s -S






