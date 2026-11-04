# Binary outputs not included

The Gemini dialogue reports building `lab2_driver.ko` and `initramfs_lab2.cpio.gz`, but their bytes are not present in the exported PDF. Do not mistake source code and scripts for a compiled ARM kernel module or a bootable initramfs.

Add actual outputs from your Ubuntu host and verify with `file` and `modinfo` before publishing.
