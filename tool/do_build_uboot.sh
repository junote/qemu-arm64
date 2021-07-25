#!/bin/bash

pushd ${ROOT_DIR}
if [ ! -f ${ROOT_DIR}/u-boot ]
then
    echo "u-boot does not exist, clone it"
    git clone https://github.com/u-boot/u-boot.git
fi
pushd u-boot

#git checkout

export CROSS_COMPILE=aarch64-linux-gnu-
export ARCH=arm64
make qemu_arm64_defconfig
make -j8
cp u-boot.bin ${IMAGS_DIR}/
make distclean
popd



