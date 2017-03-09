# Check mount

Checking mount status NTFS partitions
If not mounted, use ntfsfix for fix ntfs mount errors and automount from fstab

You can use this script in crontab autostart shedule:
```
  @reboot sleep 20 && /path/to/script/check-mount.sh >/dev/null 2>&1
```
