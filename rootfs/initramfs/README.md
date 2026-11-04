# Partial initramfs files

Only small boot/test scripts recoverable from the chat PDF are included. The original BusyBox binaries, `/dev` special nodes and `lab2_driver.ko` are **not present**, so this is not a complete bootable initramfs.

Copy the real module to `/lib/modules/5.15.0/lab2_driver.ko` inside the complete Lab 2 rootfs after it is built. Check `vermagic` and major number/device allocation before running.
