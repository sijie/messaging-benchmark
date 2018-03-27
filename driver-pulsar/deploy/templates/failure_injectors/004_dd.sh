#!/bin/bash

for i in {1..25}; do
    echo "Create testfile $i to trash page cache on journal device";
    dd if=/dev/zero of=/mnt/journal/testfile-$i bs=10G count=1 oflag=direct
done
rm -rf /mnt/journal/testfile-*
