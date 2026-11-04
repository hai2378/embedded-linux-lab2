# Lab 02 report — Character Device Driver, procfs/sysfs and MTD/JFFS2

**Target:** QEMU vexpress-a9 (ARM Cortex-A9), Linux 5.15.

## Objective
Implement a character device driver with user/kernel memory transfer and expose state through procfs/sysfs; explore NAND flash simulation with MTD and JFFS2.

## Source and design
The recovered `driver/lab2_driver.c` implements `/dev/lab2` (major 240, minor 0), a 1024-byte buffer, open/read/write/release, copy-to/from-user routines, a mutex, `/proc/lab2_info`, and sysfs attributes (`buffer_len`, `open_count`, `last_data`).

## MTD/JFFS2 experiment
The original chat describes `nandsim` setup, JFFS2 image creation, flash writes, mounting and a data-persistence check after unmount/remount. Use only a verified simulated flash device when attempting these procedures.

## QEMU integration
The conversation reports autoloading the module through BusyBox `rcS` and testing with a Linux 5.15 zImage/DTB from Lab 1. The rootfs script excerpts are provided in this repository.

## Evidence limitation
The transcript reports success but does not include complete original `.ko`, initramfs, raw test logs or test screenshots. Files included here are documented/reconstructed sources, not a substitute for those original artefacts.
