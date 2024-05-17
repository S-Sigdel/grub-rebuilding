#!/bin/bash
echo  "if this script shows error, then make sure that you change your user to the substitue user using the command 'sudo su'"
echo "update-script running"
mount /dev/sdaY /mnt  #update the /dev/sdaY or /dev/nvmeY where Y refers to the partition where the operating system is installed.
mount --bind /dev /mnt/dev
mount --bind /dev/pts /mnt/dev/pts
mount --bind /proc /mnt/proc
mount --bind /sys /mnt/sys
chroot /mnt
grub-install /dev/sdX # update the /dev/sdX or /dev/nvmeX where X refers to the entire drive number where both the operating systems are installed.
update-grub
exit
umount /mnt/dev/pts
umount /mnt/dev
umount /mnt/proc
umount /mnt/sys
umount /mnt
