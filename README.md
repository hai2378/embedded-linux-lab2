# Embedded Linux Lab 2 – Character Device Driver, Procfs and Sysfs

* **Student Name:** Nguyễn Minh Hải
* **Target Architecture:** ARMv7 / Cortex-A9
* **Emulation Platform:** QEMU `vexpress-a9`
* **Linux Kernel Version:** 5.15

---

## 1. Introduction
Embedded Linux Lab 2 focuses on developing a loadable kernel module (LKM) implementing a Character Device Driver. The project covers character device registration, file operations (`open`, `release`, `read`, `write`), concurrency control using `mutex`, exposing driver statistics via `/proc/lab2_info`, and managing device attributes through `sysfs`.

---

## 2. Key Features and Implementation
* **Character Device Interface:** Registers a major number (`240`), creates device classes, and dynamically initializes device nodes under `/dev/lab2`.
* **Concurrency Protection:** Utilizes Linux kernel mutex mechanisms (`DEFINE_MUTEX`, `mutex_lock`, `mutex_unlock`) to prevent race conditions during read/write operations.
* **Procfs Integration:** Implements a custom `/proc/lab2_info` interface using the `seq_file` API to report runtime statistics such as open count, buffer size, and last written data.
* **Sysfs Attributes:** Exposes read-only device attributes (`buffer_len`, `open_count`, `last_data`) under the sysfs subsystem.

---

## 3. Repository Structure
* `driver/`: Contains the C source code (`lab2_driver.c`) and the kernel module `Makefile`.
* `bao_cao/`: Contains the detailed technical lab report (`NguyenMinhHai_Lab02_Report.md`).

---

## 4. Compilation and Usage
To compile the kernel module against the target Linux kernel headers:
```bash
make -C /path/to/kernel M=$(pwd) modules
