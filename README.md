# qemu-arm64


make debug-linux

in linux directory:
gdb-mutiarch --tui vmlinux


target remote :1234
b start_kernel

c

next
step

quit
