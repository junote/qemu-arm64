#!/bin/bash

pushd ${IMAGES_DIR}

# qemu-system-aarch64 -nographic -machine virt,secure=on -cpu cortex-a57  \
#     -kernel Image -no-acpi                     \
#     -append 'console=ttyAMA0,38400 keep_bootcon'  \
#     -initrd rootfs.cpio.gz -smp 2 -m 1024 -bios flash.bin   \
#     -d unimp

qemu-system-aarch64 -nographic -machine virt,secure=on -cpu cortex-a57  \
     -no-acpi                     \
    -smp 2 -m 1024 -bios flash.bin   \
    -d unimp

