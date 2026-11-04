# Embedded Linux Lab 2 Report: Character Device Driver, Procfs and Sysfs

* **Student Name:** Nguyễn Minh Hải
* **Target Architecture:** ARMv7 / Cortex-A9
* **Emulation Platform:** QEMU `vexpress-a9`
* **Linux Kernel Version:** 5.15

---

## 1. Introduction
Embedded Linux Lab 2 focuses on developing a Loadable Kernel Module (LKM) implementing a character device driver. The project covers device file operations (`open`, `release`, `read`, `write`), concurrency protection via kernel mutexes, exposing runtime statistics through `/proc/lab2_info`, and managing attributes via `sysfs`.

---

## 2. Character Device Driver Implementation
The driver dynamically registers a major number (`240`), creates a device class (`lab2_class`), and instantiates a device node (`/dev/lab2`).

* **File Operations (`file_operations`):**
  * `lab2_open`: Tracks connection counts using thread-safe synchronization.
  * `lab2_read`: Safely copies data from kernel buffer to userspace using `copy_to_user`.
  * `lab2_write`: Receives data from userspace using `copy_from_user` with bounds checking.
  * `lab2_release`: Handles device closure cleanups.

---

## 3. Concurrency Control with Mutex
To prevent race conditions when multiple user threads access or modify the internal device buffer simultaneously, the driver utilizes a kernel mutex:
```c
static DEFINE_MUTEX(lab2_mutex);

// Inside write/open functions:
mutex_lock(&lab2_mutex);
// Critical section operations
mutex_unlock(&lab2_mutex);
