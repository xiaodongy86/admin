
## rebooting titan64

### power outage 20190420 5am all machinery

On titan64, we did these two things to get machine working:
```
64 ~]$ vim /etc/fstab # to uncomment /home line
64 ~]$ mount /home
64 ~]$ mount -t xfs /dev/mapper/vgthirtytb-lvthirtytb /data5/
64 ~]$ vim /etc/fstab # to recomment /home line
```
This machine will not boot if /home line is uncommented in /etc/fstab and 
so we leave it comment-ed out generally for days like today when an 
unexpected reboot happens. 

Titan booted up automatically upon power restoration, all of the other machines did not. 

### titan /etc/fstab

This line always looks like this, **commented out**, on titan64:/etc/fstab
```
#ecos-nfs.science.psu.edu:/homedirs/       /home       nfs     defaults,tcp,hard,intr,rw   0 0
```
Normally, and on all other lab linux machines, this line is **not commented out**.  This line 
is commented-out on titan64 because, if uncommented, titan64 will hang after a reboot.  If 
/home cannot be mounted successfully, then the booting up process goes badly.  The problem might 
be that this filesystem is being mounted before the networking system is completed and therefore 
the mount of the NFS server at ecos-nfs.science.psu.edu fails and things go badly after that.  
The way to deal with this problem is by following these rules:

* This line in titan64:/etc/fstab is always commented-out so that the machine does not attempt to mount /home during bootup:
* ecos-nfs.science.psu.edu:/homedirs/       /home       nfs     defaults,tcp,hard,intr,rw   0 0
* After machine is booted up, there will not be the normal /home/ filesystem because it was not mounted. 
* Therefore, we can login as a local user admin or other local user and, afterwards perform these steps:
    * edit titan64:/etc/fstab and **uncomment** this line so it looks like this:
    * ecos-nfs.science.psu.edu:/homedirs/       /home       nfs     defaults,tcp,hard,intr,rw   0 0
    * run command **sudo mount /home**
    * edit titan64:/etc/fstab and again **comment** this line so it looks like this:
    * **#ecos-nfs.science.psu.edu:/homedirs/       /home       nfs     defaults,tcp,hard,intr,rw   0 0**
* The reason to always have that line commented-out is because the machine will hang if it reboots
