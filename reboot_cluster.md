check before the reboot
```
ps -ef >> .ps_ef_052764_20210218.txt
dmesg >> .dmesg_052764_20210218.txt
dmesg -T |less
uptime >> .uptime_052764_20210218.txt
```
check the fstab file, make sure the /home line got commented out
```
less /etc/fstab
```

start the reboot
```
su - nimda
sudo reboot
```
after reboot, since the /home line in fstab file got commented out,
only nimda would be able to log in , we will login as nimda and put /home
line back, mount /home, then the other users can login. 
