#!/bin/bash

pushd ${ROOT_DIR}
if [ ! -f busybox ]
then
    echo "busybox does not exist, clone it"
    git clone https://github.com/mirror/busybox.git
fi
pushd busybox

#git checkout

export CROSS_COMPILE=aarch64-linux-gnu-
export ARCH=arm64
cp ${CONFIG_DIR}/busybox.config configs/busybox_defconfig
make busybox_defconfig
make -j8
# rm -rf ${IMAGES_DIR}/root
mkdir -p ${IMAGES_DIR}/root
make PREFIX=${IMAGES_DIR}/root install
# make distclean
popd



