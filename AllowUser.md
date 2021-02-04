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
