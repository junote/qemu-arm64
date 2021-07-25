#!/bin/bash

pushd ${IMAGES_DIR}

wget https://download.qemu.org/qemu-6.1.0-rc0.tar.xz
tar xvJf qemu-6.1.0-rc0.tar.xz
cd qemu-6.1.0-rc0
sudo apt-get install git libglib2.0-dev libfdt-dev libpixman-1-dev zlib1g-dev
./configure
make -j8
sudo make install
