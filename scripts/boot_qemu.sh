#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
LAB1="${LAB1_DIR:-$HOME/embedded_lab1/output}"
for f in "$LAB1/zImage" "$LAB1/vexpress-v2p-ca9.dtb" "$ROOT/output/initramfs_lab2.cpio.gz"; do
  if [ ! -f "$f" ]; then echo "Missing original artefact: $f" >&2; exit 1; fi
done
exec qemu-system-arm -M vexpress-a9 -cpu cortex-a9 -m 512M -smp 2 -nographic \
 -kernel "$LAB1/zImage" -dtb "$LAB1/vexpress-v2p-ca9.dtb" \
 -initrd "$ROOT/output/initramfs_lab2.cpio.gz" \
 -append 'console=ttyAMA0,115200 rdinit=/sbin/init mem=512M'
