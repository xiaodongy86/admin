The process to allow an account to login to a lab machine is like this:

* make backup copy of /etc/ssh/sshd_config
* add users account ID to the end of the line starting with AllowUsers
* ensure that you already have a logged-in terminal on the machine so in case of sshd failing to restart
* restart sshd with **service sshd status** and **service sshd restart**
* attempt login with recently added account, added to sshd_config AllowUsers, to confirm is works

```
ssh machine
cp /etc/ssh/sshd_config /etc/ssh/sshd_config_WORKS20210204
nano /etc/ssh/sshd_config
```
#add new users to existing line that says AllowUsers
```
AllowUsers xzp123 mmj343 las199
```
#make sure that you are logged into machine and do not log out until you see yourself able to login with new configuration 
```
service sshd status
service sshd restart
```
#Now confirm that login still works. 
#Now confirm that new user, recently allowed in can login because you have added their username to 
#AllowUsers line and because you restarted sshd so that the new configuration is alive
