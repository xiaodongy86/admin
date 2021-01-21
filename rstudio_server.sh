```
ssh e1-052735.science.psu.edu
cd /var/tmp/wget https://download2.rstudio.org/server/centos7/x86_64/rstudio-server-rhel-1.4.1103-x86_64.rpm
sudo yum install rstudio-server-rhel-1.4.1103-x86_64.rpm
su - nimda
User Guide 
cd /usr/lib
mkdir rstudio-server
yum install   and   rpm -ivh   can both install RPMs
ps -ef |grep rstudio
df -ha 
cat /etc/passwd
/usr/bin/rstudio-server status
/usr/sbin/rstudio-server status
netstat -tan
netstat -tan|grep 8787
wget http://e1-052735.science.psu.edu:8787/
less index.html
cd /usr/lib
ls -la |grep rstud
sudo chgrp nimda ./rstudio-server
sudo chmod 775 ./rstudio-server
/sbin/iptables -L
/sbin/iptables -F
```
