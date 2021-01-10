
#Into your home directory file named .bashrc, with a DOT in front of it, as in like /home/username/.bashrc
#you want to put a line like this:
export PATH="$PATH:/opt/anaconda3/bin"
# export PATH="$PATH:/opt/TheDirectory/YouWant"
#and then you will logout and login to see if it works. 
#After you login again you type:
echo $PATH
#should be able to see the updated PATH
