```
nimda@E1-051569:~$ sshfs -o allow_other,default_permissions nimda@146.186.85.177:/data /mnt/drople
```
#..that is as nimda and the /mnt/droplet1 has to be already there, so earlier, long time ago, I did this: 
```
sudo mkdir /mnt/droplet1; sudo chown nimda.nimda /mnt/droplet1;
```
#Later on, when you are done using it, you will unmount it like this:
```
sudo umount /mnt/droplet1
```
#notice that 'umount' is a misspelling of unmount, there is no such command as 'unmount', only 'umount'

#When /mnt/droplet1 is mounted, you can type this command which brings up a window where you can drag folders onto the google-chrome web browser logged-in to PSU and at drive.google.com.  This xdg-open is the file-viewer program:
```
nimda@E1-051569:~$ sudo xdg-open /mnt/droplet1
```
Remember that sshfs mounted /data on titan.  You will need another, different command to mount different filesystems, 
so you would do the same thing for /data5.  You might help yourself by making a mount point that you will remember is /data5, maybe something like this:
```
sudo mkdir /mnt/droplet5
sshfs -o allow_other,default_permissions nimda@146.186.85.177:/data5 /mnt/droplet5
sudo xdg-open /mnt/droplet5
sudo chown nimda.nimda /mnt/droplet5
sudo xdg-open /mnt/droplet5
nimda@E1-051569:~$ which google-chrome
/bin/google-chrome
google-chrome
```
#then login to your psu account and go to drive.google.com
#then click "New" or try to drag-and-drop from your xdg-open window onto drive.google.com
#if its a big file/folder, then lock the screen and go home.  The next day, be sure to look at the drive.google.com popup to verify that it is a green checkmark and says that the file upload was successful.  
And remember to use "mount" to see what is mounted and use "umount" to unmount the sshfs things you have, like this for a mount at /mnt/droplet5
sudo umount /mnt/droplet5



