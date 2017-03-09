#!/bin/bash
# Checking mount status NTFS partitions
# If not mounted, use ntfsfix for fix ntfs mount errors and automount from fstab
# Created by Yevgeniy Goncharov / https://sys-adm.in

# ---------------------------------------------------------- VARIABLES #
PATH=$PATH:/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin
SCRIPTPATH=$(cd `dirname "${BASH_SOURCE[0]}"` && pwd)

# Disk list
DISKS="/dev/sdb1 /dev/sdc1 /dev/sda4"
MOUNTED=false

# Loop and checking disk status
for disk in $DISKS; do
  echo $disk

  if mount | grep $disk > /dev/null; then
    echo "mounted"
  else
      echo "none"
      MOUNTED=true
      ntfsfix $disk
  fi

done

# If MOUNTED true, run automount
if $MOUNTED; then
  mount -a
fi