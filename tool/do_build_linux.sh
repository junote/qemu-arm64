#!/bin/bash

pushd ${ROOT_DIR}
if [[ ! -f linux ]]
then
    echo "linux does not exist, clone it"
    git clone https://gitee.com/mirrors/linux.git
fi
pushd linux

#git checkout

export CROSS_COMPILE=aarch64-linux-gnu-
export ARCH=arm64
cp ${CONFIG_DIR}/linux.config arch/arm64/configs/qemu_defconfig
make qemu_defconfig
make -j8
cp arch/arm64/boot/Image ${IMAGES_DIR}/
popd



