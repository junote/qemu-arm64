export ROOT_DIR := $(shell pwd)
export IMAGES_DIR := ${ROOT_DIR}/images
export CONFIG_DIR := ${ROOT_DIR}/config

.PHONY: uboot
uboot:
	@ tool/do_build_uboot.sh
	
.PHONY: uboot-distclean
uboot-distclean:
	@ make -C u-boot distclean


.PHONY: atf
atf:
	@ tool/do_build_atf.sh
	
.PHONY: atf-distclean
atf-distclean:
	@ make -C atf distclean
	
	
.PHONY: busybox
busybox:
	@ tool/do_build_busybox.sh

.PHONY: rootfs
rootfs:
	@ tool/do_build_rootfs.sh

.PHONY:linux 
linux:
	@ tool/do_build_linux.sh

.PHONY:debug-linux 
debug-linux:
	@ tool/do_debug_linux.sh



.PHONY: upgrade-qemu
upgrade-qemu:
	@ tool/do_upgrade_qemu.sh



.PHONY: qemu-uboot
qemu-uboot:
	@ tool/do_qemu_uboot.sh

.PHONY: qemu-linux
qemu-linux:
	@ tool/do_qemu_linux.sh


