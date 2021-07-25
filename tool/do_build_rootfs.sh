#!/bin/bash

pushd ${IMAGES_DIR}/root


mkdir etc
mkdir dev
mkdir mnt
mkdir -p etc/init.d/

cat << EOF > etc/init.d/rcS
mkdir -p /proc
mkdir -p /tmp
mkdir -p /sys
mkdir -p /mnt
/bin/mount -a
mkdir -p /dev/pts
mount -t devpts devpts /dev/pts
echo /sbin/mdev > /proc/sys/kernel/hotplug
mdev -s
EOF

sudo chmod +x etc/init.d/rcS

cat << EOF > etc/fstab
proc /proc proc defaults 0 0
tmpfs /tmp tmpfs defaults 0 0
sysfs /sys sysfs defaults 0 0
tmpfs /dev tmpfs defaults 0 0
debugfs /sys/kernel/debug debugfs defaults 0 0
EOF

cat << EOF > inittab
::sysinit:/etc/init.d/rcS
::respawn:-/bin/sh
::askfirst:-/bin/sh
::ctrlaltdel:/bin/umount -a -r
EOF

pushd dev
sudo mknod console c 5 1
sudo mknod null c 1 3

sudo find . | cpio -o -H newc | gzip >../rootfs.cpio.gz
popd
popd

