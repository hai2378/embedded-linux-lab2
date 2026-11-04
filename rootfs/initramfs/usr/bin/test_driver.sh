#!/bin/sh
echo '=== LAB-02: Device Driver Test ==='
echo '[1] Loaded modules:'
lsmod | grep lab2
echo '[2] Checking device node...'
ls -la /dev/lab2
echo '[3] Writing test message...'
echo 'Hello from userspace, LAB-02!' > /dev/lab2
echo '[4] Reading back from device...'
DATA=$(cat /dev/lab2)
echo "Read back: [$DATA]"
echo '[5] Multiple write/read test...'
for i in 1 2 3; do
    echo "Message_$i" > /dev/lab2
    cat /dev/lab2
done
echo '[6] Kernel log (dmesg):'
dmesg | grep lab2 | tail -10
echo '=== Test script finished ==='
