#!/bin/bash

pushd ${ROOT_DIR}
if [ ! -f atf ]
then
    echo "atf does not exist, clone it"
    git clone https://github.com/ARM-software/arm-trusted-firmware.git  atf
fi
pushd atf

#git checkout

export CROSS_COMPILE=aarch64-linux-gnu-
export ARCH=arm64
# make PLAT=qemu BL33=${IMAGES_DIR}/u-boot.bin all fip
make PLAT=qemu BL33=${IMAGES_DIR}/QEMU_EFI.fd all fip
dd if=build/qemu/release/bl1.bin of=flash.bin bs=4096 conv=notrunc
dd if=build/qemu/release/fip.bin of=flash.bin seek=64 bs=4096 conv=notrunc
mv flash.bin ${IMAGES_DIR}/
rm build -rf
popd



