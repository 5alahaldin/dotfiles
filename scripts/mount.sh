#!/bin/bash

MOUNT_DIR="/mnt"
mountedParts=$(mount | awk '{print $1}')

drive=$(lsblk -o NAME,MODEL,TRAN | grep usb)
if [ -z "$drive" ]; then
    echo "No USB drives found" | dmenu -p "USB Drives: "
    exit 1
fi
drive=$(echo "$drive" | dmenu -p "USB Drives: " -l 10 | awk '{print $1}')
[ -z "$drive" ] && exit 1

part=$(lsblk -o NAME,LABEL,SIZE -n /dev/"$drive" | grep -E -v "^$drive" | sed 's|^ *||; s|^├─||; s|^└─||' | while read -r line; do
    pName=$(echo "$line" | awk '{print $1}')
    if echo "$mountedParts" | grep -q "/dev/$pName"; then
        printf "%-10s  %-20s  %-10s Mounted[*]\n" $line
    else
        printf "%-10s  %-20s  %-10s Mounted[-]\n" $line
    fi
done | dmenu -p "Select Part: " -l 10 | awk '{print $1}')
[ -z "$part" ] && exit 1

MOUNT_DIR+="/$part"

if echo "$mountedParts" | grep -q "/dev/$part"; then
    doas umount "/dev/$part" && notify-send "$part unmounted" && doas rmdir "$MOUNT_DIR" || notify-send "$part unmount failed"
else
    doas mkdir -p "$MOUNT_DIR" && doas mount "/dev/$part" "$MOUNT_DIR" && notify-send "$part mounted" || notify-send "$part mount failed"
fi
