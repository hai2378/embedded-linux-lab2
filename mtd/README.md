# MTD / JFFS2 experimental workflow

The chat describes a lab using Linux `nandsim`, MTD utilities and the JFFS2 filesystem to create, erase, write, mount, unmount and remount a simulated NAND Flash partition. The reported goal was to demonstrate persisted content across an unmount/remount cycle.

Typical tools documented: `modprobe nandsim`, `mtdinfo`, `flash_erase`, `mkfs.jffs2`, `nandwrite`, `mount -t jffs2`, `umount` and `nanddump`.

**Safety:** Do not execute flash erase or NAND write commands on an unverified `/dev/mtd*` device. First verify you are operating on the expected RAM-backed simulation, not a physical flash partition. The raw image and dump are not included in the PDF export.
