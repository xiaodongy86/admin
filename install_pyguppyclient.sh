# install pyguppyclient
# swtich user to nimda
su -u nimda
sudo pip install pyguppyclient
### sudo the pip with the full path
sudo /opt/anaconda3/bin/pip install pyguppyclient

# Guppy 4.4 or later is required and the guppy_basecall_server must already be running.

guppy_basecall_server --config dna_r9.4.1_450bps_fast.cfg -p 5555 -l /tmp/guppy -x 'cuda:0'

cd /usr/local/
sudo git clone https://github.com/nanoporetech/pyguppyclient.git

sudo chown -R nimda.nimda ./pyguppyclient/

## creat a vitul enviroment by using module venv
python3 -m venv venv3

### to open the vitul enviroment venv3 
source ./venv3/bin/activate
sudo /opt/anaconda3/bin/pip install -r requirements.txt -r development.txt
python setup.py develop
make test

### deactivate the vitual enviroment
deactivate
