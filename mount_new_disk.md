list all existing hard drive
```
sudo fdisk -l
```
add a new mounted hard drive
get the name form fdisk -l then run
```
sudo mount -t xfs /dev/mapper/vgthirtytb-lvthirtytb /data5
```
add this disk info into the fstab file so that we don't have mount it manully every time 
after the reboot
```
/dev/mapper/vgthirtytb-lvthirtytb /data5   xfs     defaults        0 0
```
check and save the disk usage by size
```
sudo du -a |sort -rn >> /var/tmp/du_a_sort_rn_052764_20210218_1512pm.txt
```
show the disk usage only on root system 
```
du -x |sort -rn >> /var/tmp/du_x_sort_rn_052764_20210218_1526pm.txt
```
