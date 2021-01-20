Topics today included:

we did things on cornerPC46 because:
its good to mess up another machine before working on titan64
cornerPC46 is very similar to titan software-wise and so what works at cornerPC46 can likely replay nicely on titan64
Using cornerPC46 allows for a nice admin pattern:
try to install/admin something on cornerPC46
create documentation somewhere about which steps worked, trouble encountered, useful URLs, etc.
use documentation to replay steps on titan64
keeping cornerPC46 similar to titan64 allows us to have a backup titan where we can do things when:
we lose titan64 YIKES!
titan64 is too busy to do anything else, per htop
we have user that should be working on cornerPC46 and not on titan64
minimap2 installation
trackclust installation
pip and pip3 installs
python virtual env creation and use
conda installation
With these commands we learn:

where anaconda is located: /opt/anaconda3/
where it programs are: /opt/anaconda3/bin
we see our PATH echo $PATH
we find which bowtie2 executable is first on our PATH with which
we use locate and grep to find files with bowtie2 and bin in their full path
we find one other version and compare the versions of both bowtie2 executables
```
  886  ls /opt/anaconda3
  887  which conda
  888  ls /opt/anaconda3/bin/
  889  ls /opt/anaconda3/bin/|grep pomo
  890  ls -latF /opt/anaconda3/bin/|less
  891  which bowtie2
  892  echo $PATH
  893  bowtie2 --version
  894  locate bowtie2 |wc
  895  locate bowtie2 |grep bin|wc
  896  locate bowtie2 |grep bin|less
  897  locate bowtie2 |grep bin|grep -v anaconda|wc
  898  locate bowtie2 |grep bin|grep -v anaconda
  899  which bowtie2
  900  bowtie2 --version
  901  /usr/local/bin051569/bowtie2 --version
```
Next up we:

try to use conda to install pomoxis
add the biocond channel to our installation of anaconda
notice that conda guppy is not the software we wanted
use pip to install guppy, but:
we learn that guppy needs python2 and our first-on-path python version is python3
we learn that we do have python2
we learn that we do not have a pip for python2 and our only pip is for python3
we adjust our PATH so that anaconda3 software comes last (so that we can instead have python2 come first)
we use yum install to install python2-pip
we try, without sudo, to pip install guppy but learn that we do not have permission
we try, with sudo, to pip install guppy but learn that root PATH sees pip3/python3 first and guppy needs python2/pip2
we try again with sudo, but this time force root to use /bin/pip which we know is pip2, and yay installation works
  
  ```
  902  conda install pomoxis
  903  conda config --add channels bioconda
  904  conda install pomoxis
  905  conda install guppy
  906  which pip
  907  pip install guppy
  908  which python
  909  python2
  910  echo $PATH
  911  export PATH=/usr/local/bin:/bin:/usr/bin:/usr/local/sbin:/usr/sbin:/opt/anaconda3/bin
  912  echo $PATH
  913  which python
  914  python --version
  915  which pip
  916  yum list |grep pip
  928  sudo yum install python2-pip.noarch
  929  which pip
  930  pip install guppy
  931  sudo pip install guppy
  932  which pip
  933  sudo /bin/pip install guppy
  939  /opt/anaconda3/bin/pip --version
  940  /bin/pip --version
```
Next, we:

find out guppy that we installed was the wrong software, not the basecaller we were hoping for
we try pip install Guppy but its not there, nor is it already in python
we see that yum list shows no basecaller software
we get the real basecaller software we want with git clone
we put our PATH back to what it was so that we have anaconda3 python because guppy is python3 software
we follow the website instructions to install guppy
we create a python virtual environment nameed venv3
we activate the venv
we install all of the python modules with pip install
we run make test and see good things
we run deactive to exit our virtual environment

```
941  pip install Guppy
  942  which Guppy
  943  python
  944  ls /usr/lib/python2.7/site-packages/|grep uppy
  945  ls /usr/lib/python2.7/site-packages/
  946  yum list|grep basecaller
  947  git clone https://github.com/nanoporetech/pyguppyclient.git
  950  cd pyguppyclient/
  952  echo $PATH
  953  export PATH=/opt/anaconda3/bin:/usr/local/bin:/bin:/usr/bin
  954  echo $PATH
  955  python --version
  956  python -m venv venv3
  957  source ./venv3/bin/activate
  958  which pip
  959  pip install -r requirements -r development.txt
  960  pip install -r requirements.txt -r development.txt
  961  ls
  962  which pip
  963  which python
  968  ls venv3/bin/
  969  ls pyguppyclient/
  970  python setup.py develop
  971  make test
  972  which make
  973  make test
  974  which make
  975  ls
  976  ls tools/
  977  ls venv3/bin/
  978  deactivate 
  ```
Next we install and test minimap2, to do so we:

clone githup repo for minimap2
check the Makefile that will instruct make
run make
see that minimap2 is a binary executable in the current directory
test it with some of the instructions on the website
we see that we are able to make a nice looking .sam file

```
  979  pwd
  980  cd ..
  981  git clone https://github.com/lh3/minimap2
  982  cd minimap2/
  983  ls
  984  less Makefile
  985  make
  989  ls -al minimap2
  990  file minimap2
  991  ls
  992  less ksw2_exts2_sse.c
  993  locate *.so|less
  994  ./minimap2 -a test/MT-human.fa test/MT-orang.fa > test.sam
  995  file test.sam
  996  less test.sam
```  
  
Afterwards, I tried to update anaconda3 and it worked:

tried to read conda man page, but there is not one
tried to get help with conda --help and see it, but it was kind of bare
tried to get help with conda update --help and see it, and this is better because I see the help for specifically conda update
updated conda, tons of things, luckily it was successful
updated bioconda channel

```
 1007  man conda
 1008  conda --help|less
 1009  conda update --help|less
 1010  sudo conda update --all
 1014  sudo conda -c bioconda update --all
 1015  sudo conda update --all -c bioconda
```
