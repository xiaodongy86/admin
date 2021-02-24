


### Galaxy MethylIT summary

Greg has been leading effort to get MethylIT onto Galaxy platform since Summer

These are the machines where galaxy-methylit is running:

* e1-051569 (raulPC)
* e1-052734 (PC nearest to office window)

This is how to restart galaxy, user password are both **galaxy**:

```
su - galaxy
cd galaxy
. .venv/bin/activate
stopgalaxy
startgalaxy
```

Or, after a reboot, take note of the slight difference, where we must start supervisord:

* These steps did not get it running:
    * su - galaxy
    * cd galaxy
    * . .venv/bin/activate
    * startgalaxy
    * ERROR: unix:///opt/galaxy/supervisor_tmp/supervisor.sock refused connection

After reboot, we need to call, as normal galaxy user, **supervisord**, like this:
```
(.venv) -bash-4.2$ supervisord
Unlinking stale socket /opt/galaxy/supervisor_tmp/supervisor.sock
```
..and then the normal startup works:

* cd galaxy
* . .venv/bin/activate
* startgalaxy


### Galaxy resources

* https://galaxyproject.org/learn/
* https://sites.google.com/site/princetonhtseq/tutorials/rna-seq
* http://bioinformatics.ucdavis.edu/training/


### R on galaxy with R package

http://www.bioconductor.org/packages/release/bioc/html/RGalaxy.html


### R on galaxy with toolshed

This page makes running R on galaxy look tricky:

https://galaxyproject.org/toolshed/set-up-r-environment/


### python notebook to extract dependencies and installation order of an R package

Pretty incredible:

https://nbviewer.jupyter.org/github/bgruening/notebooks/blob/master/R/extract_all_dependencies_from_an_r_package.ipynb

### Galaxy first job run

**UPDATE 20200531** usegalaxy.org bhfb

We make more files to **Get Data** at usegalaxy.org, as we did before.
```
64 protoplast_TDNAA]$ cd /data5/F19FTSUSAT1586/cdts-hk.genomics.cn/F19FTSUSAT1586_ARAbeeR/Reads/Clean/protoplast_TDNAA/

64 protoplast_TDNAA]$ ls
protoplast_TDNAA_1.fq.gz  protoplast_TDNAA_2.fq.gz

64 protoplast_TDNAA]$ date; gunzip protoplast_TDNAA_1.fq.gz ; gunzip protoplast_TDNAA_2.fq.gz ;date
Sun May 31 15:26:20 EDT 2020
Sun May 31 15:28:36 EDT 2020

64 protoplast_WTA]$ date; gunzip protoplast_WTA_1.fq.gz ; gunzip protoplast_WTA_2.fq.gz ;date
Sun May 31 15:39:35 EDT 2020
Sun May 31 15:40:15 EDT 2020
```
..recall that gzip files work but the did not work for us and so we gunzip them first.
..and we copy them to locally where my web browser is running:
```
scp e1-052764:/data5/F19FTSUSAT1586/cdts-hk.genomics.cn/F19FTSUSAT1586_ARAbeeR/Reads/Clean/protoplast_TDNAA/*.fq ./
protoplast_TDNAA_1.fq  100% 4559MB 101.4MB/s   00:44
protoplast_TDNAA_2.fq  100% 4559MB  89.5MB/s   00:50

scp e1-052764:/data5/F19FTSUSAT1586/cdts-hk.genomics.cn/F19FTSUSAT1586_ARAbeeR/Reads/Clean/protoplast_WTA/protoplast_WTA* ./
protoplast_WTA_1.fq   100% 1555MB  93.0MB/s   00:16
protoplast_WTA_2.fq   100% 1555MB 100.8MB/s   00:15
```
Next, after logging in bhfb at usegalaxy.org, we click on these things in the left hand column of the web page:

* **Get Data**
* **Upload file from your computer**






We have uploaded 4 uncompressed files to galaxy:

```
64 SRX016110]$ pwd
/data5/SRX016110

64 SRX016110]$ ls
Oryza_indica.ASM465v1.cdna.all.fa  README  SRR034580.fastq  SRR034581.fastq  SRR034582.fastq  SRR034583.fastq
```

On the left side of the galaxy page we see **Get Data** and underneath of
that we see **Upload file from your computer**.  Because NIH forces us
to use the SRA toolkit and **fastq-dump** to download files, I do not
know of any URL that points to those 4 fastq files.  There is an option
called **NCBI Accession Download** that might have let me enter numbers
like **SRR034580** to ask galaxy to download from NIH for me but I did
not try it.  I downloaded those four files myself and uploaded them to
galaxy using the **Get Data** - **Upload file from your computer** option
on the galaxy page.
I do have a URL to the cDNA fasta file, shown below.  But I did not see
a place to drop in a URL at galaxy under the **Get Data** item.  Therefore
I again downloaded it from ftp.ensemblgenomes.org to my machine and then
uploaded it to galaxy with **Get Data** - **Upload file from your computer**.
Eventually I deleted that fa.gz file from galaxy and uploaded it again
after first **gunzip**ping/uncompressing it and then uploading the uncompressed
.fa file.

Therefore in my **galaxy history** I see 4 .fastq files and 1 .fa file.

I happen to know some things:

* those fastq are single end RNAseq from here:
* https://www.ncbi.nlm.nih.gov//bioproject/122435
* https://www.ncbi.nlm.nih.gov/bioproject/PRJNA122435
* that fasta file is from here:
* ftp://ftp.ensemblgenomes.org/pub/release-46/plants/fasta/oryza_indica/cdna/Oryza_indica.ASM465v1.cdna.all.fa.gz

After uploading the fa.gz file galaxy seemed not to realize what it
was in the history and so I deleted it an reuploaded the uncompressed .fa
file and that worked better because it got recognized.

I was confused because next to the .fa file in the history it said
that **This job is waiting to run** but I had not yet asked for a job
to run.  Perhaps all fasta files need to be pre-processed or something
because eventually it said that it was running, things turned green and
looked good.

At this point things were good and I went to try to align it with BWA on galaxy.


Again in the left bar of galaxy, we see a section **GENOMICS ANALYSIS** and
under that we see **Map with BWA - map short reads (<100bp) against reference genome**
and I clicked on that.

There were a few things to choose but mostly I just told it to use:

* the four fastq files in my history that I uploaded earlier
* align it to the fasta file I uploaded Oryza_indica.ASM465v1.cdna.all.fa
* single end
* default everything else

Then I clicked a **Start** or **Queue** button? and it was good and green and said:

```
Executed Map with BWA and successfully added 1 job to the queue.

The tool uses 2 inputs:

6: Oryza_indica.ASM465v1.cdna.all.fa
1: SRR034582.fastq
It produces this output:

7: Map with BWA on data 1 and data 6 (mapped reads in BAM format)
You can check the status of queued jobs and view the resulting data by refreshing the History panel. When the job has been run the status will change from 'running' to 'finished' if completed successfully or 'error' if problems were encountered.
```

Over the next hour I looked at my **history** in the right bar of the galaxy page
and it has a **refresh history** icon that I have been clicking.  It always
says that **This job is waiting to run** so I expect it will run someday.

I also see these three options that I have not clicked on:

* display with IGV local
* display in IGB View
* display at bam.iobio bam.iobio.io

**UPDATE: success**:

A few hours later my first galaxy job was finished and I see this in green in my history
on the right hand side of galaxy page:
```
153.0 MB
formatbamdatabase?
[bwa_index] Pack FASTA... 0.78 sec
[bwa_index] Construct BWT for the packed sequence...
[BWTIncCreate] textLength=91041372, availableWord=18405968
[BWTIncConstructFromPacked] 10 iterations done. 30360876 characters processed.
[BWTIncConstructFromPacked]
```
..and I clicked the **Download data** icon underneath of that and downloaded
a 153MB bam file that BWA made for me.  Yay!

### docker pull gruening/galaxy-stable

We are still green with docker.  Some of these things worked:

```
docker-machine create default)
eval $(docker-machine env default)
docker pull gruening/galaxy-stable
```

..and we got a 4GB galaxy out of it.

### galaxy docker and Enable Galaxy to use BioContainers

Our recent documentation in **docker-galaxy-README.odt** file
discussed below is an extremely powerful way to run galaxy locally
and this document shows the way.  There are some problems:

* must be good with docker
* must be good with galaxy admin

We might need more of the galaxy admin experience.

### bismarkPipeline.txt as galaxy bismark example

This report was shared today with Galaxy helpers:

```
Attached and pasted below are typical steps we run before we get to MethylIT.

I believe that these exact commands will run nicely on e1-053734 except that there is not yet the software required (bismark, etc).  Please let me know if you want me to install a bunch of things.  See the note about java and fastqc which is nice to have but not needed.

There is a roomy place at e1-053734:/data/ that will good for doing bismark activity.

These steps require bismark verision v0.19.0 but I think anaconda3 gets you v0.22.3 right now.  Older bismarks can work but there would be a few more and different commands.

Another modification to consider is to NOT use "mkdir" and "cd" and instead run everything right there in one directory.  Bismark generally has a default of using/assuming the current directory and so you might consider having an extremely crowded directory and running everything in one place.  If you remove the "mkdir" and "cd" lines then you would also have to change, in two places, FROM this:
--genome_folder ../
..TO this:
--genome_folder ./
..and then I think it would still work.  I have generally split all of the output into different directories, one for each sample, and so we have per-sample folders like "deduplicate", "trim_galore", "fastq", "methyl", "bismark-bt2", "fastqc".  Bismark commands generally have a "-o" option to tell it where to put the output (otherwise, the current directory).  The "-o" is especially useful if you want to use different disks (because you have more space available or you want it to run faster/finish sooner).  The fastq file in the example below is 5.2GB and when finished there will be 24GB in use.  Bismark may have used much more space than that before cleaning up.  When complete, these files will exist:

CHG_OB_SRR1333843_trimmed_bismark_bt2.deduplicated.txt  SRR1333843_trimmed_bismark_bt2.deduplicated.bedGraph.gz

CHG_OT_SRR1333843_trimmed_bismark_bt2.deduplicated.txt  SRR1333843_trimmed_bismark_bt2.deduplicated.bismark.cov.gz

CHH_OB_SRR1333843_trimmed_bismark_bt2.deduplicated.txt  SRR1333843_trimmed_bismark_bt2.deduplicated.CX_report.txt

CHH_OT_SRR1333843_trimmed_bismark_bt2.deduplicated.txt  SRR1333843_trimmed_bismark_bt2.deduplicated.M-bias.txt

CpG_OB_SRR1333843_trimmed_bismark_bt2.deduplicated.txt  SRR1333843_trimmed_bismark_bt2.deduplicated_splitting_report.txt

CpG_OT_SRR1333843_trimmed_bismark_bt2.deduplicated.txt  SRR1333843_trimmed_bismark_bt2.deduplication_report.txt

SRR1333843.fastq                                        SRR1333843_trimmed_bismark_bt2_SE_report.txt

SRR1333843.fastq_trimming_report.txt                    SRR1333843_trimmed_fastqc.html

SRR1333843_trimmed_bismark_bt2.bam                      SRR1333843_trimmed_fastqc.zip

SRR1333843_trimmed_bismark_bt2.deduplicated.bam         SRR1333843_trimmed.fq.gz


..and the one we use with MethylIT is this one:

SRR1333843_trimmed_bismark_bt2.deduplicated.CX_report.txt


..and that file is what we call the "counts" file, and has lines like these:

4 18582537 + 0 0 CHG CAG

4 18582539 - 0 0 CHG CTG

4 18582543 - 0 3 CHH CAA

4 18582544 + 0 0 CHH CAT

4 18582552 - 0 3 CHH CAA

4 18582556 + 0 0 CG CGT


..with 7 columns: chromosome, base position, strand, methylated counts, unmethylated counts, context, trinucleotide sequence.

Oftentimes we chop those files up into 3 different files, one for each value of the "context" column: CG, CHG, CHH.  MethylIT is also able to chop them up programmatically.  Oftentimes we want to look at each context separately, or sometimes people only want to know about CG context. More practically, the memory/CPU requirements are lesser and things run faster with less data.  For big counts files, big genomes and/or many samples, there might be a situation where we would chop the file up (manually or with MethylIT) by chromosome, and process one chromosome at a time.

The counts files used in memoryLine_100k.R were "chopped up" in two ways--two operations were run on the raw output from bismark (the "counts", .CX_report.txt file):
only CG context
only first 100,000 base positions
This is unusual but allows for quick testing of MethylIT on small machines.

There is lots more to say about the difficulties of bismark.

Thanks,
Tom
```

### galaxy work moved to pc34

This message went out today:

```
Dear Greg and other Galaxeers,

I share below too many details on how you and Dave can login and how far I got with Galaxy installation.
Please respond if you encounter any trouble and let us keep you moving.

Thanks,
Tom

Robersy suggested yesterday that I hurry up and get out of your way.  I agree!
He suggests that we keep Tom Galaxy out of the way of Greg Galaxy.  I agree!
You and Dave should now be (almost) able to login to e1-052734.science.psu.edu and have sudo access.
All of our machinery is ECOS installed and ECOS has our home directories on an NFS server at ecos-nfs.science.psu.edu.
We can see all of the users when we say "ls /home/" but I do not see your or Dave in there.
It will be smoother and might be required for you to have a home directory at ECOS in order to login to these machines.
We have our new users send email to helpdesk@science.psu.edu requesting a home directory.
Our accounts are not in /etc/passwd and so I don't think we can change anyone's home directory location.
You might be able to login without a home directory and things will be like they are without a home directory, maybe not a problem.
Otherwise you might email the ECOS helpdesk for a home directory.
You probably already know about this if you have worked on an ECOS machine.
I said "almost" because it looks like you guys lack a home directory on the ECOS NFS server.

Another thing is the firewall.  You will probably need to be on the PSU network or even the ECOS network or else use the PSU VPN.

Our e1-052734.science.psu.edu  is a great machine.  It was updated this morning by me and rebooted because the kernel advanced.
The machine I have been installing Galaxy on is going too slowly and is less good for Galaxy for several reasons.
I started at e1-052734.science.psu.edu this morning.  The only thing besides 'yum update' is anaconda3.
I ran "bash /var/tmp/Anaconda3-2020.02-Linux-x86_64.sh" and accepted all defaults except I chose to put it into /opt/anaconda3/
Any user can use that anaconda with these two commands:

source /opt/anaconda3/bin/activate
conda init

It appears that users will need to modify .bashrc to make that stick to their PATH.
Other than that its a mostly bare machine.
You can ignore or remove anaconda3 and install Galaxy however you want.
Do not worry about this machine or any of its data, you are free to install Galaxy and mess up the machine in any way.
Another good thing about this machine is that it can be rebooted and it still comes back up on the network with sshd--you are free to reboot it.
Good luck.

I show below the commands that I used to get as far as I did following the instructions you kindly shared.
None of these were run on e1-052734.
In particular, from your instructions, I did not address these items:

Install Python 3 - latest version
Install setuptools from source
..and I have not yet done anything with Galaxy, postgres...nothing from "Download slurm-drmaa-1.0.7.tar.gz (or latest)" onward.

I notice that you mentioned python3.8.  The latest python from Anaconda is 3.7.6.  Therefore, if you really need 3.8 then this will need attention.
I will keep trying to get my Galaxy going but I have other priorities I should focus on.  I will keep you updated.

I show below exact commands that I ran to get as far as slurm working.
Lots of these need sudo and I trimmed from this lots of starts and stops where I had trouble.
As you can see, these are very close to the commands you shared.

conda list anaconda$
conda update conda
yum install sqlite-devel.x86_64
pip install virtualenv
yum install munge.x86_64
export MUNGEUSER=982
yum install munge munge-libs munge-devel
groupadd -f -g $MUNGEUSER munge
rngd -r /dev/urandom
/usr/sbin/create-munge-key -r
dd if=/dev/urandom bs=1 count=1024 > /etc/munge/munge.key
munge -n
yum install openssl openssl-devel pam-devel numactl numactl-devel hwloc hwloc-devel lua lua-devel readline-devel rrdtool-devel ncurses-devel man2html libibmad libibumad -y

cd /usr/local/
mkdir slurm
cd slurm
mkdir //usr/local/slurm/slurm-rpms
wget https://download.schedmd.com/slurm/slurm-19.05.7.tar.bz2
yum install rpm-build
rpmbuild -ta slurm-19.05.7.tar.bz2
cp -a /root/rpmbuild/RPMS/x86_64/ /usr/local/slurm/slurm-rpms
cd slurm-rpms/x86_64/
yum --nogpgcheck localinstall slurm-19.05.7-1.el7.x86_64.rpm slurm-contribs-19.05.7-1.el7.x86_64.rpm slurm-devel-19.05.7-1.el7.x86_64.rpm slurm-example-configs-19.05.7-1.el7.x86_64.rpm slurm-libpmi-19.05.7-1.el7.x86_64.rpm slurm-openlava-19.05.7-1.el7.x86_64.rpm slurm-pam_slurm-19.05.7-1.el7.x86_64.rpm slurm-perlapi-19.05.7-1.el7.x86_64.rpm slurm-slurmctld-19.05.7-1.el7.x86_64.rpm slurm-slurmd-19.05.7-1.el7.x86_64.rpm slurm-slurmdbd-19.05.7-1.el7.x86_64.rpm slurm-torque-19.05.7-1.el7.x86_64.rpm
vim /etc/slurm/slurm.conf
touch /var/log/slurmctld.log
touch /var/log/slurmd.log
chown slurm /var/log/slurmctld.log
chown slurm /var/log/slurmd.log
export SLURMUSER=1095
groupadd -f -g $SLURMUSER slurm
useradd  -m -c "SLURM workload manager" -d /var/lib/slurm -u 1095 -g slurm  -s /bin/bash slurm
slurmd -C
scontrol show nodes
mkdir /var/spool/slurmd
chown slurm /var/spool/slurmd/
chown slurm /var/spool/slurmctld/
less /var/log/slurmd.log
mkdir /var/spool/slurm/
chown slurm /var/spool/slurm/  ##because slurm.conf has: StateSaveLocation=/var/spool/slurm
systemctl enable slurmd.service
systemctl start slurmd.service
systemctl status slurmd.service
sbatch -N1 /var/tmp/slurmRunner.sh
srun -N1 /bin/hostname
scontrol show jobs
```

### Notes for galaxy installation

We are working on these right now:

```
 c. A Mackenzie Lab sys admin with root access will have to install and configure some packages that Galaxy will use.  Here are some notes I’ve kept for configuring centos7 systems.  I can work directly with the sys admin on this if needed.

# Install development tools
yum groupinstall -y development

# Install additional handy development tools
yum install -y zlib-devel openssl-devel sqlite-devel bzip2-devel

Install Python 3 - latest version

Install setuptools from source

Install pip

Install virtualenv via pip - $/usr/local/bin/pip install virtualenv

Install git

Install munge

# Create the global users
# Slurm and Munge require consistent UID and GID across every
# node in the cluster.  For all the nodes, before you install
# Slurm or Munge:

export MUNGEUSER=991
groupadd -f -g $MUNGEUSER munge
useradd  -m -c "MUNGE Uid 'N' Gid Emporium" -d /var/lib/munge -u $MUNGEUSER -g munge  -s /sbin/nologin munge
export SLURMUSER=992
groupadd -f -g $SLURMUSER slurm
useradd  -m -c "SLURM workload manager" -d /var/lib/slurm -u $SLURMUSER -g slurm  -s /bin/bash slurm
yum install munge munge-libs munge-devel
rngd -r /dev/urandom
/usr/sbin/create-munge-key -r
dd if=/dev/urandom bs=1 count=1024 > /etc/munge/munge.key
chown munge: /etc/munge/munge.key
chmod 400 /etc/munge/munge.key
systemctl enable munge
systemctl start munge

# Test munge
munge -n

# Install slurm
# see https://slurm.schedmd.com/quickstart_admin.html

# Download slurm workflow manager from https://www.schedmd.com/downloads.php into the home directory for root and install it

# ===============================================================
# Create the slurm config file by visiting
# http://slurm.schedmd.com/configurator.easy.html
# Put this file on all nodes of your cluster.
# See the slurm.conf man page for more information.
# Note that machine name is case sensitive!!
# ===============================================================

# Copy the file from the form and place it in /usr/local/etc/slurm.conf

# ===============================================================
# Make sure directories are writable by the slurm user for all process id files, log files, etc
# ===============================================================
mkdir /var/spool/slurmctld
chown slurm /var/spool/slurmctld
chmod 755 /var/spool/slurmctld
touch /var/log/slurmctld.log
chown slurm /var/log/slurmctld.log
touch /var/spool/slurmctld/job_state
chown slurm /var/spool/slurmctld/job_state
touch /var/log/slurm_jobacct.log /var/log/slurm_jobcomp.log
chown slurm /var/log/slurm_jobacct.log /var/log/slurm_jobcomp.log

# Make sure /usr/local/etc/cgroup.conf exists

# ===============================================================
# Make sure slurm is configured properly
# ===============================================================
cp ~/slurm-17.11.7/etc/*.service /usr/lib/systemd/system/
systemctl enable slurmd.service && systemctl enable slurmctld.service
systemctl start slurmd.service && systemctl start slurmctld.service
slurmd -c

# Open ports in the firewall (if necessary) for Galaxy and Galaxy reports

# Open ports in the firewall (if necessary) for slurm

# Download slurm-drmaa-1.0.7.tar.gz (or latest) from
# http://apps.man.poznan.pl/trac/slurm-drmaa/downloads
# into the home directory for root

# Install Postgres

# Create the “galaxy” account

# ===============================================================
# Perform all of the following as the “postgres” user (sudo -iu postgres)
# ===============================================================
# Add the “galaxy” user, allowing it to create / drop databases
sudo -iu postgres
createuser --interactive
Enter name of role to add: galaxy

Shall the new role be a superuser? (y/n) n
Shall the new role be allowed to create databases? (y/n) y
Shall the new role be allowed to create more new roles? (y/n) n
# Make the password for the postgres user to be "postgres"
psql
alter user postgres password postgres
# Make the password for the galaxy user to be "galaxy"
alter user galaxy password galaxy

```

#### Notes about our raulPC69 galaxy install:

```
69:~$ sudo /usr/sbin/create-munge-key -r
Please type on the keyboard, echo move your mouse,
utilize the disks. This gives the random number generator
a better chance to gain enough entropy.
Generating a pseudo-random key using /dev/random completed.

69:~$ sudo dd if=/dev/urandom bs=1 count=1024 > /var/tmp/munge.key
1024+0 records in
1024+0 records out
1024 bytes (1.0 kB) copied, 0.00669765 s, 153 kB/s

69:~$ sudo cp !$ /etc/munge/munge.key
sudo cp /var/tmp/munge.key /etc/munge/munge.key
```

```
9:~$ sudo ls /etc/munge/
munge.key

69:~$ sudo ls -la /etc/munge/
total 20
drwx------    2 munge munge  4096 Jun 14 06:42 .
drwxr-xr-x. 163 root  root  12288 Jun 14 06:25 ..
-r--------    1 munge munge  1024 Jun 14 06:43 munge.key

69:~$ sudo systemctl enable munge
Created symlink from /etc/systemd/system/multi-user.target.wants/munge.service to /usr/lib/systemd/system/munge.service.

69:~$ sudo systemctl start munge

69:~$ munge -n
MUNGE:AwQDAACT3I8jSItS4NyOlzLlMlXRSGf8h9jn5jeaTHkw5+1BlqC+x462Mb/1QC6J9AtHu07Zh2gr0bJD1On5fhSsxFzkUq26WaJQABCmBoYxN+HLysVN6TA=:

69:~$ ps -ef|grep munge
munge     3148     1  0 06:46 ?        00:00:00 /usr/sbin/munged
```



### installed munge munge-libs munge-devel for galaxy

* **yum install munge.x86_64**
* **yum install munge munge-libs munge-devel**

```
69:~$ yum install munge.x86_64
Loaded plugins: fastestmirror, langpacks
Loading mirror speeds from cached hostfile
 * base: linux.cc.lehigh.edu
 * epel: mirror.csis.ysu.edu
 * epel-debuginfo: d2lzkl7pfhq30w.cloudfront.net
 * epel-source: d2lzkl7pfhq30w.cloudfront.net
 * extras: mirror.facebook.net
 * updates: mirror.umd.edu
runner_gitlab-runner/x86_64/signature                                        |  862 B  00:00:00
runner_gitlab-runner/x86_64/signature                                        | 1.0 kB  00:00:00 !!!
runner_gitlab-runner-source/signature                                        |  862 B  00:00:00
runner_gitlab-runner-source/signature                                        |  951 B  00:00:00 !!!
Resolving Dependencies
--> Running transaction check
---> Package munge.x86_64 0:0.5.11-3.el7 will be installed
--> Processing Dependency: munge-libs = 0.5.11-3.el7 for package: munge-0.5.11-3.el7.x86_64
--> Processing Dependency: libmunge.so.2()(64bit) for package: munge-0.5.11-3.el7.x86_64
--> Running transaction check
---> Package munge-libs.x86_64 0:0.5.11-3.el7 will be installed
--> Finished Dependency Resolution

Dependencies Resolved

====================================================================================================
 Package                  Arch                 Version                     Repository          Size
====================================================================================================
Installing:
 munge                    x86_64               0.5.11-3.el7                epel                95 k
Installing for dependencies:
 munge-libs               x86_64               0.5.11-3.el7                epel                37 k

Transaction Summary
====================================================================================================
Install  1 Package (+1 Dependent package)

Total download size: 132 k
Installed size: 318 k
Is this ok [y/d/N]: y
Downloading packages:
(1/2): munge-libs-0.5.11-3.el7.x86_64.rpm                                    |  37 kB  00:00:00
(2/2): munge-0.5.11-3.el7.x86_64.rpm                                         |  95 kB  00:00:00
----------------------------------------------------------------------------------------------------
Total                                                               272 kB/s | 132 kB  00:00:00
Running transaction check
Running transaction test
Transaction test succeeded
Running transaction
  Installing : munge-libs-0.5.11-3.el7.x86_64                                                   1/2
  Installing : munge-0.5.11-3.el7.x86_64                                                        2/2
  Verifying  : munge-0.5.11-3.el7.x86_64                                                        1/2
  Verifying  : munge-libs-0.5.11-3.el7.x86_64                                                   2/2

Installed:
  munge.x86_64 0:0.5.11-3.el7

Dependency Installed:
  munge-libs.x86_64 0:0.5.11-3.el7

Complete!
```
..and more munge:

**yum install munge munge-libs munge-devel**

```
69:~$ yum install munge munge-libs munge-devel
Loaded plugins: fastestmirror, langpacks
Loading mirror speeds from cached hostfile
 * base: linux.cc.lehigh.edu
 * epel: mirror.csis.ysu.edu
 * epel-debuginfo: d2lzkl7pfhq30w.cloudfront.net
 * epel-source: d2lzkl7pfhq30w.cloudfront.net
 * extras: mirror.facebook.net
 * updates: mirror.umd.edu
runner_gitlab-runner/x86_64/signature                                        |  862 B  00:00:00
runner_gitlab-runner/x86_64/signature                                        | 1.0 kB  00:00:00 !!!
runner_gitlab-runner-source/signature                                        |  862 B  00:00:00
runner_gitlab-runner-source/signature                                        |  951 B  00:00:00 !!!
Package munge-0.5.11-3.el7.x86_64 already installed and latest version
Package munge-libs-0.5.11-3.el7.x86_64 already installed and latest version
Resolving Dependencies
--> Running transaction check
---> Package munge-devel.x86_64 0:0.5.11-3.el7 will be installed
--> Finished Dependency Resolution

Dependencies Resolved

====================================================================================================
 Package                   Arch                 Version                    Repository          Size
====================================================================================================
Installing:
 munge-devel               x86_64               0.5.11-3.el7               epel                22 k

Transaction Summary
====================================================================================================
Install  1 Package

Total download size: 22 k
Installed size: 22 k
Is this ok [y/d/N]: y
Downloading packages:
munge-devel-0.5.11-3.el7.x86_64.rpm                                          |  22 kB  00:00:00
Running transaction check
Running transaction test
Transaction test succeeded
Running transaction
  Installing : munge-devel-0.5.11-3.el7.x86_64                                                  1/1
  Verifying  : munge-devel-0.5.11-3.el7.x86_64                                                  1/1

Installed:
  munge-devel.x86_64 0:0.5.11-3.el7

Complete!
```
Here we see GID and UID for munge user on raulPC:
```
bash-4.2$ tail -1 /etc/passwd
munge:x:982:899:Runs Uid 'N' Gid Emporium:/var/run/munge:/sbin/nologin

bash-4.2$ tail -1 /etc/group
munge:x:899:

```

#### slurm installation

We prepare with this command to install dependencies:

**yum install openssl openssl-devel pam-devel numactl numactl-devel hwloc hwloc-devel lua lua-devel readline-devel rrdtool-devel ncurses-devel man2html libibmad libibumad -y **

..the output is shown farther below where we do see **Complete**

Then we got this file:

https://download.schedmd.com/slurm/slurm-19.05.7.tar.bz2

..and than we run this command which produces thousands of lines
of output:

**rpmbuild -ta slurm-19.05.7.tar.bz2**

..from which the trailing lines we paste farther below, in
particular it looks like we got these files:

* Wrote: /root/rpmbuild/SRPMS/slurm-19.05.7-1.el7.src.rpm
* Wrote: /root/rpmbuild/RPMS/x86_64/slurm-19.05.7-1.el7.x86_64.rpm
* Wrote: /root/rpmbuild/RPMS/x86_64/slurm-perlapi-19.05.7-1.el7.x86_64.rpm
* Wrote: /root/rpmbuild/RPMS/x86_64/slurm-devel-19.05.7-1.el7.x86_64.rpm
* Wrote: /root/rpmbuild/RPMS/x86_64/slurm-example-configs-19.05.7-1.el7.x86_64.rpm
* Wrote: /root/rpmbuild/RPMS/x86_64/slurm-slurmctld-19.05.7-1.el7.x86_64.rpm
* Wrote: /root/rpmbuild/RPMS/x86_64/slurm-slurmd-19.05.7-1.el7.x86_64.rpm
* Wrote: /root/rpmbuild/RPMS/x86_64/slurm-slurmdbd-19.05.7-1.el7.x86_64.rpm
* Wrote: /root/rpmbuild/RPMS/x86_64/slurm-libpmi-19.05.7-1.el7.x86_64.rpm
* Wrote: /root/rpmbuild/RPMS/x86_64/slurm-torque-19.05.7-1.el7.x86_64.rpm
* Wrote: /root/rpmbuild/RPMS/x86_64/slurm-openlava-19.05.7-1.el7.x86_64.rpm
* Wrote: /root/rpmbuild/RPMS/x86_64/slurm-contribs-19.05.7-1.el7.x86_64.rpm
* Wrote: /root/rpmbuild/RPMS/x86_64/slurm-pam_slurm-19.05.7-1.el7.x86_64.rpm

..and:

```
ls /root/rpmbuild/RPMS/x86_64
slurm-19.05.7-1.el7.x86_64.rpm                  slurm-pam_slurm-19.05.7-1.el7.x86_64.rpm
slurm-contribs-19.05.7-1.el7.x86_64.rpm         slurm-perlapi-19.05.7-1.el7.x86_64.rpm
slurm-devel-19.05.7-1.el7.x86_64.rpm            slurm-slurmctld-19.05.7-1.el7.x86_64.rpm
slurm-example-configs-19.05.7-1.el7.x86_64.rpm  slurm-slurmd-19.05.7-1.el7.x86_64.rpm
slurm-libpmi-19.05.7-1.el7.x86_64.rpm           slurm-slurmdbd-19.05.7-1.el7.x86_64.rpm
slurm-openlava-19.05.7-1.el7.x86_64.rpm         slurm-torque-19.05.7-1.el7.x86_64.rpm
```
..and we copy them to the machine from roots folder:
```
cp -a /root/rpmbuild/RPMS/x86_64/ //usr/local/slurm/slurm-rpms

69:/usr/local/slurm$ ls //usr/local/slurm/slurm-rpms/x86_64/
slurm-19.05.7-1.el7.x86_64.rpm                  slurm-pam_slurm-19.05.7-1.el7.x86_64.rpm
slurm-contribs-19.05.7-1.el7.x86_64.rpm         slurm-perlapi-19.05.7-1.el7.x86_64.rpm
slurm-devel-19.05.7-1.el7.x86_64.rpm            slurm-slurmctld-19.05.7-1.el7.x86_64.rpm
slurm-example-configs-19.05.7-1.el7.x86_64.rpm  slurm-slurmd-19.05.7-1.el7.x86_64.rpm
slurm-libpmi-19.05.7-1.el7.x86_64.rpm           slurm-slurmdbd-19.05.7-1.el7.x86_64.rpm
slurm-openlava-19.05.7-1.el7.x86_64.rpm         slurm-torque-19.05.7-1.el7.x86_64.rpm
```
..and now we install every one of those files:
```
yum --nogpgcheck localinstall slurm-19.05.7-1.el7.x86_64.rpm slurm-contribs-19.05.7-1.el7.x86_64.rpm slurm-devel-19.05.7-1.el7.x86_64.rpm slurm-example-configs-19.05.7-1.el7.x86_64.rpm slurm-libpmi-19.05.7-1.el7.x86_64.rpm slurm-openlava-19.05.7-1.el7.x86_64.rpm slurm-pam_slurm-19.05.7-1.el7.x86_64.rpm slurm-perlapi-19.05.7-1.el7.x86_64.rpm slurm-slurmctld-19.05.7-1.el7.x86_64.rpm slurm-slurmd-19.05.7-1.el7.x86_64.rpm slurm-slurmdbd-19.05.7-1.el7.x86_64.rpm slurm-torque-19.05.7-1.el7.x86_64.rpm
```
..and the **Complete** message and the output are pasted farther below.

..and created the slurm user and group:

```
sudo groupadd -f -g $SLURMUSER slurm
sudo useradd  -m -c "SLURM workload manager" -d /var/lib/slurm -u 1095 -g slurm  -s /bin/bash slurm
```
..and this should be okay:
```
69:/usr/local/slurm/slurm-rpms/x86_64$ tail -2 /etc/group
munge:x:899:
slurm:x:1095:

69:/usr/local/slurm/slurm-rpms/x86_64$ tail -2 /etc/passwd
munge:x:982:899:Runs Uid 'N' Gid Emporium:/var/run/munge:/sbin/nologin
slurm:x:1095:1095:SLURM workload manager:/var/lib/slurm:/bin/bash
```
..and we touch log files:
```
sudo touch /var/log/slurmctld.log
sudo touch /var/log/slurmd.log
sudo chown slurm /var/log/slurmctld.log
sudo chown slurm /var/log/slurmd.log
```
..and we check slurmd, looks okay:
```
69:/usr/local/slurm/slurm-rpms/x86_64$ slurmd -C
NodeName=E1-051569 CPUs=32 Boards=1 SocketsPerBoard=2 CoresPerSocket=8 ThreadsPerCore=2 RealMemory=128693
UpTime=2-02:15:39
```

..but not so okay:
```
69:/usr/local/slurm/slurm-rpms/x86_64$ scontrol show nodes

slurm_load_node error: Unable to contact slurm controller (connect failure)
```
..and so we notice that we did not start slurm:
```
69:/usr/local/slurm/slurm-rpms/x86_64$ sudo systemctl enable slurmd.service
Created symlink from /etc/systemd/system/multi-user.target.wants/slurmd.service to /usr/lib/systemd/system/slurmd.service.

69:/usr/local/slurm/slurm-rpms/x86_64$ sudo systemctl start slurmd.service
Job for slurmd.service failed because the control process exited with error code. See "systemctl status slurmd.service" and "journalctl -xe" for details.

69:/usr/local/slurm/slurm-rpms/x86_64$ systemctl status slurmd.service
● slurmd.service - Slurm node daemon
   Loaded: loaded (/usr/lib/systemd/system/slurmd.service; enabled; vendor preset: disabled)
   Active: failed (Result: exit-code) since Mon 2020-06-15 07:10:24 EDT; 12s ago
  Process: 19087 ExecStart=/usr/sbin/slurmd $SLURMD_OPTIONS (code=exited, status=1/FAILURE)

Jun 15 07:10:24 E1-051569.science.psu.edu systemd[1]: Starting Slurm node daemon...
Jun 15 07:10:24 E1-051569.science.psu.edu systemd[1]: slurmd.service: control process exited, c...=1
Jun 15 07:10:24 E1-051569.science.psu.edu systemd[1]: Failed to start Slurm node daemon.
Jun 15 07:10:24 E1-051569.science.psu.edu systemd[1]: Unit slurmd.service entered failed state.
Jun 15 07:10:24 E1-051569.science.psu.edu systemd[1]: slurmd.service failed.
Hint: Some lines were ellipsized, use -l to show in full.
```

..this worked:
```
69:/usr/local/slurm/slurm-rpms/x86_64$ sudo systemctl start slurmd.service
```
..after making this change to **/etc/slurm/slurm.conf**:
```
#TTT
#ProctrackType=proctrack/cgroup
#proctrack/linuxproc
ProctrackType=proctrack/linuxproc
```
..and we see this happiness, yay:
```
69:/usr/local/slurm/slurm-rpms/x86_64$ sudo systemctl status slurmd.service
● slurmd.service - Slurm node daemon
   Loaded: loaded (/usr/lib/systemd/system/slurmd.service; enabled; vendor preset: disabled)
   Active: active (running) since Mon 2020-06-15 07:17:57 EDT; 3min 32s ago
  Process: 19745 ExecStart=/usr/sbin/slurmd $SLURMD_OPTIONS (code=exited, status=0/SUCCESS)
 Main PID: 19747 (slurmd)
    Tasks: 2
   Memory: 1.0M
   CGroup: /system.slice/slurmd.service
           └─19747 /usr/sbin/slurmd

Jun 15 07:17:57 E1-051569.science.psu.edu systemd[1]: Starting Slurm node daemon...
Jun 15 07:17:57 E1-051569.science.psu.edu systemd[1]: Cant open PID file /var/run/slurmd.pid (...ry
Jun 15 07:17:57 E1-051569.science.psu.edu systemd[1]: Started Slurm node daemon.
Hint: Some lines were ellipsized, use -l to show in full.
```
..that cannot open PID is actually not a problem:
```
69:/usr/local/slurm/slurm-rpms/x86_64$ cat /var/run/slurmd.pid
19747

69:/usr/local/slurm/slurm-rpms/x86_64$ ps -ef |grep slurmd
root     19747     1  0 07:17 ?        00:00:00 /usr/sbin/slurmd
```
..now that was only the nodes, here we start the server, but
it goes badly:
```
69:/usr/local/slurm/slurm-rpms/x86_64$ sudo systemctl enable slurmctld.service
Created symlink from /etc/systemd/system/multi-user.target.wants/slurmctld.service to /usr/lib/systemd/system/slurmctld.service.
69:/usr/local/slurm/slurm-rpms/x86_64$ sudo systemctl start slurmctld.service

69:/usr/local/slurm/slurm-rpms/x86_64$ sudo systemctl status slurmctld.service
● slurmctld.service - Slurm controller daemon
   Loaded: loaded (/usr/lib/systemd/system/slurmctld.service; enabled; vendor preset: disabled)
   Active: failed (Result: exit-code) since Mon 2020-06-15 07:25:57 EDT; 5s ago
  Process: 20462 ExecStart=/usr/sbin/slurmctld $SLURMCTLD_OPTIONS (code=exited, status=0/SUCCESS)
 Main PID: 20471 (code=exited, status=1/FAILURE)

Jun 15 07:25:57 E1-051569.science.psu.edu systemd[1]: Starting Slurm controller daemon...
Jun 15 07:25:57 E1-051569.science.psu.edu systemd[1]: Cant open PID file /var/run/slurmctld.pi...ry
Jun 15 07:25:57 E1-051569.science.psu.edu systemd[1]: Started Slurm controller daemon.
Jun 15 07:25:57 E1-051569.science.psu.edu systemd[1]: slurmctld.service: main process exited, c...RE
Jun 15 07:25:57 E1-051569.science.psu.edu systemd[1]: Unit slurmctld.service entered failed state.
Jun 15 07:25:57 E1-051569.science.psu.edu systemd[1]: slurmctld.service failed.
Hint: Some lines were ellipsized, use -l to show in full.
```
..and so we stop things:
```
69:/usr/local/slurm/slurm-rpms/x86_64$ sudo systemctl stop slurmd.service
69:/usr/local/slurm/slurm-rpms/x86_64$ sudo systemctl status slurmd.service
● slurmd.service - Slurm node daemon
   Loaded: loaded (/usr/lib/systemd/system/slurmd.service; enabled; vendor preset: disabled)
   Active: inactive (dead) since Mon 2020-06-15 07:30:18 EDT; 7s ago
 Main PID: 19747 (code=exited, status=0/SUCCESS)

Jun 15 07:17:57 E1-051569.science.psu.edu systemd[1]: Starting Slurm node daemon...
Jun 15 07:17:57 E1-051569.science.psu.edu systemd[1]: Cant open PID file /var/run/slurmd.pid (...ry
Jun 15 07:17:57 E1-051569.science.psu.edu systemd[1]: Started Slurm node daemon.
Jun 15 07:30:10 E1-051569.science.psu.edu systemd[1]: Stopping Slurm node daemon...
Jun 15 07:30:18 E1-051569.science.psu.edu systemd[1]: Stopped Slurm node daemon.
Hint: Some lines were ellipsized, use -l to show in full.
```

We see an error about CPU count and so we change slurm.conf to say CPU count is 2
and then we start up again and fail:
```
69:/usr/local/slurm/slurm-rpms/x86_64$ sudo systemctl start slurmd.service

69:/usr/local/slurm/slurm-rpms/x86_64$ sudo systemctl status slurmd.service
● slurmd.service - Slurm node daemon
   Loaded: loaded (/usr/lib/systemd/system/slurmd.service; enabled; vendor preset: disabled)
   Active: active (running) since Mon 2020-06-15 07:33:31 EDT; 4s ago
  Process: 21173 ExecStart=/usr/sbin/slurmd $SLURMD_OPTIONS (code=exited, status=0/SUCCESS)
 Main PID: 21175 (slurmd)
    Tasks: 2
   Memory: 976.0K
   CGroup: /system.slice/slurmd.service
           └─21175 /usr/sbin/slurmd

Jun 15 07:33:31 E1-051569.science.psu.edu systemd[1]: Starting Slurm node daemon...
Jun 15 07:33:31 E1-051569.science.psu.edu systemd[1]: Cant open PID file /var/run/slurmd.pid (...ry
Jun 15 07:33:31 E1-051569.science.psu.edu systemd[1]: Started Slurm node daemon.
Hint: Some lines were ellipsized, use -l to show in full.

69:/usr/local/slurm/slurm-rpms/x86_64$ ps -ef|grep slur
root     21175     1  0 07:33 ?        00:00:00 /usr/sbin/slurmd
nimda    21191 30741  0 07:33 pts/2    00:00:00 grep --color=auto slur
69:/usr/local/slurm/slurm-rpms/x86_64$ sudo systemctl status slurmctld.service
● slurmctld.service - Slurm controller daemon
   Loaded: loaded (/usr/lib/systemd/system/slurmctld.service; enabled; vendor preset: disabled)
   Active: failed (Result: exit-code) since Mon 2020-06-15 07:29:10 EDT; 4min 38s ago
  Process: 20763 ExecStart=/usr/sbin/slurmctld $SLURMCTLD_OPTIONS (code=exited, status=0/SUCCESS)
 Main PID: 20765 (code=exited, status=1/FAILURE)

Jun 15 07:29:10 E1-051569.science.psu.edu systemd[1]: Starting Slurm controller daemon...
Jun 15 07:29:10 E1-051569.science.psu.edu systemd[1]: Cant open PID file /var/run/slurmctld.pi...ry
Jun 15 07:29:10 E1-051569.science.psu.edu systemd[1]: Started Slurm controller daemon.
Jun 15 07:29:10 E1-051569.science.psu.edu systemd[1]: slurmctld.service: main process exited, c...RE
Jun 15 07:29:10 E1-051569.science.psu.edu systemd[1]: Unit slurmctld.service entered failed state.
Jun 15 07:29:10 E1-051569.science.psu.edu systemd[1]: slurmctld.service failed.
Hint: Some lines were ellipsized, use -l to show in full.

69:/usr/local/slurm/slurm-rpms/x86_64$ sudo systemctl start slurmctld.service

69:/usr/local/slurm/slurm-rpms/x86_64$ sudo systemctl status slurmctld.service
● slurmctld.service - Slurm controller daemon
   Loaded: loaded (/usr/lib/systemd/system/slurmctld.service; enabled; vendor preset: disabled)
   Active: failed (Result: exit-code) since Mon 2020-06-15 07:33:53 EDT; 5s ago
  Process: 21212 ExecStart=/usr/sbin/slurmctld $SLURMCTLD_OPTIONS (code=exited, status=0/SUCCESS)
 Main PID: 21214 (code=exited, status=1/FAILURE)

Jun 15 07:33:53 E1-051569.science.psu.edu systemd[1]: Starting Slurm controller daemon...
Jun 15 07:33:53 E1-051569.science.psu.edu systemd[1]: Cant open PID file /var/run/slurmctld.pi...ry
Jun 15 07:33:53 E1-051569.science.psu.edu systemd[1]: Started Slurm controller daemon.
Jun 15 07:33:53 E1-051569.science.psu.edu slurmctld[21214]: fatal: Incorrect permissions on stat...l
Jun 15 07:33:53 E1-051569.science.psu.edu systemd[1]: slurmctld.service: main process exited, c...RE
Jun 15 07:33:53 E1-051569.science.psu.edu systemd[1]: Unit slurmctld.service entered failed state.
Jun 15 07:33:53 E1-051569.science.psu.edu systemd[1]: slurmctld.service failed.
Hint: Some lines were ellipsized, use -l to show in full.
```
..we have slurmd but not slurmctld

```
69:/usr/local/slurm/slurm-rpms/x86_64$  ps -ef |grep slurm
root     21175     1  0 07:33 ?        00:00:00 /usr/sbin/slurmd
```
..and we notice in particular the stat error:
**fatal: Incorrect permissions on sta     t...l**

..it looks like slurmctld wants to write to /var/spool/
but is denied, and so we make two directories here:
```
sudo mkdir /var/spool/slurm/
sudo chown slurm /var/spool/slurm/
```
..and we change the slurm.conf to use /var/spool/slurm instead of /var/spool/:
```
#TTT
#StateSaveLocation=/var/spool
StateSaveLocation=/var/spool/slurm
```
..and we start slurmd and slurmctld as shown above and we get happiness:
```
69:/usr/local/slurm/slurm-rpms/x86_64$ scontrol show nodes
NodeName=E1-051569 Arch=x86_64 CoresPerSocket=1
   CPUAlloc=0 CPUTot=2 CPULoad=0.05
   AvailableFeatures=(null)
   ActiveFeatures=(null)
   Gres=(null)
   NodeAddr=128.118.84.129 NodeHostName=E1-051569 Version=19.05.7
   OS=Linux 3.10.0-1127.10.1.el7.x86_64 #1 SMP Wed Jun 3 14:28:03 UTC 2020
   RealMemory=1 AllocMem=0 FreeMem=121627 Sockets=2 Boards=1
   State=IDLE ThreadsPerCore=1 TmpDisk=0 Weight=1 Owner=N/A MCS_label=N/A
   Partitions=debug
   BootTime=2020-06-13T04:51:49 SlurmdStartTime=2020-06-15T07:41:44
   CfgTRES=cpu=2,mem=1M,billing=2
   AllocTRES=
   CapWatts=n/a
   CurrentWatts=0 AveWatts=0
   ExtSensorsJoules=n/s ExtSensorsWatts=0 ExtSensorsTemp=n/s

```
..and we test the system with bad results:
```
69:/usr/local/slurm/slurm-rpms/x86_64$ srun -N5 /bin/hostname
srun: Requested partition configuration not available now
srun: job 2 queued and waiting for resources
```
..which hung for a while and so we CTRL-C and see:
```
^Csrun: Job allocation 2 has been revoked
srun: Force Terminated job 2
```
..and we check to see our jobs:
```
69:/usr/local/slurm/slurm-rpms/x86_64$ scontrol show jobs
JobId=2 JobName=hostname
   UserId=nimda(1002) GroupId=nimda(1094) MCS_label=N/A
   Priority=4294901759 Nice=0 Account=(null) QOS=(null)
   JobState=CANCELLED Reason=PartitionConfig Dependency=(null)
   Requeue=1 Restarts=0 BatchFlag=0 Reboot=0 ExitCode=0:0
   RunTime=00:00:00 TimeLimit=UNLIMITED TimeMin=N/A
   SubmitTime=2020-06-15T07:47:18 EligibleTime=2020-06-15T07:47:18
   AccrueTime=2020-06-15T07:47:18
   StartTime=2020-06-15T07:48:15 EndTime=2020-06-15T07:48:15 Deadline=N/A
   SuspendTime=None SecsPreSuspend=0 LastSchedEval=2020-06-15T07:47:18
   Partition=debug AllocNode:Sid=E1-051569:30731
   ReqNodeList=(null) ExcNodeList=(null)
   NodeList=(null)
   NumNodes=5 NumCPUs=5 NumTasks=0 CPUs/Task=1 ReqB:S:C:T=0:0:*:*
   TRES=cpu=5,node=5,billing=5
   Socks/Node=* NtasksPerN:B:S:C=0:0:*:* CoreSpec=*
   MinCPUsNode=1 MinMemoryNode=0 MinTmpDiskNode=0
   Features=(null) DelayBoot=00:00:00
   OverSubscribe=OK Contiguous=0 Licenses=(null) Network=(null)
   Command=/bin/hostname
   WorkDir=/usr/local/slurm/slurm-rpms/x86_64
   Power=

```
..all of which makes me think that we do not have 5 CPUs, which we do
not because I told slurm.conf that we only have 2, and so we try to run
a job with only one CPU and it works:
```
69:/usr/local/slurm/slurm-rpms/x86_64$ srun -N1 /bin/hostname
E1-051569.science.psu.edu
```
..nicely we see for the two jobs two different results:

* JobState=CANCELLED
* JobState=COMPLETED

```
69:/usr/local/slurm/slurm-rpms/x86_64$ scontrol show jobs
JobId=2 JobName=hostname
   UserId=nimda(1002) GroupId=nimda(1094) MCS_label=N/A
   Priority=4294901759 Nice=0 Account=(null) QOS=(null)
   JobState=CANCELLED Reason=PartitionConfig Dependency=(null)
   Requeue=1 Restarts=0 BatchFlag=0 Reboot=0 ExitCode=0:0
   RunTime=00:00:00 TimeLimit=UNLIMITED TimeMin=N/A
   SubmitTime=2020-06-15T07:47:18 EligibleTime=2020-06-15T07:47:18
   AccrueTime=2020-06-15T07:47:18
   StartTime=2020-06-15T07:48:15 EndTime=2020-06-15T07:48:15 Deadline=N/A
   SuspendTime=None SecsPreSuspend=0 LastSchedEval=2020-06-15T07:47:18
   Partition=debug AllocNode:Sid=E1-051569:30731
   ReqNodeList=(null) ExcNodeList=(null)
   NodeList=(null)
   NumNodes=5 NumCPUs=5 NumTasks=0 CPUs/Task=1 ReqB:S:C:T=0:0:*:*
   TRES=cpu=5,node=5,billing=5
   Socks/Node=* NtasksPerN:B:S:C=0:0:*:* CoreSpec=*
   MinCPUsNode=1 MinMemoryNode=0 MinTmpDiskNode=0
   Features=(null) DelayBoot=00:00:00
   OverSubscribe=OK Contiguous=0 Licenses=(null) Network=(null)
   Command=/bin/hostname
   WorkDir=/usr/local/slurm/slurm-rpms/x86_64
   Power=

JobId=3 JobName=hostname
   UserId=nimda(1002) GroupId=nimda(1094) MCS_label=N/A
   Priority=4294901758 Nice=0 Account=(null) QOS=(null)
   JobState=COMPLETED Reason=None Dependency=(null)
   Requeue=1 Restarts=0 BatchFlag=0 Reboot=0 ExitCode=0:0
   RunTime=00:00:00 TimeLimit=UNLIMITED TimeMin=N/A
   SubmitTime=2020-06-15T07:50:07 EligibleTime=2020-06-15T07:50:07
   AccrueTime=Unknown
   StartTime=2020-06-15T07:50:07 EndTime=2020-06-15T07:50:07 Deadline=N/A
   SuspendTime=None SecsPreSuspend=0 LastSchedEval=2020-06-15T07:50:07
   Partition=debug AllocNode:Sid=E1-051569:30731
   ReqNodeList=(null) ExcNodeList=(null)
   NodeList=E1-051569
   BatchHost=E1-051569
   NumNodes=1 NumCPUs=1 NumTasks=0 CPUs/Task=1 ReqB:S:C:T=0:0:*:*
   TRES=cpu=1,node=1,billing=1
   Socks/Node=* NtasksPerN:B:S:C=0:0:*:* CoreSpec=*
   MinCPUsNode=1 MinMemoryNode=0 MinTmpDiskNode=0
   Features=(null) DelayBoot=00:00:00
   OverSubscribe=OK Contiguous=0 Licenses=(null) Network=(null)
   Command=/bin/hostname
   WorkDir=/usr/local/slurm/slurm-rpms/x86_64
   Power=

```
Here we try to make and run a bash script in batch mode with **sbatch**:
```
 1264  cd /var/tmp
 1265  sbatch -N1 /var/tmp/slurmRunner.sh
 1266  scontrol show jobs
 1267  cat /var/tmp/slurm-7.out
```
..which tries to run this shell script:
```
69:/var/tmp$ cat /var/tmp/slurmRunner.sh
#!/bin/sh
hostname >> /var/tmp/hostname_20200615_0755a.txt
```
..and that ended up with an empty file, and so we change
to get rid of the redirection line:
```
69:/var/tmp$ cat /var/tmp/slurmRunner.sh
#!/bin/sh
hostname
```
..and we sbatch:
```
69:/var/tmp$ sbatch -N1 /var/tmp/slurmRunner.sh
```
..and we check the job status to see that it is good
and that its output goes to /var/tmp/slurm-8.out:
```
69:/var/tmp$ scontrol show jobs
```
..and we see that the job output landed in that file:
```
69:/var/tmp$ cat /var/tmp/slurm-8.out
E1-051569.science.psu.edu
```

LOTS of help from here:

https://www.slothparadise.com/how-to-install-slurm-on-centos-7-cluster/


#### slurm RPM local installs

```
69:/usr/local/slurm$ cd slurm-rpms/x86_64/

69:/usr/local/slurm/slurm-rpms/x86_64$ ls
slurm-19.05.7-1.el7.x86_64.rpm                  slurm-pam_slurm-19.05.7-1.el7.x86_64.rpm
slurm-contribs-19.05.7-1.el7.x86_64.rpm         slurm-perlapi-19.05.7-1.el7.x86_64.rpm
slurm-devel-19.05.7-1.el7.x86_64.rpm            slurm-slurmctld-19.05.7-1.el7.x86_64.rpm
slurm-example-configs-19.05.7-1.el7.x86_64.rpm  slurm-slurmd-19.05.7-1.el7.x86_64.rpm
slurm-libpmi-19.05.7-1.el7.x86_64.rpm           slurm-slurmdbd-19.05.7-1.el7.x86_64.rpm
slurm-openlava-19.05.7-1.el7.x86_64.rpm         slurm-torque-19.05.7-1.el7.x86_64.rpm

69:/usr/local/slurm/slurm-rpms/x86_64$ ls| tr '\n' ' '
slurm-19.05.7-1.el7.x86_64.rpm slurm-contribs-19.05.7-1.el7.x86_64.rpm slurm-devel-19.05.7-1.el7.x86_64.rpm slurm-example-configs-19.05.7-1.el7.x86_64.rpm slurm-libpmi-19.05.7-1.el7.x86_64.rpm slurm-openlava-19.05.7-1.el7.x86_64.rpm slurm-pam_slurm-19.05.7-1.el7.x86_64.rpm slurm-perlapi-19.05.7-1.el7.x86_64.rpm slurm-slurmctld-19.05.7-1.el7.x86_64.rpm slurm-slurmd-19.05.7-1.el7.x86_64.rpm slurm-slurmdbd-19.05.7-1.el7.x86_64.rpm slurm-torque-19.05.7-1.el7.x86_64.rpm

69:/usr/local/slurm/slurm-rpms/x86_64$
-19.05.7-1.el7.x86_64.rpm slurm-contribs-19.05.7-1.el7.x86_64.rpm slurm-devel-19.05.7-1.el7.x86_64.rpm slurm-example-configs-19.05.7-1.el7.x86_64.rpm slurm-libpmi-19.05.7-1.el7.x86_64.rpm slurm-openlava-19.05.7-1.el7.x86_64.rpm slurm-pam_slurm-19.05.7-1.el7.x86_64.rpm slurm-perlapi-19.05.7-1.el7.x86_64.rpm slurm-slurmctld-19.05.7-1.el7.x86_64.rpm slurm-slurmd-19.05.7-1.el7.x86_64.rpm slurm-slurmdbd-19.05.7-1.el7.x86_64.rpm slurm-torque-19.05.7-1.el7.x86_64.rpm
Loaded plugins: fastestmirror, langpacks
Examining slurm-19.05.7-1.el7.x86_64.rpm: slurm-19.05.7-1.el7.x86_64
Marking slurm-19.05.7-1.el7.x86_64.rpm to be installed
Examining slurm-contribs-19.05.7-1.el7.x86_64.rpm: slurm-contribs-19.05.7-1.el7.x86_64
Marking slurm-contribs-19.05.7-1.el7.x86_64.rpm to be installed
Examining slurm-devel-19.05.7-1.el7.x86_64.rpm: slurm-devel-19.05.7-1.el7.x86_64
Marking slurm-devel-19.05.7-1.el7.x86_64.rpm to be installed
Examining slurm-example-configs-19.05.7-1.el7.x86_64.rpm: slurm-example-configs-19.05.7-1.el7.x86_64
Marking slurm-example-configs-19.05.7-1.el7.x86_64.rpm to be installed
Examining slurm-libpmi-19.05.7-1.el7.x86_64.rpm: slurm-libpmi-19.05.7-1.el7.x86_64
Marking slurm-libpmi-19.05.7-1.el7.x86_64.rpm to be installed
Examining slurm-openlava-19.05.7-1.el7.x86_64.rpm: slurm-openlava-19.05.7-1.el7.x86_64
Marking slurm-openlava-19.05.7-1.el7.x86_64.rpm to be installed
Examining slurm-pam_slurm-19.05.7-1.el7.x86_64.rpm: slurm-pam_slurm-19.05.7-1.el7.x86_64
Marking slurm-pam_slurm-19.05.7-1.el7.x86_64.rpm to be installed
Examining slurm-perlapi-19.05.7-1.el7.x86_64.rpm: slurm-perlapi-19.05.7-1.el7.x86_64
Marking slurm-perlapi-19.05.7-1.el7.x86_64.rpm to be installed
Examining slurm-slurmctld-19.05.7-1.el7.x86_64.rpm: slurm-slurmctld-19.05.7-1.el7.x86_64
Marking slurm-slurmctld-19.05.7-1.el7.x86_64.rpm to be installed
Examining slurm-slurmd-19.05.7-1.el7.x86_64.rpm: slurm-slurmd-19.05.7-1.el7.x86_64
Marking slurm-slurmd-19.05.7-1.el7.x86_64.rpm to be installed
Examining slurm-slurmdbd-19.05.7-1.el7.x86_64.rpm: slurm-slurmdbd-19.05.7-1.el7.x86_64
Marking slurm-slurmdbd-19.05.7-1.el7.x86_64.rpm to be installed
Examining slurm-torque-19.05.7-1.el7.x86_64.rpm: slurm-torque-19.05.7-1.el7.x86_64
Marking slurm-torque-19.05.7-1.el7.x86_64.rpm to be installed
Resolving Dependencies
--> Running transaction check
---> Package slurm.x86_64 0:19.05.7-1.el7 will be installed
---> Package slurm-contribs.x86_64 0:19.05.7-1.el7 will be installed
---> Package slurm-devel.x86_64 0:19.05.7-1.el7 will be installed
---> Package slurm-example-configs.x86_64 0:19.05.7-1.el7 will be installed
---> Package slurm-libpmi.x86_64 0:19.05.7-1.el7 will be installed
---> Package slurm-openlava.x86_64 0:19.05.7-1.el7 will be installed
--> Processing Dependency: perl(Switch) for package: slurm-openlava-19.05.7-1.el7.x86_64
Loading mirror speeds from cached hostfile
 * base: linux.cc.lehigh.edu
 * epel: mirror.csis.ysu.edu
 * epel-debuginfo: d2lzkl7pfhq30w.cloudfront.net
 * epel-source: d2lzkl7pfhq30w.cloudfront.net
 * extras: mirror.facebook.net
 * updates: mirror.umd.edu
runner_gitlab-runner                                                         | 1.0 kB  00:00:00
runner_gitlab-runner-source                                                  |  951 B  00:00:00
---> Package slurm-pam_slurm.x86_64 0:19.05.7-1.el7 will be installed
---> Package slurm-perlapi.x86_64 0:19.05.7-1.el7 will be installed
---> Package slurm-slurmctld.x86_64 0:19.05.7-1.el7 will be installed
---> Package slurm-slurmd.x86_64 0:19.05.7-1.el7 will be installed
---> Package slurm-slurmdbd.x86_64 0:19.05.7-1.el7 will be installed
---> Package slurm-torque.x86_64 0:19.05.7-1.el7 will be installed
--> Running transaction check
---> Package perl-Switch.noarch 0:2.16-7.el7 will be installed
--> Finished Dependency Resolution

Dependencies Resolved

====================================================================================================
 Package                Arch    Version          Repository                                    Size
====================================================================================================
Installing:
 slurm                  x86_64  19.05.7-1.el7    /slurm-19.05.7-1.el7.x86_64                   49 M
 slurm-contribs         x86_64  19.05.7-1.el7    /slurm-contribs-19.05.7-1.el7.x86_64          31 k
 slurm-devel            x86_64  19.05.7-1.el7    /slurm-devel-19.05.7-1.el7.x86_64            366 k
 slurm-example-configs  x86_64  19.05.7-1.el7    /slurm-example-configs-19.05.7-1.el7.x86_64  6.4 k
 slurm-libpmi           x86_64  19.05.7-1.el7    /slurm-libpmi-19.05.7-1.el7.x86_64           456 k
 slurm-openlava         x86_64  19.05.7-1.el7    /slurm-openlava-19.05.7-1.el7.x86_64          24 k
 slurm-pam_slurm        x86_64  19.05.7-1.el7    /slurm-pam_slurm-19.05.7-1.el7.x86_64        432 k
 slurm-perlapi          x86_64  19.05.7-1.el7    /slurm-perlapi-19.05.7-1.el7.x86_64          3.2 M
 slurm-slurmctld        x86_64  19.05.7-1.el7    /slurm-slurmctld-19.05.7-1.el7.x86_64        3.7 M
 slurm-slurmd           x86_64  19.05.7-1.el7    /slurm-slurmd-19.05.7-1.el7.x86_64           2.4 M
 slurm-slurmdbd         x86_64  19.05.7-1.el7    /slurm-slurmdbd-19.05.7-1.el7.x86_64         2.3 M
 slurm-torque           x86_64  19.05.7-1.el7    /slurm-torque-19.05.7-1.el7.x86_64           370 k
Installing for dependencies:
 perl-Switch            noarch  2.16-7.el7       base                                          22 k

Transaction Summary
====================================================================================================
Install  12 Packages (+1 Dependent package)

Total size: 63 M
Total download size: 22 k
Installed size: 63 M
Is this ok [y/d/N]: y
Downloading packages:
perl-Switch-2.16-7.el7.noarch.rpm                                            |  22 kB  00:00:00
Running transaction check
Running transaction test
Transaction test succeeded
Running transaction
  Installing : slurm-19.05.7-1.el7.x86_64                                                      1/13
  Installing : slurm-perlapi-19.05.7-1.el7.x86_64                                              2/13
  Installing : perl-Switch-2.16-7.el7.noarch                                                   3/13
  Installing : slurm-openlava-19.05.7-1.el7.x86_64                                             4/13
  Installing : slurm-torque-19.05.7-1.el7.x86_64                                               5/13
  Installing : slurm-contribs-19.05.7-1.el7.x86_64                                             6/13
  Installing : slurm-libpmi-19.05.7-1.el7.x86_64                                               7/13
  Installing : slurm-slurmd-19.05.7-1.el7.x86_64                                               8/13
  Installing : slurm-pam_slurm-19.05.7-1.el7.x86_64                                            9/13
  Installing : slurm-slurmctld-19.05.7-1.el7.x86_64                                           10/13
  Installing : slurm-devel-19.05.7-1.el7.x86_64                                               11/13
  Installing : slurm-slurmdbd-19.05.7-1.el7.x86_64                                            12/13
  Installing : slurm-example-configs-19.05.7-1.el7.x86_64                                     13/13
  Verifying  : slurm-libpmi-19.05.7-1.el7.x86_64                                               1/13
  Verifying  : slurm-slurmd-19.05.7-1.el7.x86_64                                               2/13
  Verifying  : slurm-openlava-19.05.7-1.el7.x86_64                                             3/13
  Verifying  : slurm-19.05.7-1.el7.x86_64                                                      4/13
  Verifying  : slurm-pam_slurm-19.05.7-1.el7.x86_64                                            5/13
  Verifying  : slurm-slurmctld-19.05.7-1.el7.x86_64                                            6/13
  Verifying  : perl-Switch-2.16-7.el7.noarch                                                   7/13
  Verifying  : slurm-contribs-19.05.7-1.el7.x86_64                                             8/13
  Verifying  : slurm-devel-19.05.7-1.el7.x86_64                                                9/13
  Verifying  : slurm-example-configs-19.05.7-1.el7.x86_64                                     10/13
  Verifying  : slurm-perlapi-19.05.7-1.el7.x86_64                                             11/13
  Verifying  : slurm-torque-19.05.7-1.el7.x86_64                                              12/13
  Verifying  : slurm-slurmdbd-19.05.7-1.el7.x86_64                                            13/13

Installed:
  slurm.x86_64 0:19.05.7-1.el7                  slurm-contribs.x86_64 0:19.05.7-1.el7
  slurm-devel.x86_64 0:19.05.7-1.el7            slurm-example-configs.x86_64 0:19.05.7-1.el7
  slurm-libpmi.x86_64 0:19.05.7-1.el7           slurm-openlava.x86_64 0:19.05.7-1.el7
  slurm-pam_slurm.x86_64 0:19.05.7-1.el7        slurm-perlapi.x86_64 0:19.05.7-1.el7
  slurm-slurmctld.x86_64 0:19.05.7-1.el7        slurm-slurmd.x86_64 0:19.05.7-1.el7
  slurm-slurmdbd.x86_64 0:19.05.7-1.el7         slurm-torque.x86_64 0:19.05.7-1.el7

Dependency Installed:
  perl-Switch.noarch 0:2.16-7.el7

Complete!
```
#### trailing output of rpm-build for slurm

```
Obsoletes: pam_slurm
Checking for unpackaged file(s): /usr/lib/rpm/check-files /root/rpmbuild/BUILDROOT/slurm-19.05.7-1.el7.x86_64
Wrote: /root/rpmbuild/SRPMS/slurm-19.05.7-1.el7.src.rpm
Wrote: /root/rpmbuild/RPMS/x86_64/slurm-19.05.7-1.el7.x86_64.rpm
Wrote: /root/rpmbuild/RPMS/x86_64/slurm-perlapi-19.05.7-1.el7.x86_64.rpm
Wrote: /root/rpmbuild/RPMS/x86_64/slurm-devel-19.05.7-1.el7.x86_64.rpm
Wrote: /root/rpmbuild/RPMS/x86_64/slurm-example-configs-19.05.7-1.el7.x86_64.rpm
Wrote: /root/rpmbuild/RPMS/x86_64/slurm-slurmctld-19.05.7-1.el7.x86_64.rpm
Wrote: /root/rpmbuild/RPMS/x86_64/slurm-slurmd-19.05.7-1.el7.x86_64.rpm
Wrote: /root/rpmbuild/RPMS/x86_64/slurm-slurmdbd-19.05.7-1.el7.x86_64.rpm
Wrote: /root/rpmbuild/RPMS/x86_64/slurm-libpmi-19.05.7-1.el7.x86_64.rpm
Wrote: /root/rpmbuild/RPMS/x86_64/slurm-torque-19.05.7-1.el7.x86_64.rpm
Wrote: /root/rpmbuild/RPMS/x86_64/slurm-openlava-19.05.7-1.el7.x86_64.rpm
Wrote: /root/rpmbuild/RPMS/x86_64/slurm-contribs-19.05.7-1.el7.x86_64.rpm
Wrote: /root/rpmbuild/RPMS/x86_64/slurm-pam_slurm-19.05.7-1.el7.x86_64.rpm
Executing(%clean): /bin/sh -e /var/tmp/rpm-tmp.MfYcfk
+ umask 022
+ cd /root/rpmbuild/BUILD
+ cd slurm-19.05.7
+ rm -rf /root/rpmbuild/BUILDROOT/slurm-19.05.7-1.el7.x86_64
+ exit 0
```


#### slurm pre-requistes yum installs
```
69:~$
yum install openssl openssl-devel pam-devel numactl numactl-devel hwloc hwloc-devel lua lua-devel readline-devel rrdtool-devel ncurses-devel man2html libibmad libibumad -y

Loaded plugins: fastestmirror, langpacks
Loading mirror speeds from cached hostfile
 * base: linux.cc.lehigh.edu
 * epel: mirror.csis.ysu.edu
 * epel-debuginfo: d2lzkl7pfhq30w.cloudfront.net
 * epel-source: d2lzkl7pfhq30w.cloudfront.net
 * extras: mirror.facebook.net
 * updates: mirror.umd.edu
Package 1:openssl-1.0.2k-19.el7.x86_64 already installed and latest version
Package 1:openssl-devel-1.0.2k-19.el7.x86_64 already installed and latest version
Package lua-5.1.4-15.el7.x86_64 already installed and latest version
Package ncurses-devel-5.9-14.20130511.el7_4.x86_64 already installed and latest version
Package libibmad is obsoleted by infiniband-diags, trying to install infiniband-diags-2.1.0-1.el7.x86_64 instead
Package libibumad-22.4-2.el7_8.x86_64 already installed and latest version
Resolving Dependencies
--> Running transaction check
---> Package hwloc.x86_64 0:1.11.8-4.el7 will be installed
---> Package hwloc-devel.x86_64 0:1.11.8-4.el7 will be installed
--> Processing Dependency: rdma-core-devel(x86-64) for package: hwloc-devel-1.11.8-4.el7.x86_64
---> Package infiniband-diags.x86_64 0:2.1.0-1.el7 will be installed
---> Package lua-devel.x86_64 0:5.1.4-15.el7 will be installed
---> Package man2html.x86_64 0:1.6-13.g.el7 will be installed
--> Processing Dependency: man2html-core(x86-64) = 1.6-13.g.el7 for package: man2html-1.6-13.g.el7.x86_64
---> Package numactl.x86_64 0:2.0.12-5.el7 will be installed
---> Package numactl-devel.x86_64 0:2.0.12-5.el7 will be installed
---> Package pam-devel.x86_64 0:1.1.8-23.el7 will be installed
---> Package readline-devel.x86_64 0:6.2-11.el7 will be installed
---> Package rrdtool-devel.x86_64 0:1.4.8-9.el7 will be installed
--> Running transaction check
---> Package man2html-core.x86_64 0:1.6-13.g.el7 will be installed
---> Package rdma-core-devel.x86_64 0:22.4-2.el7_8 will be installed
--> Processing Dependency: ibacm = 22.4-2.el7_8 for package: rdma-core-devel-22.4-2.el7_8.x86_64
--> Running transaction check
---> Package ibacm.x86_64 0:22.4-2.el7_8 will be installed
--> Finished Dependency Resolution

Dependencies Resolved

====================================================================================================
 Package                      Arch               Version                  Repository           Size
====================================================================================================
Installing:
 hwloc                        x86_64             1.11.8-4.el7             base                151 k
 hwloc-devel                  x86_64             1.11.8-4.el7             base                208 k
 infiniband-diags             x86_64             2.1.0-1.el7              base                307 k
 lua-devel                    x86_64             5.1.4-15.el7             base                 21 k
 man2html                     x86_64             1.6-13.g.el7             epel                 25 k
 numactl                      x86_64             2.0.12-5.el7             base                 66 k
 numactl-devel                x86_64             2.0.12-5.el7             base                 24 k
 pam-devel                    x86_64             1.1.8-23.el7             base                185 k
 readline-devel               x86_64             6.2-11.el7               base                139 k
 rrdtool-devel                x86_64             1.4.8-9.el7              base                 27 k
Installing for dependencies:
 ibacm                        x86_64             22.4-2.el7_8             updates              82 k
 man2html-core                x86_64             1.6-13.g.el7             epel                 53 k
 rdma-core-devel              x86_64             22.4-2.el7_8             updates             254 k

Transaction Summary
====================================================================================================
Install  10 Packages (+3 Dependent packages)

Total download size: 1.5 M
Installed size: 3.6 M
Downloading packages:
(1/13): hwloc-devel-1.11.8-4.el7.x86_64.rpm                                  | 208 kB  00:00:00
(2/13): lua-devel-5.1.4-15.el7.x86_64.rpm                                    |  21 kB  00:00:00
(3/13): hwloc-1.11.8-4.el7.x86_64.rpm                                        | 151 kB  00:00:00
(4/13): ibacm-22.4-2.el7_8.x86_64.rpm                                        |  82 kB  00:00:00
(5/13): numactl-2.0.12-5.el7.x86_64.rpm                                      |  66 kB  00:00:00
(6/13): numactl-devel-2.0.12-5.el7.x86_64.rpm                                |  24 kB  00:00:00
(7/13): pam-devel-1.1.8-23.el7.x86_64.rpm                                    | 185 kB  00:00:00
(8/13): infiniband-diags-2.1.0-1.el7.x86_64.rpm                              | 307 kB  00:00:00
(9/13): man2html-1.6-13.g.el7.x86_64.rpm                                     |  25 kB  00:00:00
(10/13): readline-devel-6.2-11.el7.x86_64.rpm                                | 139 kB  00:00:00
(11/13): rrdtool-devel-1.4.8-9.el7.x86_64.rpm                                |  27 kB  00:00:00
(12/13): rdma-core-devel-22.4-2.el7_8.x86_64.rpm                             | 254 kB  00:00:00
(13/13): man2html-core-1.6-13.g.el7.x86_64.rpm                               |  53 kB  00:00:00
----------------------------------------------------------------------------------------------------
Total                                                               2.0 MB/s | 1.5 MB  00:00:00
Running transaction check
Running transaction test
Transaction test succeeded
Running transaction
  Installing : ibacm-22.4-2.el7_8.x86_64                                                       1/13
  Installing : rdma-core-devel-22.4-2.el7_8.x86_64                                             2/13
  Installing : man2html-core-1.6-13.g.el7.x86_64                                               3/13
  Installing : man2html-1.6-13.g.el7.x86_64                                                    4/13
  Installing : hwloc-devel-1.11.8-4.el7.x86_64                                                 5/13
  Installing : hwloc-1.11.8-4.el7.x86_64                                                       6/13
  Installing : readline-devel-6.2-11.el7.x86_64                                                7/13
  Installing : numactl-2.0.12-5.el7.x86_64                                                     8/13
  Installing : numactl-devel-2.0.12-5.el7.x86_64                                               9/13
  Installing : pam-devel-1.1.8-23.el7.x86_64                                                  10/13
  Installing : rrdtool-devel-1.4.8-9.el7.x86_64                                               11/13
  Installing : lua-devel-5.1.4-15.el7.x86_64                                                  12/13
  Installing : infiniband-diags-2.1.0-1.el7.x86_64                                            13/13
  Verifying  : infiniband-diags-2.1.0-1.el7.x86_64                                             1/13
  Verifying  : hwloc-devel-1.11.8-4.el7.x86_64                                                 2/13
  Verifying  : man2html-1.6-13.g.el7.x86_64                                                    3/13
  Verifying  : man2html-core-1.6-13.g.el7.x86_64                                               4/13
  Verifying  : rdma-core-devel-22.4-2.el7_8.x86_64                                             5/13
  Verifying  : lua-devel-5.1.4-15.el7.x86_64                                                   6/13
  Verifying  : rrdtool-devel-1.4.8-9.el7.x86_64                                                7/13
  Verifying  : pam-devel-1.1.8-23.el7.x86_64                                                   8/13
  Verifying  : numactl-devel-2.0.12-5.el7.x86_64                                               9/13
  Verifying  : numactl-2.0.12-5.el7.x86_64                                                    10/13
  Verifying  : ibacm-22.4-2.el7_8.x86_64                                                      11/13
  Verifying  : readline-devel-6.2-11.el7.x86_64                                               12/13
  Verifying  : hwloc-1.11.8-4.el7.x86_64                                                      13/13

Installed:
  hwloc.x86_64 0:1.11.8-4.el7                        hwloc-devel.x86_64 0:1.11.8-4.el7
  infiniband-diags.x86_64 0:2.1.0-1.el7              lua-devel.x86_64 0:5.1.4-15.el7
  man2html.x86_64 0:1.6-13.g.el7                     numactl.x86_64 0:2.0.12-5.el7
  numactl-devel.x86_64 0:2.0.12-5.el7                pam-devel.x86_64 0:1.1.8-23.el7
  readline-devel.x86_64 0:6.2-11.el7                 rrdtool-devel.x86_64 0:1.4.8-9.el7

Dependency Installed:
  ibacm.x86_64 0:22.4-2.el7_8                       man2html-core.x86_64 0:1.6-13.g.el7
  rdma-core-devel.x86_64 0:22.4-2.el7_8

Complete!
```

### installed virtualenv for galaxy

**pip install virtualenv**

```
69:~$ pip install virtualenv
Defaulting to user installation because normal site-packages is not writeable
Collecting virtualenv
  Downloading virtualenv-20.0.23-py2.py3-none-any.whl (4.7 MB)
     |████████████████████████████████| 4.7 MB 2.5 MB/s
Collecting distlib<1,>=0.3.0
  Downloading distlib-0.3.0.zip (571 kB)
     |████████████████████████████████| 571 kB 11.5 MB/s
Collecting appdirs<2,>=1.4.3
  Downloading appdirs-1.4.4-py2.py3-none-any.whl (9.6 kB)
Requirement already satisfied: six<2,>=1.9.0 in /media/work/soft/anaconda3/lib/python3.7/site-packages (from virtualenv) (1.15.0)
Collecting filelock<4,>=3.0.0
  Downloading filelock-3.0.12-py3-none-any.whl (7.6 kB)
Collecting importlib-metadata<2,>=0.12; python_version < "3.8"
  Downloading importlib_metadata-1.6.1-py2.py3-none-any.whl (31 kB)
Collecting zipp>=0.5
  Downloading zipp-3.1.0-py3-none-any.whl (4.9 kB)
Building wheels for collected packages: distlib
  Building wheel for distlib (setup.py) ... done
  Created wheel for distlib: filename=distlib-0.3.0-py3-none-any.whl size=340427 sha256=62f81d71c09d7fcd0eb395ad23610a7636f3592fe4c144bba1ed36633cee716b
  Stored in directory: /opt/nimda/.cache/pip/wheels/a2/19/da/a15d4e2bedf3062c739b190d5cb5b7b2ecfbccb6b0d93c861b
Successfully built distlib
Installing collected packages: distlib, appdirs, filelock, zipp, importlib-metadata, virtualenv
Successfully installed appdirs-1.4.4 distlib-0.3.0 filelock-3.0.12 importlib-metadata-1.6.1 virtualenv-20.0.23 zipp-3.1.0

```
### installed sqlite-devel.x86_64 to raulPC for galaxy

Good:

**yum install sqlite-devel.x86_64**

```
69:~$ yum install sqlite-devel.x86_64
Loaded plugins: fastestmirror, langpacks
Loading mirror speeds from cached hostfile
epel/x86_64/metalink                                                         |  13 kB  00:00:00
epel-debuginfo/x86_64/metalink                                               |  13 kB  00:00:00
epel-source/x86_64/metalink                                                  |  12 kB  00:00:00
 * base: linux.cc.lehigh.edu
 * epel: mirror.csis.ysu.edu
 * epel-debuginfo: d2lzkl7pfhq30w.cloudfront.net
 * epel-source: d2lzkl7pfhq30w.cloudfront.net
 * extras: mirror.facebook.net
 * updates: mirror.umd.edu
adobe-linux-i386                                                             | 2.9 kB  00:00:00
adobe-linux-x86_64                                                           | 2.9 kB  00:00:00
base                                                                         | 3.6 kB  00:00:00
docker-ce-edge                                                               | 3.5 kB  00:00:00
docker-ce-stable                                                             | 3.5 kB  00:00:00
epel                                                                         | 5.4 kB  00:00:00
epel-debuginfo                                                               | 3.0 kB  00:00:00
epel-source                                                                  | 4.1 kB  00:00:00
extras                                                                       | 2.9 kB  00:00:00
google-chrome                                                                | 1.3 kB  00:00:00
runner_gitlab-runner/x86_64/signature                                        |  862 B  00:00:00
runner_gitlab-runner/x86_64/signature                                        | 1.0 kB  00:00:00 !!!
runner_gitlab-runner-source/signature                                        |  862 B  00:00:00
runner_gitlab-runner-source/signature                                        |  951 B  00:00:00 !!!
updates                                                                      | 2.9 kB  00:00:00
(1/5): epel-debuginfo/x86_64/primary_db                                      | 805 kB  00:00:00
(2/5): epel-source/x86_64/updateinfo                                         | 1.0 MB  00:00:00
(3/5): epel/x86_64/updateinfo                                                | 1.0 MB  00:00:00
(4/5): epel-source/x86_64/primary_db                                         | 2.4 MB  00:00:02
(5/5): epel/x86_64/primary_db                                                | 6.8 MB  00:00:03
Resolving Dependencies
--> Running transaction check
---> Package sqlite-devel.x86_64 0:3.7.17-8.el7_7.1 will be installed
--> Finished Dependency Resolution

Dependencies Resolved

====================================================================================================
 Package                  Arch               Version                         Repository        Size
====================================================================================================
Installing:
 sqlite-devel             x86_64             3.7.17-8.el7_7.1                base             104 k

Transaction Summary
====================================================================================================
Install  1 Package

Total download size: 104 k
Installed size: 366 k
Is this ok [y/d/N]: y
Downloading packages:
sqlite-devel-3.7.17-8.el7_7.1.x86_64.rpm                                     | 104 kB  00:00:00
Running transaction check
Running transaction test
Transaction test succeeded
Running transaction
  Installing : sqlite-devel-3.7.17-8.el7_7.1.x86_64                                             1/1
  Verifying  : sqlite-devel-3.7.17-8.el7_7.1.x86_64                                             1/1

Installed:
  sqlite-devel.x86_64 0:3.7.17-8.el7_7.1

Complete!
```

### updated raulPC anaconda3 with conda update conda

Good so far:

```
69:~$ /soft/anaconda3/bin/conda update conda
Solving environment: done

## Package Plan ##

  environment location: /soft/anaconda3

  added / updated specs:
    - conda



The following packages will be downloaded:

    package                    |            build
    ---------------------------|-----------------
    libffi-3.2.1               |       hd88cf55_4          43 KB
    idna-2.9                   |             py_1          56 KB
    six-1.15.0                 |             py_0          13 KB
    wheel-0.34.2               |           py37_0          49 KB
    cffi-1.14.0                |   py37h2e261b9_0         225 KB
    urllib3-1.25.8             |           py37_0         165 KB
    openssl-1.0.2u             |       h7b6447c_0         3.1 MB
    pyopenssl-19.0.0           |           py37_0          82 KB
    ncurses-6.1                |       hf484d3e_0         943 KB
    ca-certificates-2020.1.1   |                0         132 KB
    xz-5.2.5                   |       h7b6447c_0         438 KB
    setuptools-47.1.1          |           py37_0         647 KB
    pycparser-2.20             |             py_0          93 KB
    libgcc-ng-9.1.0            |       hdf63c60_0         8.1 MB
    zlib-1.2.11                |       h7b6447c_3         120 KB
    pycosat-0.6.3              |   py37h7b6447c_0         107 KB
    asn1crypto-1.3.0           |           py37_0         162 KB
    python-3.7.0               |       hc3d631a_0        31.7 MB
    pip-20.0.2                 |           py37_3         1.9 MB
    libedit-3.1.20181209       |       hc058e9b_0         188 KB
    conda-package-handling-1.6.1|   py37h7b6447c_0         886 KB
    conda-4.8.3                |           py37_0         3.0 MB
    readline-7.0               |       h7b6447c_5         392 KB
    certifi-2020.4.5.1         |           py37_0         159 KB
    yaml-0.1.7                 |       had09818_2          85 KB
    requests-2.23.0            |           py37_0          91 KB
    chardet-3.0.4              |        py37_1003         173 KB
    _libgcc_mutex-0.1          |             main           3 KB
    tqdm-4.46.0                |             py_0          60 KB
    sqlite-3.31.1              |       h7b6447c_0         2.0 MB
    cryptography-2.3.1         |   py37hc365091_0         585 KB
    ruamel_yaml-0.15.87        |   py37h7b6447c_0         271 KB
    pysocks-1.7.1              |           py37_0          30 KB
    tk-8.6.8                   |       hbc83047_0         3.1 MB
    ------------------------------------------------------------
                                           Total:        59.0 MB

The following NEW packages will be INSTALLED:

    _libgcc_mutex:          0.1-main
    conda-package-handling: 1.6.1-py37h7b6447c_0
    tqdm:                   4.46.0-py_0

The following packages will be UPDATED:

    asn1crypto:             0.24.0-py36_0          --> 1.3.0-py37_0
    ca-certificates:        2017.08.26-h1d4fec5_0  --> 2020.1.1-0
    certifi:                2018.1.18-py36_0       --> 2020.4.5.1-py37_0
    cffi:                   1.11.4-py36h9745a5d_0  --> 1.14.0-py37h2e261b9_0
    chardet:                3.0.4-py36h0f667ec_1   --> 3.0.4-py37_1003
    conda:                  4.4.11-py36_0          --> 4.8.3-py37_0
    cryptography:           2.1.4-py36hd09be54_0   --> 2.3.1-py37hc365091_0
    idna:                   2.6-py36h82fb2a8_1     --> 2.9-py_1
    libedit:                3.1-heed3624_0         --> 3.1.20181209-hc058e9b_0
    libffi:                 3.2.1-h4deb6c0_3       --> 3.2.1-hd88cf55_4
    libgcc-ng:              7.2.0-h7cc24e2_2       --> 9.1.0-hdf63c60_0
    ncurses:                6.0-h9df7e31_2         --> 6.1-hf484d3e_0
    openssl:                1.0.2n-hb7f436b_0      --> 1.0.2u-h7b6447c_0
    pip:                    9.0.1-py36h6c6f9ce_4   --> 20.0.2-py37_3
    pycosat:                0.6.3-py36h0a5515d_0   --> 0.6.3-py37h7b6447c_0
    pycparser:              2.18-py36hf9f622e_1    --> 2.20-py_0
    pyopenssl:              17.5.0-py36h20ba746_0  --> 19.0.0-py37_0
    pysocks:                1.6.7-py36hd97a5b1_1   --> 1.7.1-py37_0
    python:                 3.6.4-hc3d631a_1       --> 3.7.0-hc3d631a_0
    readline:               7.0-hac23ff0_3         --> 7.0-h7b6447c_5
    requests:               2.18.4-py36he2e5f8d_1  --> 2.23.0-py37_0
    ruamel_yaml:            0.15.35-py36h14c3975_1 --> 0.15.87-py37h7b6447c_0
    setuptools:             38.4.0-py36_0          --> 47.1.1-py37_0
    six:                    1.11.0-py36h372c433_1  --> 1.15.0-py_0
    sqlite:                 3.22.0-h1bed415_0      --> 3.31.1-h7b6447c_0
    tk:                     8.6.7-h5979e9b_1       --> 8.6.8-hbc83047_0
    urllib3:                1.22-py36hbe7ace6_0    --> 1.25.8-py37_0
    wheel:                  0.30.0-py36hfd4bba0_1  --> 0.34.2-py37_0
    xz:                     5.2.3-h2bcbf08_1       --> 5.2.5-h7b6447c_0
    yaml:                   0.1.7-h96e3832_1       --> 0.1.7-had09818_2
    zlib:                   1.2.11-hfbfcf68_1      --> 1.2.11-h7b6447c_3
Proceed ([y]/n)? y


Downloading and Extracting Packages
libffi 3.2.1: ############################################################################## | 100%
idna 2.9: ################################################################################## | 100%
six 1.15.0: ################################################################################ | 100%
wheel 0.34.2: ############################################################################## | 100%
cffi 1.14.0: ############################################################################### | 100%
urllib3 1.25.8: ############################################################################ | 100%
openssl 1.0.2u: ############################################################################ | 100%
pyopenssl 19.0.0: ########################################################################## | 100%
ncurses 6.1: ############################################################################### | 100%
ca-certificates 2020.1.1: ################################################################## | 100%
xz 5.2.5: ################################################################################## | 100%
setuptools 47.1.1: ######################################################################### | 100%
pycparser 2.20: ############################################################################ | 100%
libgcc-ng 9.1.0: ########################################################################### | 100%
zlib 1.2.11: ############################################################################### | 100%
pycosat 0.6.3: ############################################################################# | 100%
asn1crypto 1.3.0: ########################################################################## | 100%
python 3.7.0: ############################################################################## | 100%
pip 20.0.2: ################################################################################ | 100%
libedit 3.1.20181209: ###################################################################### | 100%
conda-package-handling 1.6.1: ############################################################## | 100%
conda 4.8.3: ############################################################################### | 100%
readline 7.0: ############################################################################## | 100%
ertifi 2020.4.5.1: ######################################################################## | 100%
yaml 0.1.7: ################################################################################ | 100%
requests 2.23.0: ########################################################################### | 100%
chardet 3.0.4: ############################################################################# | 100%
_libgcc_mutex 0.1: ######################################################################### | 100%
tqdm 4.46.0: ############################################################################### | 100%
sqlite 3.31.1: ############################################################################# | 100%
cryptography 2.3.1: ######################################################################## | 100%
ruamel_yaml 0.15.87: ####################################################################### | 100%
pysocks 1.7.1: ############################################################################# | 100%
tk 8.6.8: ################################################################################## | 100%
Preparing transaction: done
Verifying transaction: done
Executing transaction: done
```
### sent progress update on MethylIT and Galaxy

These are my words for now:

```
 Dear Galaxy MethylIT-ers,

I write to share a summary of progress and next steps with MethylIT on Galaxy.

We zoomed for 2 hours and I believe these things got established:

    Greg learned that at least 2 lab members talk and talk and talk and talk 😉
    Robersy has MethylIT improvement work to do--especially to git tag MethylIT.utils
    We decided it will be best to have a development galaxy instance running on a lab machine:
        MethylIT uses lots of CPU and RAM (and storage) and having our own powerful PC is best
        Greg will install and admin Galaxy on the lab machine and help us/me with the Galaxy admin that we need to know for our goals
        Greg will work on getting MethylIT usable on Galaxy, Robersy and I will try to help and try to keep up
    I am working on making one of the lightly-used office machines suitable and primarily for Galaxy (move data to Google Drive, make so Gregs PSU account can login)
    R package toolkits like MethylIT are not a great fit for Galaxy (too much user involvement is required with MethylIT):
        Robersy and I will learn more about Galaxy and how MethylIT can fit
        Greg will learn more about MethylIT analysis
        one goal is to make MethylIT usable by people, in Galaxy, without writing R, without Rstudio
    Greg noticed when Robersy expressed interest in connecting with Galaxy community members that can understand the math and theory of MethylIT
    It is understood that everyone is busy, has changing priorities..even so, we will try to make it happen, the sooner the better

Please share any concerns, additions, corrections.
```

### rstudio on galaxy and dockers on galaxy

Heaven has sent a new tutorial:

training.galaxyproject.org/topics/galaxy-ui/tutorials/rstudio/tutorial.html

..but rstudio on galaxy only works at usegalaxy.eu, which, right now, does
not accept my credentials that I use at usegalaxy.org.

This site talks about a specific docker that is for running galaxy:

galaxyproject.github.io/training-material/topics/admin/tutorials/galaxy-docker/slides.html

..but we want to make our own docker (with MethylIT power inside of it) and
have that docker be useable on galaxy.

That topic starts here:

galaxyproject.org/admin/tools/docker/

..but its a long road from there because mostly that stuff is for galaxy admins.

Here is how a galaxy admin would add a tool:

galaxyproject.org/admin/tools/add-tool-tutorial/


### galaxy bismark pipeline: wget;bismark_genome_preparation;fastq-dump;trim_galore;bismark;deduplicate_bismark;bismark_methylation_extractor

This summary was shared recently because we wanted to show the steps we run
before we start analyzing counts data with MethylIT:

```
cat /var/tmp/galaxyPipeline.txt

mkdir bismarkPipeline_PRJNA251597

cd bismarkPipeline_PRJNA251597

wget ftp://ftp.ensemblgenomes.org/pub/release-47/plants/fasta/arabidopsis_thaliana/dna/Arabidopsis_thaliana.TAIR10.dna.toplevel.fa.gz

gunzip Arabidopsis_thaliana.TAIR10.dna.toplevel.fa.gz

bismark_genome_preparation ./

mkdir SRR1333843

cd  SRR1333843

fastq-dump -v SRR1333843

trim_galore --gzip --phred33 --fastqc --fastqc_args '-t 8' SRR1333843.fastq

bismark --bam --multicore 4 --bowtie2 -p 2 --phred33-quals --genome_folder ../ SRR1333843_trimmed.fq.gz

deduplicate_bismark -s --bam SRR1333843_trimmed_bismark_bt2.bam

bismark_methylation_extractor --CX_context --bedGraph --cytosine_report --ample_memory --multicore 4 --genome_folder ../ --report SRR1333843_trimmed_bismark_bt2.deduplicated.bam

```

### CandiMeth on galaxy

We got tipped off to try **CandiMeth** which cannot be as good as its name.

This is actually from mail last Saturday 7/11:

```

I’m not sure if you’re interested in this https://github.com/sjthursby/CandiMeth (Candidate Gene Methylation Quantification in Galaxy), but I’ve installed the workflow and test datasets for running it described in Appendix 2 of this Guide User Guide: A complete handbook with step-by-step instructions for using CandiMeth into the Galaxy/MethylIT instance.

The workflow is available in the Shared Data -> Workflows menu selection...


…and I’ve shared a History containing the test datasets fro running the workflow - click Shared Data -> Histories option in the top menu.

I thought the might be a good way to lean some Galaxy features.  Let me know if this sounds interesting and we can walk through it at some point.

```

### shared galaxy tips advocating save, load and RData for persisting galaxy MethylIT steps

These sequence occurred during galaxy development:

```
This is very helpful.  I thought "secret sauce data" may potentially have been lost in the persistence layers, so thanks for confirming.  These MethylIT tools have been my introduction to GRange objects and some of the other Bioconductor stuff.

So it seems that I should be using save() and load(), and persisting the outputs of each step as RData files.  It is trivial to switch to this from my current approach of converting between GRange and data frame objects.

So it is likely that most of these MethylIT tools for Galaxy will accept and produce RData files.  I assume this is not a concern, but please let me know if it is.

I’ll let you know if this switch resolves the problem.
```
..after:
```

I share some initial ideas that come to mind below.  I will try to share more helpful information after looking closer at the error and information you share.


Firstly I would guess that the error you share:


'subscript contains out-of-bounds indices'

..probably comes from function MethylIT::uniqueGRfilterByCov.

Secondly I will blather about object classes for a moment.  GRanges objects, like many in R, have lots of secret sauce on them that make for lots of trouble.  A most famous problem for GRanges is the concept of seqnames/seqlevels.  When we make a GRanges object, "GR" lets call it, from genomic data, it will have the seqnames for every chromosome found in the data.  If its human but your data has zero lines on the Y chromosome, for example, then seqnames(GR) will return 1-22,X without Y.  If you then try to add data on the Y chromosome to object GR, then it will give you an error because Y is not in the seqnames(GR).  To fix, we would need to call seqlevels(GR) and add Y to the list of permissible chromosomes.  Only then would we be able to add the Y data to the GR object.  This type of secret-sauce problem/feature is all throughout bioconductor and generally means that you need to use tools designed to work with bioconductor objects.  An R data.frame does not have any location to store the seqlevels information and so when makeGRangesFromDataFrame recreates the GRanges, there is a chance it will be resurrected with a different seqlevels than the original GRanges object had.  Function makeGRangesFromDataFrame is from bioconductor and if you read the documentation, it surely has the capacity to reanimate complicated GRanges object but it would need to be fed more than just the data.frame.

This is a long example I give about GRanges but this sort of difficulty is all through R and bioconductor.

Every programming language has a way to deal with saving/reanimating: java objects can be "Serializable", python has pickle.  In R there might be several but "save()" and "load()" are the safest.  Whenever you see a file names XYZ.RData, it was almost certainly made with R function "save" and can be reanimated in R with "load()".  All of the secret sauce can be preserved with save/load.

I cannot yet say that your operations around "dataset_181.dat" wont work but I do think that avoiding save() and load() and using things like makeGRangesFromDataFrame is asking for trouble.

In MethylIT there will be more trouble because objects made with MethylIT::estimateDivergence () have a class named "InfDiv".  InfDiv objects are really, under the hood, a list of GRanges objects but if you want to deal with those GRanges objects then you have to do pesky R class things which is not fun.

A test you might try with "ref" and "LR" would be like this:

attributes(originalGR)

..and then compare that output with the output you get after reanimating the objects.

attributes(reanimatedGR)

If you see a difference, then you might be able to call seqlevels() or attributes() on the reanimated object to make it right again.
```
..after
```

I know there’s been some silence from my end, but I’ve been making good progress.  I’m still basing everything on this article https://genomaths.github.io/methylit/articles/cancer_example.html.

I’ve got the first 3 of the following 4 MethylIT tools working.



Unfortunately, I’ve run into a problem with the 4th tool - Estimate Divergence.

I’ve logged the values for the command line parameters here, including the dimensions of each of the Grange objects, the Ref object and the the list of 3 Grange objects in LR.

args:
 list(bayesian = "yes", col1 = 1, col2 = 2, high_coverage = 300, input_indiv_dir = "input_indiv_dir", mcov1 = 5, mmeth1 = 4, min_sitecov = 4, mum1 = 0, num_cores = 4, output = "/home/galaxies/mackenzie/jwd/000/176/outputs/galaxy_dataset_65ef9c77-680b-4d3c-a1e5-c87e114ff581.dat", percentile = 0.9999, ref = "/home/galaxies/mackenzie/galaxy/database/files/000/dataset_181.dat", help = FALSE), character(0)

ref: dim(df):  1560637 6

I convert the above ref data frame to a Grange object:

# Convert the data frame to a GRange.
ref <- makeGRangesFromDataFrame(df);


LR:  input_indiv_files:  input_indiv_dir/Breast_cancer.csv, input_indiv_dir/Breast_metastasis.csv, input_indiv_dir/Breast_normal.csv
num_input_indiv_files:  3
i:  1
indiv: dim(df):  803708 6
i:  2
indiv: dim(df):  803708 6
i:  3
indiv: dim(df):  803708 6

I convert each of the above individualizing data frames to Grange objects:
# Convert data frames to GRanges.
granges_list <- list();
for (i in 1:num_input_indiv_files) {
    grange <- makeGRangesFromDataFrame(df_list[[i]]);
    granges_list[[i]] <- grange;
}

Here are the rest of the parameter values for the estimateDivergence call:

min_coverage:  5

min_meth:  4

minu_meth:  0

bayesian:  TRUE

columns:  1, 2

min_coverage:  5

min_meth:  4

min_umeth:  0

opt$min_sitecov:  4

opt$high_coverage:  300

percentile:  1.000

jd:  FALSE

opt$num_cores:  4

meth_level:  FALSE

opt$logbase:


Here is the estimateDivergence call:

# Compute the information divergences of methylation levels.
inf_div_obj <- estimateDivergence(ref,
                                  granges_list,
                                  bayesian=bayesian,
                                  columns=columns,
                                  min.coverage=min_coverage,
                                  min.meth=min_meth,
                                  min.umeth=min_umeth,
                                  min.sitecov=opt$min_sitecov,
                                  high.coverage=opt$high_coverage,
                                  percentile=percentile,
                                  jd=jd,
                                  num.cores=opt$num_cores,
                                  tasks=0L,
                                  meth.level=meth_level,
                                  logbase=opt$logbase,
                                  verbose=TRUE);



The above call throws this exception.

Error: subscript contains out-of-bounds indices
Execution halted


I’m hoping you can help me narrow down what could be causing this.  I’m persisting the output of each tool, so I’m converting Grange objects to data frames for persisting using this call...

# Convert the GRange to a data frame for persisting.
df <- annoGR2DF(unique_grange);

…and then converting data frames read in from files to Grange objects using grange <- makeGRangesFromDataFrame(df) as shown in the code above.

So I’m wondering if these conversions between Grange objects and data frame objects are losing some data, and perhaps this is the cause of the above exception.

But I’m just not sure….

Thanks in advance for any help!
```






### met with galaxy collaborator regarding MethylIT on Galaxy

Things look good and we saw:

* galaxy powerpoint presentation
* galaxy MethylIT walkthrough
* galaxy workflows
    * cancer_example as a workflow, rerunnable
    * cancer_example as a **shared** workflow, editable
    * an editable workflow was discouraged because it means other editors can mysteriously break it
* galaxy PSU cluster planning
    * potential collaborators include Claude D, Ross H, Keith ? from Hershey, ICDS, others??
    * full time sysadmin needed for a big PSU shared galaxy
### started galaxy MethylIT Get GEO supplemental file and MethylIT: Convert Read counts

In PC34 galaxy, we try to make the ESC GEO files.  We already have this
in there but we uploaded it long ago and the thing we have in our history
does not appear in the list of things we can use when calling the MethylIT
tool **pool from GRanges list** and so we are uploading it again.  To do so,
we went to the tool named **Get GEO supplemental file** and pasted in the
three GEO numbers, exactly this string of bytes:

**GSM2041690,GSM2041691,GSM2041692**

..and clicked to execute.  After doing so, we see yellow and eventually green
 history boxes, 51 and 52. Item 52 says this inside the "process log" box:
```
*** Downloading files ...
https://ftp.ncbi.nlm.nih.gov/geo/samples/GSM2041nnn/GSM2041690/suppl/
OK
trying URL 'https://ftp.ncbi.nlm.nih.gov/geo/samples/GSM2041nnn/GSM2041690/suppl//GSM2041690_WGBS_UCLA1_Primed_rep1_CGmethratio.tab.gz'
Content type 'application/x-gzip' length 172007260 bytes (164.0 MB)
```
..and the middle green pane said this after we clicked to execute:
```
Executed MethylIT: Get GEO supplemental file and successfully added 1 job to the queue.

It produces this output:

52: MethylIT: Get GEO supplemental file (process log) on
You can check the status of queued jobs and view the resulting data by refreshing the History panel. When the job has been run the status will change from 'running' to 'finished' if completed successfully or 'error' if problems were encountered.
```
..after that we want to readCountsFromGRangesList, and so we look at the files:
```
head Desktop/cancer_example/GSM2041690_WGBS_UCLA1_Primed_rep1_CGmethratio.tab
chr     pos     strand  ccount  ctcount
chr10   60089   +       1       2
chr10   60090   -       2       2
chr10   60109   +       1       2
chr10   60110   -       1       2
chr10   60140   +       2       3
chr10   60141   -       0       1
chr10   60142   +       3       3
chr10   60143   -       0       1
chr10   60163   +       2       2
```
..and so we will need to fill out the galaxy form as before and as described
in this news where we have to choose column numbers and the kind of data that
will be in there.

This tool is called **MethylIT: Convert Read counts**.

After filling out the form with 5 columns as shown above, we click to execute
and get two yellow history boxes and this green box in the middle pane:
```
Executed MethylIT: Convert Read counts and successfully added 1 job to the queue.
The tool uses this input:

51: MethylIT: Get GEO supplemental file
It produces this output:

57: MethylIT: Convert Read counts (process log) on data 55, data 54, and data 53
You can check the status of queued jobs and view the resulting data by refreshing the History panel. When the job has been run the status will change from 'running' to 'finished' if completed successfully or 'error' if problems were encountered.
```

### galaxy testing failed: MethylIT: pool from GRanges list

The only lame thing here is that I only see item 46 that we just made which
has the cancer data--that is the only input item I can choose.  I would prefer
to also see the ESC data which is green in my history and represents the
output of the readCounts Galaxy tool for ESC files..but its not there to be
chosen.

In any case, this is working in green but the two history items 49 and 50 both
turned red failure after not too long (the error message in the red history box
reads: **error An error occurred with this dataset**), but here is the green part
we see after hitting to execute::

```
Executed MethylIT: pool from GRanges list and successfully added 1 job to the queue.

The tool uses this input:

46: MethylIT: Convert Read counts on data 45, data 44, and data 43
It produces 2 outputs:

49: MethylIT: pool from GRanges list (process log) on data 48
50: MethylIT: pool from GRanges list on data 48
You can check the status of queued jobs and view the resulting data by refreshing the History panel. When the job has been run the status will change from 'running' to 'finished' if completed successfully or 'error' if problems were encountered.
```

### galaxy testing started: MethylIT: Convert Read counts

The job we just ran to produce item 41 was used to start a job called:
**MethylIT: Convert Read counts** in galaxy and we got two new yellow history
items 46 and 47 in the right column and this green output in the main window:

```
Executed MethylIT: Convert Read counts and successfully added 1 job to the queue.

The tool uses this input:

41: MethylIT: Get GEO supplemental file
It produces this output:

47: MethylIT: Convert Read counts (process log) on data 45, data 44, and data 43
You can check the status of queued jobs and view the resulting data by refreshing the History panel. When the job has been run the status will change from 'running' to 'finished' if completed successfully or 'error' if problems were encountered.
```

Before doing that we checked the files to see which columns were which and we see
this file format:
```
head ~/Desktop/cancer_example/GSM1279513_CpGcontext.468LN.txt
1       10470   37      6
1       10472   39      3
```
..and so in the tool we clicked to **insert column** three times
so that we have things for:

* chromosomes (this default is already there) 1
* start 2
* methylates cytosine 3
* non-methylates cytosine 4

We chose those from this list in the galaxy tool:
```
chromosomes
start
end
strand
fraction
methylation percentage
methylates cytosine
non-methylates cytosine
coverage
methylation context
```
This is kind of a drag for these reasons:

* the column names, like **non-methylates cytosine** do not match MethylIT
* we need to actually examine the GEO (or whatever) data file to see what kind of data is in which column

### galaxy testing success: MethylIT: Get GEO supplemental file

After going to here:
http://e1-052734.science.psu.edu:8080/
..we do not go to **Get Data** in the left column of the galaxy page.
Instead we go to **MethylIT** in the left column of the galaxy page and
executed something called **MethylIT: Get GEO supplemental file** which
instructed us to enter GEO numbers.  We entered exactly this:

**GSM1279517,GSM1279514,GSM1279513**

..without quotes and got this green in the window and also a new yellow item
in our history on the right side column of the galaxy page:

```

Executed MethylIT: Get GEO supplemental file and successfully added 1 job to the queue.

It produces this output:

42: MethylIT: Get GEO supplemental file (process log) on
You can check the status of queued jobs and view the resulting data by refreshing the History panel. When the job has been run the status will change from 'running' to 'finished' if completed successfully or 'error' if problems were encountered.
```

### galaxy machine dead, NFS server problem suspected

Same as before we get:

* good ping
* ssh connected but no request for password

Newly reported from office near actual machine:

* wget **WORKS**
* firefox works

```
bash-4.2$ ping -c 3 e1-052734
PING E1-052734.science.PSU.EDU (128.118.84.68) 56(84) bytes of data.
64 bytes from E1-052734.science.psu.edu (128.118.84.68): icmp_seq=1 ttl=64 time=1.26 ms
64 bytes from E1-052734.science.psu.edu (128.118.84.68): icmp_seq=2 ttl=64 time=0.299 ms
64 bytes from E1-052734.science.psu.edu (128.118.84.68): icmp_seq=3 ttl=64 time=0.152 ms

--- E1-052734.science.PSU.EDU ping statistics ---
3 packets transmitted, 3 received, 0% packet loss, time 2001ms
rtt min/avg/max/mdev = 0.152/0.573/1.268/0.495 ms
```

Here we see very verbose ssh connection:
```
ssh -vv e1-052734
OpenSSH_7.4p1, OpenSSL 1.0.2k-fips  26 Jan 2017
debug1: Reading configuration data /home/twm118/.ssh/config
debug1: Reading configuration data /etc/ssh/ssh_config
debug1: /etc/ssh/ssh_config line 58: Applying options for *
debug2: resolving "e1-052734" port 22
debug2: ssh_connect_direct: needpriv 0
debug1: Connecting to e1-052734 [128.118.84.68] port 22.
debug1: Connection established.
debug1: key_load_public: No such file or directory
debug1: identity file /home/twm118/.ssh/id_rsa type -1
debug1: key_load_public: No such file or directory
debug1: identity file /home/twm118/.ssh/id_rsa-cert type -1
debug1: key_load_public: No such file or directory
debug1: identity file /home/twm118/.ssh/id_dsa type -1
debug1: key_load_public: No such file or directory
debug1: identity file /home/twm118/.ssh/id_dsa-cert type -1
debug1: key_load_public: No such file or directory
debug1: identity file /home/twm118/.ssh/id_ecdsa type -1
debug1: key_load_public: No such file or directory
debug1: identity file /home/twm118/.ssh/id_ecdsa-cert type -1
debug1: identity file /home/twm118/.ssh/id_ed25519 type 4
debug1: key_load_public: No such file or directory
debug1: identity file /home/twm118/.ssh/id_ed25519-cert type -1
debug1: Enabling compatibility mode for protocol 2.0
debug1: Local version string SSH-2.0-OpenSSH_7.4
debug1: Remote protocol version 2.0, remote software version OpenSSH_7.4debug1: match: OpenSSH_7.4 pat OpenSSH* compat 0x04000000
debug2: fd 4 setting O_NONBLOCK
debug1: Authenticating to e1-052734:22 as 'twm118'
debug1: SSH2_MSG_KEXINIT sent
debug1: SSH2_MSG_KEXINIT received
debug2: local client KEXINIT proposal
debug2: KEX algorithms: curve25519-sha256,curve25519-sha256@libssh.org,ecdh-sha2-nistp256,ecdh-sha2-nistp384,ecdh-sha2-nistp521,diffie-hellman-group-exchange-sha256,diffie-hellman-group16-sha512,diffie-hellman-group18-sha512,diffie-hellman-group-exchange-sha1,diffie-hellman-group14-sha256,diffie-hellman-group14-sha1,diffie-hellman-group1-sha1,ext-info-c
debug2: host key algorithms: ecdsa-sha2-nistp256-cert-v01@openssh.com,ecdsa-sha2-nistp384-cert-v01@openssh.com,ecdsa-sha2-nistp521-cert-v01@openssh.com,ecdsa-sha2-nistp256,ecdsa-sha2-nistp384,ecdsa-sha2-nistp521,ssh-ed25519-cert-v01@openssh.com,ssh-rsa-cert-v01@openssh.com,ssh-dss-cert-v01@openssh.com,ssh-ed25519,rsa-sha2-512,rsa-sha2-256,ssh-rsa,ssh-dss
debug2: ciphers ctos: chacha20-poly1305@openssh.com,aes128-ctr,aes192-ctr,aes256-ctr,aes128-gcm@openssh.com,aes256-gcm@openssh.com,aes128-cbc,aes192-cbc,aes256-cbc
debug2: ciphers stoc: chacha20-poly1305@openssh.com,aes128-ctr,aes192-ctr,aes256-ctr,aes128-gcm@openssh.com,aes256-gcm@openssh.com,aes128-cbc,aes192-cbc,aes256-cbc
debug2: MACs ctos: umac-64-etm@openssh.com,umac-128-etm@openssh.com,hmac-sha2-256-etm@openssh.com,hmac-sha2-512-etm@openssh.com,hmac-sha1-etm@openssh.com,umac-64@openssh.com,umac-128@openssh.com,hmac-sha2-256,hmac-sha2-512,hmac-sha1
debug2: MACs stoc: umac-64-etm@openssh.com,umac-128-etm@openssh.com,hmac-sha2-256-etm@openssh.com,hmac-sha2-512-etm@openssh.com,hmac-sha1-etm@openssh.com,umac-64@openssh.com,umac-128@openssh.com,hmac-sha2-256,hmac-sha2-512,hmac-sha1
debug2: compression ctos: none,zlib@openssh.com,zlib
debug2: compression stoc: none,zlib@openssh.com,zlib
debug2: languages ctos:
debug2: languages stoc:
debug2: first_kex_follows 0
debug2: reserved 0
debug2: peer server KEXINIT proposal
debug2: KEX algorithms: curve25519-sha256,curve25519-sha256@libssh.org,ecdh-sha2-nistp256,ecdh-sha2-nistp384,ecdh-sha2-nistp521,diffie-hellman-group-exchange-sha256,diffie-hellman-group16-sha512,diffie-hellman-group18-sha512,diffie-hellman-group-exchange-sha1,diffie-hellman-group14-sha256,diffie-hellman-group14-sha1,diffie-hellman-group1-sha1
debug2: host key algorithms: ssh-rsa,rsa-sha2-512,rsa-sha2-256,ecdsa-sha2-nistp256,ssh-ed25519
debug2: ciphers ctos: chacha20-poly1305@openssh.com,aes128-ctr,aes192-ctr,aes256-ctr,aes128-gcm@openssh.com,aes256-gcm@openssh.com,aes128-cbc,aes192-cbc,aes256-cbc,blowfish-cbc,cast128-cbc,3des-cbc
debug2: ciphers stoc: chacha20-poly1305@openssh.com,aes128-ctr,aes192-ctr,aes256-ctr,aes128-gcm@openssh.com,aes256-gcm@openssh.com,aes128-cbc,aes192-cbc,aes256-cbc,blowfish-cbc,cast128-cbc,3des-cbc
debug2: MACs ctos: umac-64-etm@openssh.com,umac-128-etm@openssh.com,hmac-sha2-256-etm@openssh.com,hmac-sha2-512-etm@openssh.com,hmac-sha1-etm@openssh.com,umac-64@openssh.com,umac-128@openssh.com,hmac-sha2-256,hmac-sha2-512,hmac-sha1
debug2: MACs stoc: umac-64-etm@openssh.com,umac-128-etm@openssh.com,hmac-sha2-256-etm@openssh.com,hmac-sha2-512-etm@openssh.com,hmac-sha1-etm@openssh.com,umac-64@openssh.com,umac-128@openssh.com,hmac-sha2-256,hmac-sha2-512,hmac-sha1
debug2: compression ctos: none,zlib@openssh.com
debug2: compression stoc: none,zlib@openssh.com
debug2: languages ctos:
debug2: languages stoc:
debug2: first_kex_follows 0
debug2: reserved 0
debug1: kex: algorithm: curve25519-sha256
debug1: kex: host key algorithm: ecdsa-sha2-nistp256
debug1: kex: server->client cipher: chacha20-poly1305@openssh.com MAC: <implicit> compression: none
debug1: kex: client->server cipher: chacha20-poly1305@openssh.com MAC: <implicit> compression: none
debug1: kex: curve25519-sha256 need=64 dh_need=64
debug1: kex: curve25519-sha256 need=64 dh_need=64
debug1: expecting SSH2_MSG_KEX_ECDH_REPLY
debug1: Server host key: ecdsa-sha2-nistp256 SHA256:iP2IUpd6yYRJ8cWpdtMNC1IrejCwUFbEvXwMjpj9iGQ
debug1: Host 'e1-052734' is known and matches the ECDSA host key.
debug1: Found key in /home/twm118/.ssh/known_hosts:13
debug2: set_newkeys: mode 1
debug1: rekey after 134217728 blocks
debug1: SSH2_MSG_NEWKEYS sent
debug1: expecting SSH2_MSG_NEWKEYS
debug1: SSH2_MSG_NEWKEYS received
debug2: set_newkeys: mode 0
debug1: rekey after 134217728 blocks
debug2: key: /home/twm118/.ssh/id_rsa ((nil))
debug2: key: /home/twm118/.ssh/id_dsa ((nil))
debug2: key: /home/twm118/.ssh/id_ecdsa ((nil))
debug2: key: /home/twm118/.ssh/id_ed25519 (0x55cdddd840d0)
debug1: SSH2_MSG_EXT_INFO received
debug1: kex_input_ext_info: server-sig-algs=<rsa-sha2-256,rsa-sha2-512>
debug2: service_accept: ssh-userauth
debug1: SSH2_MSG_SERVICE_ACCEPT received
debug1: Authentications that can continue: publickey,gssapi-keyex,gssapi-with-mic,password
debug1: Next authentication method: gssapi-keyex
debug1: No valid Key exchange context
debug2: we did not send a packet, disable method
debug1: Next authentication method: gssapi-with-mic
debug1: Unspecified GSS failure.  Minor code may provide more information
Server krbtgt/SCIENCE.PSU.EDU@dce.psu.edu not found in Kerberos database

debug2: we sent a gssapi-with-mic packet, wait for reply
debug1: Authentications that can continue: publickey,gssapi-keyex,gssapi-with-mic,password
debug2: we did not send a packet, disable method
debug1: Next authentication method: publickey
debug1: Trying private key: /home/twm118/.ssh/id_rsa
debug1: Trying private key: /home/twm118/.ssh/id_dsa
debug1: Trying private key: /home/twm118/.ssh/id_ecdsa
debug1: Offering ED25519 public key: /home/twm118/.ssh/id_ed25519
debug2: we sent a publickey packet, wait for reply

```
Here we see wget working:
```
bash-4.2$ wget e1-052734:8080
--2020-08-07 05:51:07--  http://e1-052734:8080/
Resolving e1-052734 (e1-052734)... 128.118.84.68
Connecting to e1-052734 (e1-052734)|128.118.84.68|:8080... connected.
HTTP request sent, awaiting response... 302 Found
Location: http://e1-052734:8080/root/login?redirect=%2F [following]
--2020-08-07 05:51:07--  http://e1-052734:8080/root/login?redirect=%2F
Connecting to e1-052734 (e1-052734)|128.118.84.68|:8080... connected.
HTTP request sent, awaiting response... 200 OK
Length: unspecified [text/html]
Saving to: ‘index.html’

    [ <=>                                                                                                                                              ] 4,585       --.-K/s   in 0s

2020-08-07 05:51:07 (192 MB/s) - ‘index.html’ saved [4585]
```
..and we can also login to the machine with firefox and see my data/history/etc.

Here we see login without public key which does ask for password and
then it looks like it fails, inexplicably, 3 times, and then it works
for user without public key::
```
-bash-4.2$ ssh -o PreferredAuthentications=password -o PubkeyAuthentication=no e1-052734

ssh: connect to host e1-052734 port 22: Connection timed out
```
..after going back to my **hung on trying to list /home** terminal, I hit CTRL-C
to get my terminal back and that worked.   Then I was able to sudo reboot after
again I see an inability to list /home/:
```
[nimda@E1-052734 ~]$ ls /h^C
[nimda@E1-052734 ~]$ w
 06:15:16 up 46 days, 10:03,  1 user,  load average: 5.32, 5.28, 4.50
USER     TTY      FROM             LOGIN@   IDLE   JCPU   PCPU WHAT
nimda    pts/0    128.118.84.67    06:04    4.00s  0.05s  0.00s w
[nimda@E1-052734 ~]$ ls /home/
^C
[nimda@E1-052734 ~]$ sudo w
[sudo] password for nimda:
 06:15:29 up 46 days, 10:03,  1 user,  load average: 5.33, 5.29, 4.51
USER     TTY      FROM             LOGIN@   IDLE   JCPU   PCPU WHAT
nimda    pts/0    128.118.84.67    06:04    9.00s  0.09s  0.02s sshd: nimda [priv]
[nimda@E1-052734 ~]$ sudo reboot
Connection to e1-052734 closed by remote host.
Connection to e1-052734 closed.
```
The thing about being unable to list /home is that we can see in the **ssh -vv**
output that it is successfully reading my keys and so it is able to list things in
/home and even read files there, apparently, from the **ssh -vv** output and so
its very curious why there is a problem with running ls /home/.

The reboot took too long but eventually worked without trouble and the machine
rebooted successfully.

At the physical machine, the keyboard appeared to work because the CAPSLOCK key
responded with the light.  But there was nothing on the terminal screen which
we know works and was working because it lit up with the screen when we ran
**reboot** and then we saw the normal bootup screen and can login.

At this point it would appear that some kind of NFS locking problem occurred.

### galaxy reachout for update

Galaxy came up during the Friday lab meeting and so I reach out to our
Galaxy guy:

```
I reach out today about Galaxy.  I have been very busy and from what I can tell, Robersy is also too busy.  We are not ignoring you!

After our last zoom about MethylIT on galaxy, I made some notes that I summarize here:

MethylIT on galaxy creation effort:  You do not seem intimidated by this job--we do not run Galaxy and have not made a Galaxy tool and so it looks like magic to us.

MethylIT on galaxy maintenance effort:  Over 90% of programming, they say, is maintenance.  We maintain MethylIT and its lots of work.  My hope is that as long as we keep the interface of each MethylIT function, the API, stable, then maybe the maintenance costs on the Galaxy side of things will be low.

Architecturally, it looks like we have settled, for now, on roughly a "galaxy tool" per MethylIT function architecture.  This architecture is probably the obvious one and maybe the best one.  Even so, we should review any options that we have from the two big perspectives: software creation/maintenance and the Galaxy/MethylIT user perspective.  In particular, we might look for places where we can combine multiple function calls into one galaxy tool.

Our MethylIT Galaxy dev/test server looks to be running okay.  I logged in this morning and my history looks mostly green and I am using 15Gigs of data.  I will try to get on and do more testing this week.

We can go over these and other topics on our next zoom.  Until then, stay safe from the you know what.
```


### galaxy MethylIT testing report

I started to try testing MethylIT on galaxy again today.
Because I never got readCounts2GrangesList to actually work, I
tried again.  Greg reported that it has been improved.  The
interface is difficult because I am not sure if I must specify
the columns that are in use.  Even if I am expected to do that,
it only gives **hard coded and incorrect column names**.  For
example we see **chromosomes** where the MethylIT API would
refer to **seqnames**.  Some of the other columns appear to have
names that are not anywhere in MethylIT.  Apparently it can
still be driven successfully because Greg is reporting good
progress and **working tools** and he is sharing screen shots
that prove it.  I did my best to drive readCounts2GrangesList
again today on Galaxy and it is running right now at 1606PM.
I got a green report of **successfully submitted** and I got
two new, currently yellow, history items where **yellow** means
**currently executing**.


### galaxy MethylIT progress report

We got some updates about MethylIT on galaxy, shared here:

```
Tom, thanks so much for your timely note!  I was planning to send a status update later today or tomorrow.

Although you have not heard much from me recently, I’ve been working behind the scenes, expanding the MethylIT tool set for Galaxy.,  I was pulled away on other projects (I’ve been involved in the new tissue Phenomics efforts under Dr. Keith Cheng) a few weeks ago, but I was able to return to MethylIT this past week.

I’ve not got the following MethylIT tools basically working in Galaxy:

- methylit_get_geo_supp_files
- methylit_read_counts_2_granges_list
- methylit_pool_from_granges_list
- methylit_estimate_divergence
- methylit_unique_granges

I also have the foundation for the following tools:

-methylit_histogram
-methylit_boxplot

I’ll be enhancing each tool today to optionally produce a processing log as output.  Since most tools now produce RData files on output which are difficult to inspect, we’ll need a way to easily track outputs at least during development, and this process log output will fulfill this need.

Most of these tools are not yet available on http://e1-052734.science.psu.edu:8080, but I’ll install them there when they are functional.  I’m building the initial environment on my Linux server.

I’ll keep you informed as I make progress, and let you know when the first MethylIT workflow is available for you to check out.  Until I have this, you probably shouldn’t plan to spend time working with the current tools on http://e1-052734.science.psu.edu:8080 since they have already been significantly enhanced.
```

..and again more, but the email report has some pretty pictures that are not here::

```
I’ve got the following tools all working in Galaxy / MethylIT

Each tool optionally produces a process log to ensure functional correctness.

I’ve executed the steps from the steps from the Cancer article here https://genomaths.github.io/methylit/articles/cancer_example.html up through the histogram and box-lot visualization tools and built an example workflow which can be execute with a single mouse click.

The visualization tools produce the expected results.

I’ll continue adding to the tool set.

Please feel free to try these out, and let me know if you have any questions.
```

### R problem: BiocParallel: Error in mcexit(0L) : ignoring SIGPIPE signal

We got this report today:
```
I am getting a weird thing from parallel computation:

“Error in mcexit(0L) : ignoring SIGPIPE signal”

It did not happened before.  I have checked online and it looks an old “ghost” issue which appears from time to time.

Could you please check whether it comes from a recent updating in some CentOS library?
```
..and after researching sent these two responses:

```

I have not changed anything recently.  I looked around and tried to see if anything changed recently that was not changed by me.  Nothing seems to be different as far as R goes.

I also notice that you are not getting killed for memory exhaustion--and so its NOT a memory problem that we sometimes see causing parallel R problems.

It would be helpful to know more things:
Can you share code and data that I can use to look at and run?
Does it always fail every time..or does it work but only sometimes?
Does the code fail also when running num.cores=1 or otherwise trying to use only one core?
I will keep looking over old notes because we have seen lots of R parallel problems in the past.  My recall is that it they were usually related to memory exhaustion but I think I have ruled that out so its something else.
```
..and later:
```
I checked out Titan a bit more today and everything seems to be ok.

We should keep in mind that a ton of things changed on June 26th because Titan moved up a version of Bioconductor.  That change broke a number of other things that needed other upgrading to happen..these were mostly things on a per-user basis--they needed to upgrade Bioconductor version themselves or point to the system R libraries and upgrade a few libraries.

We can see every package that changed by looking in /usr/lib64/R/library/ where we can see that over 190 packages were changed on June 26th, including BiocParallel.

My notes show that memory exhaustion can cause that error but also other things like an empty matrix can do it.  These can happen with sparse data.  I would see these when, for example, things were going well on every chromosome but then, all of a sudden, on chr22, I would get BiocParallel errors--same code but different data, sparser, chr22 data.  It seemed to be that the sparse data would get an incomplete matrix (or something) somewhere in some function but the only report R would get is the uninformative BiocParallel error.  My recall is that BiocParallel and R do not actually report what happened, only that some thread of execution did not come back and so we see mc.exit() or something that does not tell the actual problem.  I interpret these errors to mean "BiocParallel dispatched some work to be done on another thread but that thread did not finish properly".

If you continue to get this problem and its reproducible, then please get me the code and data and I will try to debug.
```
### galaxy progess, new workflow, not using RData as much, one click cancer example execution

These URLs now work and contain usable data:

```
http://memory.methylit.org/soybean_100k/soybean_G13A__CG_chr1thru20_100k.txt
http://memory.methylit.org/soybean_100k/soybean_G14A__CG_chr1thru20_100k.txt
http://memory.methylit.org/soybean_100k/soybean_G15A__CG_chr1thru20_100k.txt
http://memory.methylit.org/soybean_100k/soybean_G16A__CG_chr1thru20_100k.txt
http://memory.methylit.org/soybean_100k/soybean_G17A__CG_chr1thru20_100k.txt
http://memory.methylit.org/soybean_100k/soybean_G18A__CG_chr1thru20_100k.txt
http://memory.methylit.org/soybean_100k/soybean_G19A__CG_chr1thru20_100k.txt
http://memory.methylit.org/soybean_100k/soybean_G1A__CG_chr1thru20_100k.txt
http://memory.methylit.org/soybean_100k/soybean_G20A__CG_chr1thru20_100k.txt
http://memory.methylit.org/soybean_100k/soybean_G21A__CG_chr1thru20_100k.txt
http://memory.methylit.org/soybean_100k/soybean_G22A__CG_chr1thru20_100k.txt
http://memory.methylit.org/soybean_100k/soybean_G23A__CG_chr1thru20_100k.txt
http://memory.methylit.org/soybean_100k/soybean_G24A__CG_chr1thru20_100k.txt
http://memory.methylit.org/soybean_100k/soybean_G2A__CG_chr1thru20_100k.txt
http://memory.methylit.org/soybean_100k/soybean_G3A__CG_chr1thru20_100k.txt
http://memory.methylit.org/soybean_100k/soybean_G4A__CG_chr1thru20_100k.txt
http://memory.methylit.org/soybean_100k/soybean_G5A__CG_chr1thru20_100k.txt
http://memory.methylit.org/soybean_100k/soybean_G6A__CG_chr1thru20_100k.txt
```
..and CHG:
```
http://memory.methylit.org/soybean_100k/soybean_G15A__CHG_chr1thru20_100k.txt
http://memory.methylit.org/soybean_100k/soybean_G13A__CHG_chr1thru20_100k.txt
http://memory.methylit.org/soybean_100k/soybean_G14A__CHG_chr1thru20_100k.txt
http://memory.methylit.org/soybean_100k/soybean_G16A__CHG_chr1thru20_100k.txt
http://memory.methylit.org/soybean_100k/soybean_G17A__CHG_chr1thru20_100k.txt
http://memory.methylit.org/soybean_100k/soybean_G18A__CHG_chr1thru20_100k.txt
http://memory.methylit.org/soybean_100k/soybean_G19A__CHG_chr1thru20_100k.txt
http://memory.methylit.org/soybean_100k/soybean_G1A__CHG_chr1thru20_100k.txt
http://memory.methylit.org/soybean_100k/soybean_G20A__CHG_chr1thru20_100k.txt
http://memory.methylit.org/soybean_100k/soybean_G21A__CHG_chr1thru20_100k.txt
http://memory.methylit.org/soybean_100k/soybean_G22A__CHG_chr1thru20_100k.txt
http://memory.methylit.org/soybean_100k/soybean_G23A__CHG_chr1thru20_100k.txt
http://memory.methylit.org/soybean_100k/soybean_G24A__CHG_chr1thru20_100k.txt
http://memory.methylit.org/soybean_100k/soybean_G2A__CHG_chr1thru20_100k.txt
http://memory.methylit.org/soybean_100k/soybean_G3A__CHG_chr1thru20_100k.txt
http://memory.methylit.org/soybean_100k/soybean_G4A__CHG_chr1thru20_100k.txt
http://memory.methylit.org/soybean_100k/soybean_G5A__CHG_chr1thru20_100k.txt
http://memory.methylit.org/soybean_100k/soybean_G6A__CHG_chr1thru20_100k.txt
```
### graft data gzip creation to provide cov files for galaxy, several problems including pattern in ReadCounts and pattern in EstimateCutpoint

Recall that GEO has a bad BS-18 sample and so we will make them available on the
web ourselves.  But first we make them ourselves from the uncompressed files:

```
64 cov]$ ls -lh *.CX_report.txt|sed 's/.* //'|sed 's#\(.*\)#cat \1 |gzip > /data5/OLD_genomes/files/graft/cov/\1.gz#'
cat BS-10.CX_report.txt |gzip > /data5/OLD_genomes/files/graft/cov/BS-10.CX_report.txt.gz
cat BS-11.CX_report.txt |gzip > /data5/OLD_genomes/files/graft/cov/BS-11.CX_report.txt.gz
cat BS-12.CX_report.txt |gzip > /data5/OLD_genomes/files/graft/cov/BS-12.CX_report.txt.gz
cat BS-13.CX_report.txt |gzip > /data5/OLD_genomes/files/graft/cov/BS-13.CX_report.txt.gz
cat BS-14.CX_report.txt |gzip > /data5/OLD_genomes/files/graft/cov/BS-14.CX_report.txt.gz
cat BS-15.CX_report.txt |gzip > /data5/OLD_genomes/files/graft/cov/BS-15.CX_report.txt.gz
cat BS-16.CX_report.txt |gzip > /data5/OLD_genomes/files/graft/cov/BS-16.CX_report.txt.gz
cat BS-17.CX_report.txt |gzip > /data5/OLD_genomes/files/graft/cov/BS-17.CX_report.txt.gz
cat BS-18.CX_report.txt |gzip > /data5/OLD_genomes/files/graft/cov/BS-18.CX_report.txt.gz
cat BS-19.CX_report.txt |gzip > /data5/OLD_genomes/files/graft/cov/BS-19.CX_report.txt.gz
cat BS-1.CX_report.txt |gzip > /data5/OLD_genomes/files/graft/cov/BS-1.CX_report.txt.gz
cat BS-20.CX_report.txt |gzip > /data5/OLD_genomes/files/graft/cov/BS-20.CX_report.txt.gz
cat BS-21.CX_report.txt |gzip > /data5/OLD_genomes/files/graft/cov/BS-21.CX_report.txt.gz
cat BS-22.CX_report.txt |gzip > /data5/OLD_genomes/files/graft/cov/BS-22.CX_report.txt.gz
cat BS-23.CX_report.txt |gzip > /data5/OLD_genomes/files/graft/cov/BS-23.CX_report.txt.gz
cat BS-24.CX_report.txt |gzip > /data5/OLD_genomes/files/graft/cov/BS-24.CX_report.txt.gz
cat BS-25.CX_report.txt |gzip > /data5/OLD_genomes/files/graft/cov/BS-25.CX_report.txt.gz
cat BS-26.CX_report.txt |gzip > /data5/OLD_genomes/files/graft/cov/BS-26.CX_report.txt.gz
cat BS-27.CX_report.txt |gzip > /data5/OLD_genomes/files/graft/cov/BS-27.CX_report.txt.gz
cat BS-2.CX_report.txt |gzip > /data5/OLD_genomes/files/graft/cov/BS-2.CX_report.txt.gz
cat BS-3.CX_report.txt |gzip > /data5/OLD_genomes/files/graft/cov/BS-3.CX_report.txt.gz
cat BS-4.CX_report.txt |gzip > /data5/OLD_genomes/files/graft/cov/BS-4.CX_report.txt.gz
cat BS-5.CX_report.txt |gzip > /data5/OLD_genomes/files/graft/cov/BS-5.CX_report.txt.gz
cat BS-6.CX_report.txt |gzip > /data5/OLD_genomes/files/graft/cov/BS-6.CX_report.txt.gz
cat BS-7.CX_report.txt |gzip > /data5/OLD_genomes/files/graft/cov/BS-7.CX_report.txt.gz
cat BS-8.CX_report.txt |gzip > /data5/OLD_genomes/files/graft/cov/BS-8.CX_report.txt.gz
cat BS-9.CX_report.txt |gzip > /data5/OLD_genomes/files/graft/cov/BS-9.CX_report.txt.gz
cat W-3-1.cov.CX_report.txt |gzip > /data5/OLD_genomes/files/graft/cov/W-3-1.cov.CX_report.txt.gz
cat W-3-2.cov.CX_report.txt |gzip > /data5/OLD_genomes/files/graft/cov/W-3-2.cov.CX_report.txt.gz
cat W-3-3.cov.CX_report.txt |gzip > /data5/OLD_genomes/files/graft/cov/W-3-3.cov.CX_report.txt.gz
cat W-3-4.cov.CX_report.txt |gzip > /data5/OLD_genomes/files/graft/cov/W-3-4.cov.CX_report.txt.gz
cat W-3-5.cov.CX_report.txt |gzip > /data5/OLD_genomes/files/graft/cov/W-3-5.cov.CX_report.txt.gz

64 cov]$ ls -lh *.CX_report.txt|sed 's/.* //'|sed 's#\(.*\)#cat \1 |gzip > /data5/OLD_genomes/files/graft/cov/\1.gz#'|/bin/sh
```
..and now we have them and now we put them on the cloud:
```
64 cov]$ scp BS-13.CX_report.txt.gz BS-14.CX_report.txt.gz BS-15.CX_report.txt.gz BS-16.CX_report.txt.gz BS-17.CX_report.txt.gz BS-18.CX_report.txt.gz tm@li1077-179:/var/www/html/memory.methylit.org/graft/
BS-13.CX_report.txt.gz                                                                     100%  187MB  72.1MB/s   00:02
BS-14.CX_report.txt.gz                                                                     100%  187MB  78.6MB/s   00:02
BS-15.CX_report.txt.gz                                                                     100%  187MB  77.2MB/s   00:02
BS-16.CX_report.txt.gz                                                                     100%  185MB  77.6MB/s   00:02
BS-17.CX_report.txt.gz                                                                     100%  186MB  81.6MB/s   00:02
BS-18.CX_report.txt.gz                                                                     100%  186MB  74.0MB/s   00:02
```
..and now we load these URLs into galaxy:
```

```
..and after long wait we see the 6 files. 

Next we want to create a **control samples only** subset of that list,
so we go to tool:

* **Collections and Operations**
* **Extract Dataset from list**

..and we choose to:

* **Input List** 731 (the 6 item list we just uploaded)
* **How should a dataset be selected**: **Select by element identifier**
    * at this point we are unsure of what an **identifier** is, but we see in the actual uploaded item
    * ..that each file has a **Name** value that is equal to the URL where it came from, like this:
    * http://memory.methylit.org/graft/BS-16.CX_report.txt.gz
* **Element identifier**
    * here we are unsure because we want to provide a list of identifiers
    * but it seems to indicate that it wants one, not sure if a comma-separated-list-of-IDs will do??
    * ..but we try anyway with list shown below:
    * http://memory.methylit.org/graft/BS-16.CX_report.txt.gz,http://memory.methylit.org/graft/BS-17.CX_report.txt.gz,http://memory.methylit.org/graft/BS-18.CX_report.txt.gz
    * and, sadly, it blows up, right away, as shown below:

```
The server could not complete the request. Please contact the Galaxy Team if this error persists. Error executing tool: 'Dataset collection has no element_identifier with key http://memory.methylit.org/graft/BS-16.CX_report.txt.gz,http://memory.methylit.org/graft/BS-17.CX_report.txt.gz,http://memory.methylit.org/graft/BS-18.CX_report.txt.gz.'

{
    "history_id": "e12c12018c169d8d",
    "tool_id": "__EXTRACT_DATASET__",
    "tool_version": "1.0.0",
    "inputs": {
        "input": {
            "values": [
                {
                    "hid": 731,
                    "id": "82ccea6b5a5816db",
                    "name": "graft_CGCHGCHH_BS131415161718",
                    "src": "hdca",
                    "tags": []
                }
            ],
            "batch": false
        },
        "which|which_dataset": "by_identifier",
        "which|identifier": "http://memory.methylit.org/graft/BS-16.CX_report.txt.gz,http://memory.methylit.org/graft/BS-17.CX_report.txt.gz,http://memory.methylit.org/graft/BS-18.CX_report.txt.gz"
    }
}
```
..and so next we choose to try to use this same **Extract Dataset from a list** tool and
give it only one name at a time, which we do for items BS-16, BS-17 and BS-18 and it works
right away using those URLs as the name for each item. 

Then we use tool **Build List from one or more datasets** and we tell it, one by one, on the
form, to **Add dataset** for each of those three files and, right away, it looks like we have a
list of 3 items.  This looks very much like the original list of 6 items but the names in the
history are not URLs but are 0, 1 and 2.  Clicking to **edit attributes** does not let me alter
that 0,1,2 to become the URLs like we see in the original list of 6.

Next we see that **Filter and Sort**, **Filter data on any column using simple expressions** will
only apply to a single dataset, so we do not need our lists right now, and so we run again tool
named **Extract Dataset from a list** and get out BS-13, BS-14, BS-15 alone as single datasets.

Then, with 6 lonely files, we can run the tool named:
 **Filter and Sort**, **Filter data on any column using simple expressions** and run it once on
each dataset with this expression:

```
(c1==1 or c1==2 or c1==3 or c1==4 or c1==5) and c6=='CG'
```
..and we do so 6 times and we end up with one new history item for each file.  It would appear
that this operation would use space but that used space is not showing up in galaxy where we sit
at 57.58GB before and after these operations. 

This work all means that we actually should upload files one at a time, or have them prefiltered
before loading them into galaxy.

This all worked except we see that the filtering for item 740, BS-14, has 0 lines, not good but
it was run all the same as the others. ??

This job, filtering for 740, failed as job 743, inexplicably.  All of the other 5 worked.  Next we
ran that same job again but this time putting single quotes around the chromosomes:
```
(c1=='1' or c1=='2' or c1=='3' or c1=='4' or c1=='5') and c6=='CG'
```
..and that worked.  The other five worked without those single quotes.  And so we reran it again but
without the single-quotes and this time it failed again.  All of the history bar reports looke like
this one, for the **with quotes** job 748:
```
~5,900,000 lines
formattabulardatabase?
Filtering with (c1=='1' or c1=='2' or c1=='3' or c1=='4' or c1=='5') and c6=='CG' ,
kept 12.92% of 43080080 valid lines (43080080 total lines).
```
..and this one for the other five **without quotes** jobs:
```
~5,900,000 lines
formattabulardatabase?
Filtering with (c1==1 or c1==2 or c1==3 or c1==4 or c1==5) and c6=='CG' ,
kept 12.92% of 43080080 valid lines (43080080 total lines).
Skipped 220333 invalid line(s) starting at line #42859748: "Pt 3 - 0 2 CHH CAT"
```
..the **unexpectedly failing** job report looks like this:
```
Filtering with (c1==1 or c1==2 or c1==3 or c1==4 or c1==5) and c6=='CG' ,
kept 0.00% of 43080080 valid lines (43080080 total lines).
```
In any case, the good CG jobs are these:

* 742 BS-13
* 744 BS-15
* 745 BS-16
* 746 BS-17
* 747 BS-18
* 748 BS-14

..and we use them to make 2 lists:

* one for use as reference with 3 datasets BS16,17,18
* one for use as individuals with 6 datasets BS13,14,15,16,17,18

..much care needs to be taken here because names of samples can slip away..need to check and to know.

After we run **Read Counts to Granges** on both of our lists, then we make the reference,
and so next we run **pool from GRanges list** on the GRanges we pooled from the list of 3 controls.
Because we are using code from this file:
**misc/msh1_paper_R_code_data_20201127_Col0_on_msh1_4_Gen_1_vs_Col0_on_dcl234_msh1_reference_code.txt**
..we follow it and use **stat="sum"** when making the reference, even though that is bad.

Next we run **Estimate divergence** and we see several problems:

* we cannot seem to minimum read counts for every sample, we can do it for the first 2 samples?
    * not sure what is going on here
    * maybe we say it twice, as in:
        * once for the reference
        * once for the individuals
        * ..equivalent to saying, in R: **min.cov=c(12,4)
    * we cannot say **12,4** in the form because it is restricted to numeric characters
* we cannot seem to minimum methylated counts for every sample, we can do it for the first 2 samples?
    * same confusion as before
    * the code we are using says **min.meth=3**

We continue and run into another major problem at estimateCutpoint, where we see this error:
```
Rscript '/media/work/galaxy/galaxy/tools/methylome_analysis/methylit_estimate_cutpoint/methylit_estimate_cutpoint.R' --classifier1 'pca.qda' --column 'hdiv,bay.TV,wprob,pos' --control_names 'BS16,BS17,BS18' --div_col 9 --input '/data/galaxy/database/files/datasets/001/dataset_1271.dat' --clas_perf 'yes' --n_pc 4 --num_cores ${GALAXY_SLOTS:-4} --prop 0.6 --script_dir '/media/work/galaxy/galaxy/tools/methylome_analysis/methylit_estimate_cutpoint' --simple 'yes' --treatment_names 'BS13,BS14,BS15' --tv_col 8 --tv_cut 0.131 --output_cutpoints '/data/galaxy/jwd/000/472/outputs/galaxy_dataset_73835646-48a0-4716-9222-90739a8f4e06.dat' &>'/data/galaxy/jwd/000/472/outputs/galaxy_dataset_f76a1003-6fd5-4eb4-ae81-759e923c5096.dat';
```
..and we can notice that it changed the sample names from these entered values:

* ENTERED INTO FORM:
    * BS-13,BS-14,BS-15
    * BS-16,BS-17,BS-18
* SHOWN IN ERROR MESSAGE:
    * BS13,BS14,BS15
    * BS16,BS17,BS18

..adding single quotes around the sample names, like this: **'BS-13','BS-14','BS-15'** does not help
and we get the same error message in galaxy.

#### MethylIT: Get GEO supplemental file

We call it twice:

* once for the all individuals
* once for the samples used to make the reference

These exact texts go into tool form on galaxy:
```
GSM4618285,GSM4618286,GSM4618287,GSM4618288,GSM4618289,GSM4618290
```
..and then these exact texts go into tool form on galaxy:
```
GSM4618288,GSM4618289,GSM4618290
```
..and we saw these **netstat** output on raulPC during execution:
```
-bash-4.2$ netstat -taW|grep http
tcp        0      0 E1-051569.science.psu.edu:55728 ftp13-1.be-md.ncbi.nlm.nih.gov:https TIME_WAIT
tcp        0      0 E1-051569.science.psu.edu:34034 ftp22-1.be-md.ncbi.nlm.nih.gov:https TIME_WAIT
tcp        0      0 E1-051569.science.psu.edu:33932 ftp22-1.be-md.ncbi.nlm.nih.gov:https TIME_WAIT
tcp        0      0 E1-051569.science.psu.edu:55638 ftp13-1.be-md.ncbi.nlm.nih.gov:https TIME_WAIT
tcp        0      0 E1-051569.science.psu.edu:55726 ftp13-1.be-md.ncbi.nlm.nih.gov:https TIME_WAIT
```

#### MethylIT: Convert Read counts to GRanges

Next we call **MethylIT: Convert Read counts to GRanges** two times:

* once for 6 individuals, galaxy history item 669
* once for 3 individuals, galaxy history item 677

..once for the 6 individuals and again for the three we will use to make
the reference.

First we call the 6, which have data for chrom,start,strand,methCounts,unmethCounts and these following form entries to specify the **pattern**
and the sample names:
```
^[1-5].*CG..
```
```
BS-13,BS-14,BS-15,BS-16,BS-17,BS-18
```


### galaxy testing at raulPC goes good

It appears to be the same exact galaxy as we have at pc34:

* my entire history is there
* existing annotations were there
* nothing appeared to be any different at all

### restored galaxy to raulPC69 from pc34

This was lots of work but roughly:

* /data/galaxy is where the data goes on pc34 and so soft links made it look like the data was there on raulPC
* /opt/galaxy/galaxy is where the galaxy user home directory is, and where galaxy is installed, soft links again
* /data/galaxy and /opt/galaxy/galaxy actually reside at /media/big/data/galaxy and /media/work/opt/galaxy, respectively
* There are large archives of pc34 from /var/lib/pgsql and /opt/galaxy/galaxy and /opt/galaxy/\_conda and /opt/galaxy/OTHERTHINGS
* Those were all captured as root and restored as root or galaxy to maintain proper ownership
* slurm and munge were already there and working, probably from June when Greg was building things on pc34, I was helping but working on raulPC
* python3 and several other yum packages were installed
* new linux users galaxy postgres both were explicitly created with pc34 UID and GID to exactly match
* Robersy at 4026170206, heads for Georgetown this week.
* On PC34, postgres was stopped and a filesystem copy was made and this was used as drop in replacement at raulPC69:/var/lib/pgsql
* Postgres was already installed onto raulPC before copy was untarred in raulPC;/var/lib/pgsql
* there was a bit of supervisord trouble because the .sock file did not survive the tar but it eventually got working

### backup postgres database at galaxy pc34

```
-bash-4.2$ sudo systemctl list-units|grep postgresql
postgresql.service                                                                        loaded active running   PostgreSQL database server
-bash-4.2$ ps -ef|grep postgres
postgres  1776     1  0 Nov08 ?        00:00:39 /usr/bin/postgres -D /var/lib/pgsql/data -p 5432
postgres  1863  1776  0 Nov08 ?        00:00:00 postgres: logger process
postgres  1871  1776  0 Nov08 ?        00:00:08 postgres: checkpointer process
postgres  1872  1776  0 Nov08 ?        00:00:09 postgres: writer process
postgres  1873  1776  0 Nov08 ?        00:00:55 postgres: wal writer process
postgres  1874  1776  0 Nov08 ?        00:00:35 postgres: autovacuum launcher process
postgres  1875  1776  0 Nov08 ?        00:25:42 postgres: stats collector process
twm118   21157   960  0 13:26 pts/0    00:00:00 grep --color=auto postgres
-bash-4.2$ sudo systemctl stop postgresql
-bash-4.2$ sudo systemctl status postgresql
● postgresql.service - PostgreSQL database server
   Loaded: loaded (/usr/lib/systemd/system/postgresql.service; enabled; vendor preset: disabled)
   Active: inactive (dead) since Tue 2020-11-24 13:26:45 EST; 5s ago
  Process: 21205 ExecStop=/usr/bin/pg_ctl stop -D ${PGDATA} -s -m fast (code=exited, status=0/SUCCESS)
  Process: 1495 ExecStart=/usr/bin/pg_ctl start -D ${PGDATA} -s -o -p ${PGPORT} -w -t 300 (code=exited, status=0/SUCCESS)
  Process: 1278 ExecStartPre=/usr/bin/postgresql-check-db-dir ${PGDATA} (code=exited, status=0/SUCCESS)
 Main PID: 1776 (code=exited, status=0/SUCCESS)

Nov 08 05:48:29 E1-052734.science.psu.edu systemd[1]: Starting PostgreSQL database server...
Nov 08 05:48:38 E1-052734.science.psu.edu systemd[1]: Started PostgreSQL database server.
Nov 24 13:26:44 E1-052734.science.psu.edu systemd[1]: Stopping PostgreSQL database server...
Nov 24 13:26:45 E1-052734.science.psu.edu systemd[1]: Stopped PostgreSQL database server.
-bash-4.2$ ps -ef|grep postgres
twm118   21222   960  0 13:26 pts/0    00:00:00 grep --color=auto postgres
-bash-4.2$ pwd
/opt
-bash-4.2$ cd /var/lib/
-bash-4.2$ sudo tar -cf /data/pc34_var_lib_pgsql_stopped_galaxy_20201124.tar ./pgsql/
```
### galaxy pc34 postgres user commands, only psql and createuser --interactive

Here we see commands run by postgres

```
-bash-4.2$ history >> /var/tmp/.his_postgres_pc34_20201124.txt
-bash-4.2$ history
    1  \password
    2  passwd
    3  exit
    4  createuser --interactive
    5  psql
    6  exit
    7  psql
    8  whoami
    9  psql
   10  exit
   11  psql
   12  exit
..and here we see psql things:
```
-bash-4.2$ cat .psql_history
alter user postgres password postgresalter user galaxy password galaxyexit
\q
alter user galaxy password galaxyshow hba_file ;
alter user galaxy password galaxy;
\q
alter user postgres password postgres;
show hba_file ;
\q
alter role postgres with password 'postgres';
alter role galaxy with password 'galaxy';
\q
SELECT pg_reload_conf();
\q
```

### raulPC postgres setup

```
-bash-4.2$ whoami
postgres
-bash-4.2$ createuser galaxy
-bash-4.2$ createdb -O galaxy galaxy
-bash-4.2$ psql
psql (9.2.24)
Type "help" for help.

postgres=# alter user galaxy password galaxy;
ERROR:  syntax error at or near "galaxy"
LINE 1: alter user galaxy password galaxy;
                                   ^
postgres=# alter role galaxy with password 'galaxy';
ALTER ROLE
postgres=# SELECT pg_reload_conf();
 pg_reload_conf
----------------
 t
(1 row)

postgres=# \q
```

### connect to postgres with psql -d galaxy -U galaxy -h 127.0.0.1

Here we see a quick session with **psql -d galaxy -U galaxy -h 127.0.0.1**
```
-bash-4.2$ psql -d galaxy -U galaxy -h 127.0.0.1
psql (9.2.24)
Type "help" for help.

galaxy=> help
You are using psql, the command-line interface to PostgreSQL.
Type:  \copyright for distribution terms
       \h for help with SQL commands
       \? for help with psql commands
       \g or terminate with semicolon to execute query
       \q to quit
galaxy=> show databases
galaxy-> ;
ERROR:  unrecognized configuration parameter "databases"
galaxy=> help show \h
You are using psql, the command-line interface to PostgreSQL.
Type:  \copyright for distribution terms
       \h for help with SQL commands
       \? for help with psql commands
       \g or terminate with semicolon to execute query
       \q to quit
galaxy=> \h show
Command:     SHOW
Description: show the value of a run-time parameter
Syntax:
SHOW name
SHOW ALL

galaxy=> SHOW ALL
galaxy-> \l
                                    List of databases
      Name      |  Owner   | Encoding |   Collate   |    Ctype    |   Access privileges
----------------+----------+----------+-------------+-------------+-----------------------
 galaxy         | galaxy   | UTF8     | en_US.UTF-8 | en_US.UTF-8 |
 galaxy_install | galaxy   | UTF8     | en_US.UTF-8 | en_US.UTF-8 |
 postgres       | postgres | UTF8     | en_US.UTF-8 | en_US.UTF-8 |
 template0      | postgres | UTF8     | en_US.UTF-8 | en_US.UTF-8 | =c/postgres          +
                |          |          |             |             | postgres=CTc/postgres
 template1      | postgres | UTF8     | en_US.UTF-8 | en_US.UTF-8 | =c/postgres          +
                |          |          |             |             | postgres=CTc/postgres
(5 rows)

galaxy-> \dt
                                    List of relations
 Schema |                              Name                              | Type  | Owner
--------+----------------------------------------------------------------+-------+--------
 public | api_keys                                                       | table | galaxy
 public | cleanup_event                                                  | table | galaxy
 public | cleanup_event_dataset_association                              | table | galaxy
public | cleanup_event_hda_association                                  | table | galaxy
 public | cleanup_event_history_association                              | table | galaxy
 public | cleanup_event_icda_association                                 | table | galaxy
 public | cleanup_event_ldda_association                                 | table | galaxy
 public | cleanup_event_library_association                              | table | galaxy
 public | cleanup_event_library_dataset_association                      | table | galaxy
 public | cleanup_event_library_folder_association                       | table | galaxy
 public | cleanup_event_metadata_file_association                        | table | galaxy
 public | cleanup_event_user_association                                 | table | galaxy
 public | cloudauthz                                                     | table | galaxy
 public | custos_authnz_token                                            | table | galaxy
 public | data_manager_history_association                               | table | galaxy
 public | data_manager_job_association                                   | table | galaxy
 public | dataset                                                        | table | galaxy
 public | dataset_collection                                             | table | galaxy
 public | dataset_collection_element                                     | table | galaxy
 public | dataset_hash                                                   | table | galaxy
 public | dataset_permissions                                            | table | galaxy
 public | dataset_source                                                 | table | galaxy
 public | dataset_source_hash                                            | table | galaxy
 public | dataset_tag_association                                        | table | galaxy
 public | default_history_permissions                                    | table | galaxy
 public | default_quota_association                                      | table | galaxy
 public | default_user_permissions                                       | table | galaxy
 public | deferred_job                                                   | table | galaxy
 public | dynamic_tool                                                   | table | galaxy
 public | event                                                          | table | galaxy
 public | extended_metadata                                              | table | galaxy
 public | extended_metadata_index                                        | table | galaxy
 public | external_service                                               | table | galaxy
 public | form_definition                                                | table | galaxy
 public | form_definition_current                                        | table | galaxy
 public | form_values                                                    | table | galaxy
 public | galaxy_group                                                   | table | galaxy
 public | galaxy_session                                                 | table | galaxy
 public | galaxy_session_to_history                                      | table | galaxy
 public | galaxy_user                                                    | table | galaxy
 public | galaxy_user_openid                                             | table | galaxy
 public | genome_index_tool_data                                         | table | galaxy
 public | group_quota_association                                        | table | galaxy
 public | group_role_association                                         | table | galaxy
 public | history                                                        | table | galaxy
 public | history_annotation_association                                 | table | galaxy
 public | history_dataset_association                                    | table | galaxy
 public | history_dataset_association_annotation_association             | table | galaxy
 public | history_dataset_association_display_at_authorization           | table | galaxy
 public | history_dataset_association_history                            | table | galaxy
 public | history_dataset_association_rating_association                 | table | galaxy
 public | history_dataset_association_subset                             | table | galaxy
 public | history_dataset_association_tag_association                    | table | galaxy
 public | history_dataset_collection_annotation_association              | table | galaxy
 public | history_dataset_collection_association                         | table | galaxy
 public | history_dataset_collection_rating_association                  | table | galaxy
public | history_dataset_collection_tag_association                     | table | galaxy
 public | history_rating_association                                     | table | galaxy
 public | history_tag_association                                        | table | galaxy
 public | history_user_share_association                                 | table | galaxy
 public | implicit_collection_jobs                                       | table | galaxy
 public | implicit_collection_jobs_job_association                       | table | galaxy
 public | implicitly_converted_dataset_association                       | table | galaxy
 public | implicitly_created_dataset_collection_inputs                   | table | galaxy
 public | interactivetool_entry_point                                    | table | galaxy
 public | job                                                            | table | galaxy
 public | job_container_association                                      | table | galaxy
 public | job_export_history_archive                                     | table | galaxy
 public | job_external_output_metadata                                   | table | galaxy
 public | job_import_history_archive                                     | table | galaxy
 public | job_metric_numeric                                             | table | galaxy
 public | job_metric_text                                                | table | galaxy
 public | job_parameter                                                  | table | galaxy
 public | job_state_history                                              | table | galaxy
 public | job_to_implicit_output_dataset_collection                      | table | galaxy
 public | job_to_input_dataset                                           | table | galaxy
 public | job_to_input_dataset_collection                                | table | galaxy
 public | job_to_input_library_dataset                                   | table | galaxy
 public | job_to_output_dataset                                          | table | galaxy
 public | job_to_output_dataset_collection                               | table | galaxy
 public | job_to_output_library_dataset                                  | table | galaxy
 public | kombu_message                                                  | table | galaxy
 public | kombu_queue                                                    | table | galaxy
 public | library                                                        | table | galaxy
 public | library_dataset                                                | table | galaxy
 public | library_dataset_collection_annotation_association              | table | galaxy
 public | library_dataset_collection_association                         | table | galaxy
 public | library_dataset_collection_rating_association                  | table | galaxy
 public | library_dataset_collection_tag_association                     | table | galaxy
 public | library_dataset_dataset_association                            | table | galaxy
 public | library_dataset_dataset_association_permissions                | table | galaxy
 public | library_dataset_dataset_association_tag_association            | table | galaxy
 public | library_dataset_dataset_info_association                       | table | galaxy
 public | library_dataset_permissions                                    | table | galaxy
 public | library_folder                                                 | table | galaxy
 public | library_folder_info_association                                | table | galaxy
 public | library_folder_permissions                                     | table | galaxy
 public | library_info_association                                       | table | galaxy
 public | library_permissions                                            | table | galaxy
 public | metadata_file                                                  | table | galaxy
 public | migrate_tools                                                  | table | galaxy
 public | migrate_version                                                | table | galaxy
 public | oidc_user_authnz_tokens                                        | table | galaxy
 public | page                                                           | table | galaxy
 public | page_annotation_association                                    | table | galaxy
 public | page_rating_association                                        | table | galaxy
 public | page_revision                                                  | table | galaxy
 public | page_tag_association                                           | table | galaxy
 public | page_user_share_association                                    | table | galaxy
 public | password_reset_token                                           | table | galaxy
 public | post_job_action                                                | table | galaxy
 public | post_job_action_association                                    | table | galaxy
 public | psa_association                                                | table | galaxy
 public | psa_code                                                       | table | galaxy
 public | psa_nonce                                                      | table | galaxy
 public | psa_partial                                                    | table | galaxy
 public | quota                                                          | table | galaxy
 public | repository_dependency                                          | table | galaxy
 public | repository_repository_dependency_association                   | table | galaxy
 public | request                                                        | table | galaxy
 public | request_event                                                  | table | galaxy
 public | request_type                                                   | table | galaxy
 public | request_type_external_service_association                      | table | galaxy
 public | request_type_permissions                                       | table | galaxy
 public | request_type_run_association                                   | table | galaxy
 public | role                                                           | table | galaxy
 public | run                                                            | table | galaxy
 public | sample                                                         | table | galaxy
 public | sample_dataset                                                 | table | galaxy
 public | sample_event                                                   | table | galaxy
 public | sample_run_association                                         | table | galaxy
 public | sample_state                                                   | table | galaxy
 public | stored_workflow                                                | table | galaxy
 public | stored_workflow_annotation_association                         | table | galaxy
 public | stored_workflow_menu_entry                                     | table | galaxy
 public | stored_workflow_rating_association                             | table | galaxy
 public | stored_workflow_tag_association                                | table | galaxy
 public | stored_workflow_user_share_connection                          | table | galaxy
 public | tag                                                            | table | galaxy
 public | task                                                           | table | galaxy
 public | task_metric_numeric                                            | table | galaxy
 public | task_metric_text                                               | table | galaxy
 public | tool_dependency                                                | table | galaxy
 public | tool_shed_repository                                           | table | galaxy
 public | tool_tag_association                                           | table | galaxy
 public | tool_version                                                   | table | galaxy
 public | tool_version_association                                       | table | galaxy
 public | transfer_job                                                   | table | galaxy
 public | user_action                                                    | table | galaxy
 public | user_address                                                   | table | galaxy
 public | user_group_association                                         | table | galaxy
 public | user_preference                                                | table | galaxy
 public | user_quota_association                                         | table | galaxy
 public | user_role_association                                          | table | galaxy
 public | visualization                                                  | table | galaxy
 public | visualization_annotation_association                           | table | galaxy
 public | visualization_rating_association                               | table | galaxy
 public | visualization_revision                                         | table | galaxy
 public | visualization_tag_association                                  | table | galaxy
 public | visualization_user_share_association                           | table | galaxy
 public | worker_process                                                 | table | galaxy
 public | workflow                                                       | table | galaxy
public | workflow_invocation                                            | table | galaxy
 public | workflow_invocation_output_dataset_association                 | table | galaxy
 public | workflow_invocation_output_dataset_collection_association      | table | galaxy
 public | workflow_invocation_output_value                               | table | galaxy
 public | workflow_invocation_step                                       | table | galaxy
 public | workflow_invocation_step_output_dataset_association            | table | galaxy
 public | workflow_invocation_step_output_dataset_collection_association | table | galaxy
 public | workflow_invocation_to_subworkflow_invocation_association      | table | galaxy
 public | workflow_output                                                | table | galaxy
 public | workflow_request_input_parameters                              | table | galaxy
 public | workflow_request_input_step_parameter                          | table | galaxy
 public | workflow_request_step_states                                   | table | galaxy
 public | workflow_request_to_input_collection_dataset                   | table | galaxy
 public | workflow_request_to_input_dataset                              | table | galaxy
 public | workflow_step                                                  | table | galaxy
 public | workflow_step_annotation_association                           | table | galaxy
 public | workflow_step_connection                                       | table | galaxy
 public | workflow_step_input                                            | table | galaxy
 public | workflow_step_tag_association                                  | table | galaxy
 public | workflow_tag_association                                       | table | galaxy
(182 rows)

galaxy->
galaxy-> \df
                       List of functions
 Schema | Name | Result data type | Argument data types | Type
--------+------+------------------+---------------------+------
(0 rows)

galaxy-> \dv
No relations found.
galaxy-> \u
Invalid command \u. Try \? for help.
galaxy-> \u
Invalid command \u. Try \? for help.
galaxy-> \du
                             List of roles
 Role name |                   Attributes                   | Member of
-----------+------------------------------------------------+-----------
 galaxy    | Create DB                                      | {}
 postgres  | Superuser, Create role, Create DB, Replication | {}

galaxy-> SELECT version()
galaxy-> ;
ERROR:  syntax error at or near "SELECT"
LINE 3: SELECT version()
        ^
galaxy=> SELECT version();
                                                    version
---------------------------------------------------------------------------------------------------------------
 PostgreSQL 9.2.24 on x86_64-redhat-linux-gnu, compiled by gcc (GCC) 4.8.5 20150623 (Red Hat 4.8.5-39), 64-bit
(1 row)

galaxy=> \s
show databases
;
\h show
SHOW ALL
\l
\dt

\df
\dv
\u
\u
\du
SELECT version()
;
SELECT version();
\s

galaxy=> \q
```

### postgres galaxy setup pc34 and /var/lib/pgsql/initdb.log

Here we see artifacts of activity in pc34 especially **createuser --interactive** and **/var/lib/pgsql/initdb.log**:

```
cat /var/lib/pgsql/.bash_history
\password
passwd
exit
createuser --interactive
psql
exit
psql
whoami
psql
exit
psql
exit
psql
exit
```
..and also:
```
sudo less /var/lib/pgsql/initdb.log

The files belonging to this database system will be owned by user "postgres".
This user must also own the server process.

The database cluster will be initialized with locale "en_US.UTF-8".
The default database encoding has accordingly been set to "UTF8".
The default text search configuration will be set to "english".

fixing permissions on existing directory /var/lib/pgsql/data ... ok
creating subdirectories ... ok
selecting default max_connections ... 100
selecting default shared_buffers ... 32MB
creating configuration files ... ok
creating template1 database in /var/lib/pgsql/data/base/1 ... ok
initializing pg_authid ... ok
initializing dependencies ... ok
creating system views ... ok
loading system objects' descriptions ... ok
creating collations ... ok
creating conversions ... ok
creating dictionaries ... ok
setting privileges on built-in objects ... ok
creating information schema ... ok
loading PL/pgSQL server-side language ... ok
vacuuming database template1 ... ok
copying template1 to template0 ... ok
copying template1 to postgres ... ok

Success. You can now start the database server using:wned by user "postgres".
This user must also own the server process.
    /usr/bin/postgres -D /var/lib/pgsql/data
ore database cluster will be initialized with locale "en_US.UTF-8".
    /usr/bin/pg_ctl -D /var/lib/pgsql/data -l logfile startUTF8".
/var/lib/pgsql/initdb.log
```

### galaxy port to raulPC via galaxy history

This will be a pain but we have the history
```
misc/galaxy/.his_052734_20201102_0531a
misc/galaxy/.his_galaxy_052734_20201102_0558a
misc/galaxy/.his_su_052734_galaxy_20201104_1645pm
misc/galaxy/pc34_sudo_20200621.txt
misc/galaxy/pc34_sudo_20200621short.txt
```
### galaxy communications RE installing gene annotation files, readSDS, supervisord, startgalaxy

```
Galaxy MethylIT testing update

Its so great to see this progress!  Awesome!!

YesNo

Dear Greg,

OK, got it about the R changes taking immediate effect and about the tool versioning.
I will put the version back to 1.0.0, hoping to keep working workflows working good.
Yes, I am activating the virtualenv just as you show.

I am getting better at reading "View Info" output and its allowing me to get much closer
to the R that is running.  Being able to also use "Download" and open it with readRDS()
allows for much stronger troubleshooting.  Galaxy MethylIT looked like a black box
but now there is less wondering going on.

Thanks,
Tom
Hi Tom,


Dear Greg,



$ ~/galaxy/.venv/bin/activate
$ stopgalaxy
$ startgalaxy
etc.


The next thing I will try to do (after troubleshooting to make sure cancer/human works) is to
migrate this test/galaxy server to a nearby lab machine with 256GB of memory.  Being on
a big machine will allow us to run more typical, real analysis.  The little 100k arabidopsis
testing and the human 4 samples/1 chromosome testing are good enough to show that
MethylIT on Galaxy works, good enough for me.  But it will be nice to feed it bigger tests to
make it do real things that we have done with just R, do it in Galaxy MethylIT.


Awesome!!   Let me know if there is anything I can do to help.


I will keep sending you updates with progress and when I get into trouble.


:)
Dear Greg,

Yes, I am changing files in /home/galaxy/galaxy/tools/methylome_analysis/*
I did not see that it was automatically reloading.  It seems like the .R file was not being re-read
until I changed the version in that tool's xml file.  I am not sure about that. 
I am using that same supervisor configuration and I am using the aliases that
you setup for startgalaxy and stopgalaxy.  Almost everything is exactly as you setup
initially. 

The next thing I will try to do (after troubleshooting to make sure cancer/human works) is to
migrate this test/galaxy server to a nearby lab machine with 256GB of memory.  Being on
a big machine will allow us to run more typical, real analysis.  The little 100k arabidopsis
testing and the human 4 samples/1 chromosome testing are good enough to show that
MethylIT on Galaxy works, good enough for me.  But it will be nice to feed it bigger tests to
make it do real things that we have done with just R, do it in Galaxy MethylIT.

I will keep sending you updates with progress and when I get into trouble.

Thanks,
Tom
Thanks for the info Tom - it looks like you are making great progress!  If I remember correctly, I think I have the tool code manually placed on the server in the ~/galaxy/tools/methylome_analysis/* directory.  Is this the code you are changing?  If so, any time you change a tool .xml file, Galaxy should automatically reload the tool in real time unless you’ve set the watch_tools config setting to false in the galaxy.yml file (see below).  You can watch the Galaxy logs in ~/galaxy/logs to see the tool get reloaded.  Also, how are you stopping and restarting Galaxy now that you have reinstalled everything?  Are you still using the supervisor configuration that I had set up?

  # Monitor the tools and tool directories listed in any tool config
  # file specified in tool_config_file option.  If changes are found,
  # tools are automatically reloaded. Watchdog (
  # https://pypi.org/project/watchdog/ ) must be installed and available
  # to Galaxy to use this option. Other options include 'auto' which
  # will attempt to watch tools if the watchdog library is available but
  # won't fail to load Galaxy if it is not and 'polling' which will use
  # a less efficient monitoring scheme that may work in wider range of
  # scenarios than the watchdog default.
  #watch_tools: ‘false'

Also, how are you stopping and restarting Galaxy now that you have reinstalled everything?  Are you still using the supervisor configuration that I had set up?



Dear Greg CC Hardik,

I looked at the github code and found where I thought the problem was and after
some galaxy-ing around got it to work.  I share a summary of what changes were made.
The testing that Hardik and I did now works all the way through and now we know about
using readRDS() instead of load().

Thanks,
Tom


I change this file:
methylit_get_dimp_at_genes.R

..so that the affected lines look like this:

## Tom commented out so that TAIR10/arabidopsis can work (TAIR10.gff3 has no "biotype" nor chr13:
#genes <- gene_annot[ gene_annot$type == "gene", c( "gene_id", "biotype", "Name" ) ];
#genes <- genes[ genes$biotype == "protein_coding", "gene_id" ];
#seqlevels(genes) <- "chr13";
## Tom added in so that object "genes" exists:
genes <- gene_annot;
gr <- readRDS(opt$input);

..as the comment suggests, there are at least a few problems with this code:
TAIR10 has not a chromosome named "chr13" or even "13", so I commented it out
GFF3 files do not always have the same columns, TAIR10.gff3 does not have "gene_id", it has "id"
..findOverlaps and friends are not kind when it comes to "seqnames".  I believe this change may have broken the
cancer example code and so I will revisit this code again soon.

I also changed the "version" in this file from 1.0.0 to 1.0.1 and then to 1.0.2:

methylit_get_dimp_at_genes.xml

..because I think it was ignoring the changes that I made.  Its very nice that galaxy reports the version of the tool.

My recent wrangling with galaxy has shown me that its a solid platform to administer, very well documented and predictable. 

I also uploaded a new TAIR/arabidopsis annotation after making my user an Admin.

I am trying to report (to you) everything that I am changing and like to think that you won't see anything surprising.
I am also making backup copies of files that I edit.  That is usually done like this was done today:

cp methylit_get_dimp_at_genes.xml methylit_get_dimp_at_genes.xml_20201113_beforeTomBroke

Dear Greg,

These answers you provide look like bullseyes to me.  Very nice! 
I will try them out.

Thanks,
Tom
 I have some small soybean data and so it would be nice to know how to
add to the list of items under "Using gene annotations" on the form found in the tool named
"MethylIT: Count DMPs at gene-body"


These cached gene annotation files are installed using the Gene Annotation Fetch tool, which is accessible only by the Galaxy administrator (which I believe your login has been configured to be).  Click the Admin option on the top menu pane to see the Admin UI.  Look for the Local Data option under the Server section of the left tool panel.

<PastedGraphic-1.png>

Clicking Local Data will present this screen.

<PastedGraphic-2.png>

Click the dark Gene Annotation Fetch gene annotation fetcher box to display the tool form.

<PastedGraphic-3.png>

Enter the appropriate values for each field and click Execute.  The tool will instal the gene annotation file locally and it will then be select-able from tool forms that use it.

Here are the values I used for the tair10 gene annotation file.

<PastedGraphic-4.png>

Here is what I used for hg38chr13

<PastedGraphic-5.png>

Dear Greg CC Hardik,

I looked at the github code and found where I thought the problem was and after
some galaxy-ing around got it to work.  I share a summary of what changes were made.
The testing that Hardik and I did now works all the way through and now we know about
using readRDS() instead of load().

Thanks,
Tom


I change this file:
methylit_get_dimp_at_genes.R

..so that the affected lines look like this:

## Tom commented out so that TAIR10/arabidopsis can work (TAIR10.gff3 has no "biotype" nor chr13:
#genes <- gene_annot[ gene_annot$type == "gene", c( "gene_id", "biotype", "Name" ) ];
#genes <- genes[ genes$biotype == "protein_coding", "gene_id" ];
#seqlevels(genes) <- "chr13";
## Tom added in so that object "genes" exists:
genes <- gene_annot;
gr <- readRDS(opt$input);

..as the comment suggests, there are at least a few problems with this code:
TAIR10 has not a chromosome named "chr13" or even "13", so I commented it out
GFF3 files do not always have the same columns, TAIR10.gff3 does not have "gene_id", it has "id"
..findOverlaps and friends are not kind when it comes to "seqnames".  I believe this change may have broken the
cancer example code and so I will revisit this code again soon.

I also changed the "version" in this file from 1.0.0 to 1.0.1 and then to 1.0.2:

methylit_get_dimp_at_genes.xml

..because I think it was ignoring the changes that I made.  Its very nice that galaxy reports the version of the tool.

My recent wrangling with galaxy has shown me that its a solid platform to administer, very well documented and predictable. 

I also uploaded a new TAIR/arabidopsis annotation after making my user an Admin.

I am trying to report (to you) everything that I am changing and like to think that you won't see anything surprising.
I am also making backup copies of files that I edit.  That is usually done like this was done today:

cp methylit_get_dimp_at_genes.xml methylit_get_dimp_at_genes.xml_20201113_beforeTomBroke
Dear Greg,

These answers you provide look like bullseyes to me.  Very nice! 
I will try them out.

Thanks,
Tom
I have some small soybean data and so it would be nice to know how to
add to the list of items under "Using gene annotations" on the form found in the tool named
"MethylIT: Count DMPs at gene-body"


These cached gene annotation files are installed using the Gene Annotation Fetch tool, which is accessible only by the Galaxy administrator (which I believe your login has been configured to be).  Click the Admin option on the top menu pane to see the Admin UI.  Look for the Local Data option under the Server section of the left tool panel.



Clicking Local Data will present this screen.



Click the dark Gene Annotation Fetch gene annotation fetcher box to display the tool form.



Enter the appropriate values for each field and click Execute.  The tool will instal the gene annotation file locally and it will then be select-able from tool forms that use it.

Here are the values I used for the tair10 gene annotation file.



Here is what I used for hg38chr13
All of my code for the MethylIT tools is located here https://github.com/gregvonkuster/galaxy_tools/tree/master/tools/methylome_analysis, so you can see what I am doing.

I’m using the saveRDS() function to produce the outputs, so the output files can be loaded using the readRDS() function.

Dear Greg CC Hardik,

Our lab member Hardik zoomed with me during a Galaxy MethylIT execution. 
Based on our testing, I share just two problems/ideas about running Galaxy MethylIT. 

1. TAIR10: Problem using tair10 gene annotation in the final step, "Count DMPs at gene-body"
2. SEEING DATA: Inability to see current objects: we want to see, for example, GRanges items in our history

I summarize these issues below. 

Hardik is the first (and only) to walk the Galaxy MethylIT with me.  (Thanks Hardik!)
Except for the last-step failure (item 1) and the inability to see objects (item 2), this testing session looked pretty good.

UNRELATED UPDATES:
I added more RAM, physically, to the galaxy machine, at 16GB, our testing jobs have enough RAM.
I may try to copy our galaxy to a larger machine in the lab, with 256GB RAM, to allow for bigger testing jobs.
I will send you updates, like this one, as news comes in. 

Thanks,
Tom

TAIR10 problem:

We got successfully through an entire execution of Arabidopsis analysis untilYes, I am changing files in /home/galaxy/galaxy/tools/methylome_analysis/*
I did not see that it was automatically reloading.  It seems like the .R file was not being re-read
until I changed the version in that tool's xml file.

The R file is not reloaded when changes are made, but any changes will be used without changing the xml file.  The reason it looked like the tool was being reloaded when you changed the version in the xml file is simply due to the tool being reloaded whenever any change it made to the xml file.  I advise not to change tool versions for now because doing this is not necessary and has several resulting effects.  For example, you’ll need to edit all workflows that use the old tool version and update them to use the new tool version.

To clarify, if you change the R file, the changes will be used in the next tool execution - I do this all of the time.  The R file is read by the Galaxy tool framework at execution time.  If you’re not experiencing this, let me know and I’ll work with you to see why.



I am not sure about that.
I am using that same supervisor configuration and I am using the aliases that
you setup for startgalaxy and stopgalaxy.  Almost everything is exactly as you setup
initially.

Awesome!  I amazed that you found all that stuff!  This is exactly how you should be stopping and starting galaxy.  Are you activating the Galaxy virtualenv before stopping and starting?  You should be doing the following:
the last tool, "MethylIT: Count DMPs at gene-body".  When I click upon the
eyeball, aka "View data" of the "process log" in my history, this text shows
up alone in the middle pane:

Error in readGFF(filepath, version = version, filter = filter) :
  reading GFF file: line 1 has less than 8 tab-separated columns
Calls: readGFFAsGRanges -> readGFF
Execution halted

That makes me think that perhaps the tair10 gene annotation that we used has a problem. 
Right now in our dev/test server, this tool allows me to choose between two items
found in the form under label "Using gene annotations":

- hg38chr13
- tair10

As you know, the "hg38chr13" works good with the cancer example.  I have not seen
the tair10 work yet.  I also do not know how it got there or how I can put one in
there myself.  I have some small soybean data and so it would be nice to know how to
add to the list of items under "Using gene annotations" on the form found in the tool named
"MethylIT: Count DMPs at gene-body"

For troubleshooting I have tried a few things, without luck, including:

- changing our input counts files to use "chr1" instead of "1" for each of the chromosome names
- trying to analyze only one chromosome (by using "pattern" in the "Convert Read counts" tool)



SEEING DATA:

During our test run, we knew what should have been in the objects created by our history: we know
what should be in the output of "Estimate Divergence" or "Select cytosine positions" and it would be
nice to be able to click the "Download" button in our history and get the "RData" file to view it on
our machine, or to see it somehow in Galaxy.  When I click on the "Download" button in history I get
a file with a name like this and linux "file" command tells me that its a gzip:

$ file Galaxy573-\[MethylIT__Estimate_divergence_\(infDiv\)_on_data_511\,_data_510\,_and_others\].infdiv
Galaxy573-[MethylIT__Estimate_divergence_(infDiv)_on_data_511,_data_510,_and_others].infdiv: gzip compressed data, from Unix

..now if I rename it to have a ".gz" extension, then gunzip will uncompress it:

$ mv Galaxy573-\[MethylIT__Estimate_divergence_\(infDiv\)_on_data_511\,_data_510\,_and_others\].infdiv Galaxy573.gz
$ gunzip Galaxy573.gz

..and now I see that "file" command says it is "data", which is exactly what "file" says that real ".RData" files are:

$ mv Galaxy573 Galaxy573.RData
$ file Galaxy573.RData
Galaxy573.RData: data

..so far it looks like I might have a real .RData archive, but when I open it in R, with load(), its not good. 
Here we see, in R, that I cannot load() that file:

> load("Galaxy573.RData")
Error in load("Galaxy573.RData") :
  bad restore file magic number (file may be corrupted) -- no data loaded
In addition: Warning messages:
1: In readChar(con, 5L, useBytes = TRUE) :
  truncating string with embedded nuls
2: file ‘Galaxy573.RData’ has magic number 'X'
  Use of save versions prior to 2 is deprecated
> q()
u
..and I think that error message "Use of save versions prior to 2 is deprecated" is bogus.
I don't think this thing is any kind of RData archive file but I am not sure about that. 
The next thing we can try is to look inside this strange file from the Galaxy MethylIT Estimate Divergence tool.
Here we run strings on it and see that this file does contain familiar looking things:

$ strings Galaxy573.RData |head -44|tr '\n' ' '
UTF-8 seqnames values levels chr1 chr2 chr3 chr4 chr5 class factor lengths elementMetadata NULL metadata package S4Vectors strand factor S4Vectors ranges start width NAMES elementType IRanges IRanges seqinfo chr1 chr2 chr3 chr4 chr5 seqlengths is_circular genome Seqinfo
                                                                                                                                    GenomeInfoDb rownames nrows listData  %@2 ^c(? ^c(?


All of the files that we want to see in Galaxy MethylIT are like this example. 
We could use the Boxplot and Histogram tools but it will be nice, if possible,
to see the real output object, an RData archive would be nice.
```


### galaxy cloudman

https://galaxyproject.org/cloudman/

```
Galaxy CloudMan
CloudMan


CloudMan home | Getting Started | Cluster Types | Capacity Planning | Application Services | Cluster Sharing | Instance User Data | Customizing | Building on a private cloud | Troubleshooting | FAQ
There are several choices for using Galaxy. This page describes using Galaxy on a cloud infrastructure using CloudMan (see below). For other options, see Choices and Cloud.

About Galaxy CloudMan
Galaxy CloudMan enables Galaxy to be quickly setup on cloud computing resources. CloudMan is a Cloud Manager that orchestrates all of the steps required to provision, configure, manage, and share Galaxy on a cloud computing infrastructure using just a web browser. An instance of Galaxy CloudMan behaves like a private instance of Galaxy and offers the benefits of cloud computing resource availability, elasticity and pay-as-you-go resource ownership model.

Galaxy available via CloudMan comes pre-configured with the production settings and is ready for processing data as soon as it is launched. The process of using Galaxy CloudMan requires a virtual server to be launched on a cloud provider, which only takes a few minutes. Once launched, CloudMan sets up a virtual cluster on the created server that can be dynamically scaled to meet the current computational demand. Once the need for the compute resources subsides, the acquired server(s) can be shut down. With such a paradigm, one pays only for the resources they need and use.

When to use Galaxy CloudMan
The following is a non-exhaustive list of scenarios when it is beneficial to use Galaxy on the Cloud:

Do not want to spend time setting up a Galaxy instance
Need to customize a Galaxy instance with new tools or genome reference data
Have run up against the quotas on a public server
Have variable or high requirements for compute or storage resources
Getting started
To start your own Galaxy CloudMan, see the Getting Started page.

Determining the size of your cloud cluster
Cloud computing allows your cloud cluster to be variable in size and capacity. See this page for some guidelines on how to decide what is right for you.

Customizing your cloud cluster
If you are interested in running your own version of Galaxy and/or tools on the cloud while utilizing all the automation and functionality provided by CloudMan, this page explains how to do it.

A note about costs
Amazon Web Services (AWS) is a pay-as-you-go service that requires a valid credit card before resources can be acquired. Rates for Amazon EC2 can be found here. To see how much using Amazon cloud might cost, you can use the AWS cost calculator. When calculating the total cost, in addition to the EC2 instance(s), you will have data volumes associated with your cluster where all of your Galaxy data will be stored.

Community cloud providers, such as the Jetstream cloud in the US or the NeCTAR cloud in Australia offer free access to cloud resources but require an active project allocation for which ones needs to apply.

Galaxy AMIs
Current AMI:

AMI: ami-3be8cd2c
Name: Galaxy CloudMan 161101b2 (active dates: 2016-11-01 -> present)
Note that the current AMI represents the environment required to run CloudMan (in the format of a machine image) and the machine image release date does not represent the most recent update or version of either CloudMan or Galaxy. Versions of those tools can be seen (and automatically updated, with the Update button in the CloudMan Admin page) once an instance has been instantiated (we are also looking into a more explicit form of making this information available).

Deprecated AMIs

AMI: ami-b45e59de
Name: Galaxy-CloudMan-1457720469 (active dates: 2016-03-24 -> 2016-11-01)
AMI: ami-d5246abf
Name: Galaxy-CloudMan-1449500413 (active dates: 2015-12-18 -> 2016-03-24)
AMI: ami-d1c77fba
Name: Galaxy-CloudMan-1440625733 (active dates: 2015-09-03 -> 2015-12-18)
AMI: ami-a7dbf6ce
Name: Galaxy CloudMan 2.3 (active dates: 2014-01-07 -> 2015-09-03)
AMI: ami-118bfc78
Name: 861460482541/Galaxy CloudMan 2.0
AMI: ami-da58aab3
Name: 861460482541/galaxy-cloudman-2011-03-22
AMI: ami-9a7485f3
Name: 861460482541/galaxy-cloudman-2010-01-12
AMI: ami-228a7e4b
Name: 115971652512/galaxy-cloudman-2010-10-08
AMI: ami-ed03ed84
Name: 115971652512/galaxy-2010-04-20_2
Note, the AMI ami-561bc93f, 072133624695/galaxy-cloudman-2012-02-26 is from unknown origin, and not supported.

Citing and Publications
If Galaxy on the Cloud has been significant to a project that has led to an academic publication, please acknowledge the contribution by citing the following paper:

Afgan E., Baker D., Coraor N., Goto H., Paul I.M., Makova K.D., Nekrutenko A., Taylor J., "Harnessing cloud computing with Galaxy Cloud," Nature Biotechnology, Vol 29, Issue 11, 2011.
Thank you!

For a complete list of publications and presentations linked to CloudMan and Galaxy on the Cloud, see this page
```

### Ten Simple Rules for Setting up a Galaxy Instance as a Service

https://galaxyproject.org/admin/ten-simple-steps-galaxy-as-a-service/

```
Ten Simple Rules for Setting up a Galaxy Instance as a Service
Admin
Get Galaxy
Config
Tool Shed
Data Libs
Datatypes
Develop
Quotas
FAQ
Tutorials
CloudMan
Hans-Rudolf Hotz (hrh@fmi.ch)¹⋅², Jochen Bick (jochen.bick@usys.ethz.ch)³, Nikolay Aleksandrov Vazov (n.a.vazov@usit.uio.no)⁴, Björn Grüning (gruening@informatik.uni-freiburg.de)⁵⋅⁶

1) Friedrich Miescher Institute for Biomedical Research, Basel, Switzerland
2) Swiss Institute of Bioinformatics, Basel, Switzerland
3) ETH Zürich, Switzerland
4) University of Oslo, Norway
5) Albert-Ludwigs-Universität, Freiburg, Germany
6) German Network of Bioinformatics Infrastructure (de.NBI), Freiburg, Germany

Galaxy is an open source, web-based platform for data intensive biomedical research (https://galaxyproject.org). Its popularity has been steadily increasing world wide well beyond the Bioinformatics field. More and more public and private Galaxy servers are being set up. Providing 10 basic rules, this document tells you what is important when you set up a Galaxy server from scratch, what are the pitfalls you might run into, how to interact with the potential users of the service you are going to offer, how to make efficient use of your resources, and how to make sure, the Galaxy instance you have set up is really used in the end. Although, the Galaxy platform is evolving very fast, these rules will continue to be applicable, because they are very general, and less of a technical nature. This article has been based on a presentation given at the Training Day at the Galaxy Community Conferences in Norwich, UK and Bloomington, IN in July 2015 and June 2016, respectively.

Rule 1: There is no such thing as 'Free Lunch'
Although, the initial setup up of a Galaxy instance is simple, running, maintaining and adjusting the server to your needs will absorb resources. Providing a Galaxy instance for a group of different users or even a whole institute, is not the same as running and using Galaxy just for yourself. You have to make a commitment at the start, but you will gain a lot, and if you do it right, you will have exponential growth for the use of Galaxy. Obviously, the more users you have and the fancier your local adjustments are, the more time you have to invest. If you run a Bioinformatics support facility, you will eventually have less work to do, as more and more (repetitive) tasks can be delegated to Galaxy.

Rule 2: Check: what are you actually asked for
Before you start any work, talk to the person(s) who asked you to set up a Galaxy server. Why Galaxy and what is the expectation? Even more important (in case they are not the same) talk to the people who will use your service. What do they want to use Galaxy for? Are they aware of the many public Galaxy servers in addition the instance offered by the Galaxy team? Or, are other tools and resources better suited for the expected tasks? Once, you agreed on using Galaxy, you need to define which tools the new Galaxy server should offer. The Galaxy Tool Shed provide access to thousands of freely available tools and dependencies packages. Getting tools from the Tool Shed also helps to manage external tool dependencies. Of course you can develop your own tools. Often this might be the very reason why setting up a new, local Galaxy server. But keep in mind, there is no need for inventing the wheel again. Most likely, you can improve an existing tool instead. If you develop your own tools, please consider sharing them with the community and make them available through the Galaxy Tool Shed. There are also other decisions you need to make early, which you hopefully can agree on during these discussions with the potential users and sponsors, as they will have effects on how to set-up the server:

Will this be a public server, or just an internal service for your lab or institute?
Do you rely on local (i.e. Galaxy managed) or on external authentication?
Will there be sensible data on the server?
Will the data be stored in one place or distributed?
Do you want to put users in groups?
Rule 3: Check: what resources do you have / need
First, you need technical resources: Galaxy itself doesn't require much resources. The jobs executed on the Galaxy server do, and they might be very demanding. Based on the agreed list of tools and the expected number of users and amount of data, you need to estimate how many cpus, how much memory, and how much and what kind of storage will be required. Looking at the current rate of increase in amount of Biological data produced, it is probably best to at least double the numbers you come up with. If such hardware is not at hand, you can look at cloud solutions.

Second, you need human resources: If running locally, someone needs to do all the system admin task for the machine the Galaxy server will run on. Can you delegate this to your IT department? Check with your IT department, whether they allow the creation of an extra linux user, the Galaxy server will run as. Having insufficient support from your IT department is another reason to look at cloud solutions or to check the possibility to acquire a pre-configured server with a fully operational Galaxy instance. Whatever solution fits best for you, you always need a 'Galaxy Admin' person. This person does not need to be a 'Sys Admin'. But it is recommended, this person has write access to the Galaxy code, can restart the Galaxy server, and has write access to the Galaxy database. You can share this role among several people. The 'Galaxy Admin' gets an additional "Admin" menu item in the top bar when logged in. This menu item will open an extra page with many admin related tools.

Rule 4: Start small, but right
As you will go through a learning process yourself, make sure the initial service you offer is as small and simple as possible. Nevertheless, there are a few points to check, when you start offering a production Galaxy server. By default, Galaxy uses SQLite and a built-in HTTP server. This configuration works for initial development and testing. It does not work for deployment, as it can not handle concurrent jobs. The switch from SQLite to PostgreSQL as the engine for the database server running the Galaxy instance should be considered at an early stage. Using a proxy server (like Apache or nginx) allows you to delegate certain tasks (e.g. serving static content).
Have a look at other installations and check the Galaxy Community Log Board - a place to share how you addressed a particular problem or task. Take notes of all your changes and actions (setup, configurations, modifications, etc.), and consider storing config files in a version control system.

Rule 5: Set up only what you have been asked to
At least in the beginning: don't confuse your users with too many tools. It is also easier for you to manage the whole system, when only a small number of tools are offered. You can always expand the list of tools later depending on demand and feedback. To avoid users being overwhelmed by a long list of tools, you can limit the choice of tools to the individual users or group of users by restricting tool visibility. You might need to restrict tool usage due to licensing issues (/src/admin/config/access-control/). This kind of access control is also good for testing new tools, where only a selected group of user will see the tools and help you testing before open up the tool to everyone. In a simple setup, the Galaxy jobs are executed on the server on which the Galaxy application was started using the built in job scheduler. You can limit the maximum number of concurrent jobs in total or per user. If necessary, you can set up separate job submission queues for the different tools even on a single box using the built in job scheduler making sure slow and resource intensive jobs do not block quick jobs. Though, the recommended way is to use a distributed resources managers on a single box as well. However, no matter how small or big your Galaxy installation is, make sure you have a production server and a development server (the development server has to be as similar as possible to the production server); and make sure you backup your server (including the PostgreSQL database).

Rule 6: Know the tools you offer
First, make sure you know how to use galaxy. Second, understand the tools you offer. Remember, Galaxy is just a convenient wrapper around command line tools. Knowing how to execute them on the command line will be very helpful or even required to debug problems your users might run into (see also below). Hence, it is advisable, if you can rely on available expert knowledge (e.g. in Bioinformatics). You might want to restrict options in certain tools, in order to prevent the possibilities of users executing jobs with unreasonable parameters, which might use too much memory for your local set-up.

Rule 7: Set up the 'reports application'
The administration tools, you have access to as the 'Galaxy Admin', provide you with some data about the usage of your server. Much more information can be obtained by starting up the reports application. You can check numbers like “Today's jobs”, “All unfinished jobs”, “Jobs per tool”, “Jobs per user”, “User disk usage”, etc. The 'reports application' also tells you which command was executed for each job. This will get handy, if you need to debug a tool. As you can rerun the command yourself on the command line. Nevertheless, get familiar with the (PostgreSQL) database. This will allow you to execute queries which are not (yet) covered by the 'reports application'. Additional (system) information about each executed job can be logged by activating plugins in the "./config/job_metrics_conf.xml" file.

Rule 8: Prevent data duplication
Galaxy has sometimes the bad reputation, that it will cause data duplication. It is true, a user can repeat the same job ten times and thereby duplicate the data ten times. But this is not really Galaxy's fault, is-it? Nevertheless, there are several options for an economical use of the storage resources. By default, Galaxy stores each history item (representing input data or a result) as a dataset file within the Galaxy directory tree. An individual user will accumulate many histories with a lot of datasets, some of them might be very large. A simple way to control the growth, is setting disk usage quotas for users or groups. Make sure you run the cleanup scripts to purge the deleted datasets on a regular basis. Users can prevent duplication both in terms of storage and compute resources by sharing their histories with other users, so they don’t have to repeat the analysis (and thereby duplicate the data). The use of Data Libraries gives you the possibility to use a dataset by any number of users any number of times without duplicating the file on disk. 'Data Libraries' also allows you to work with data not stored within the Galaxy directory tree. Many tools (like bowtie, BLAST, etc) need reference data, like (indexed) sequence data. Galaxy uses location files (“/tool-data/*.loc’) to tell the tools where to find the required data. 'Data Managers' which are available from the Tool Shed help you to download and index such data and adjust the location files automatically. Alternatively, you can manually edit the location files pointing to existing data and indices. This way you not only prevent data duplication, you also make sure, Galaxy users (and non Galaxy users) use the same reference data.
Rule 9: Offer training
Although, there are many resources to learn how to use Galaxy, the best way to promote your new service is to offer training. This can be done face to face or in class. There are many examples for training courses available (https://training.galaxyproject.org/) on which you can build your own training sessions. You need to explain site specific set ups of your Galaxy server, e.g. access to the fastq files produced in your local NGS facility via 'Data Libraries'. Of course, if your local Galaxy server includes specialised tools, you have to introduce them. Prepare a good training data set, which will run quickly through your tools. If your own tools take a long time to run, it might be advisable to have a pre-run history ready, which you can share with your students. During a Galaxy training session, you will have more users running tools at the same time than normal. Hence, running a training session is also a good way of stress testing your server.

Rule 10: Keep the Galaxy software (and yourself) up to date
Unless you have a very good reason, make sure your are running the latest (or at least a recent) Galaxy version. This way, it is easier for others to help you. Also, the issue you encounter might already be fixed in the current release. Obviously, doing updates are easier when they don't span several releases. (https://docs.galaxyproject.org/en/master/releases/index.html). In order to minimize the downtime, the authors suggest the following update procedure:

Announce the upgrade and expected down time of the production server one week in advance.
During that week, install a new test server from scratch. This gives you the opportunity to learn about the new features of the Galaxy release.
Update the code of the test server you installed, at the last update. This will show you what you will encounter during the update (e.g. is a change of the database schema required).
Confident, with what to expect of the new release, update your development server. At this stage, you can catch any problems which might be caused by your site specific modifications.
And finally, update the production server.
This way, doing an update is easy, as you are well prepared, when you do the changes on the production server and the down time will be minimal. This procedure needs to be adjusted to your local needs: consider stopping job submissions to the queuing system.

Equally important is to keep yourself up to date: read the monthly news letters "Galactic News" and the release notes (https://docs.galaxyproject.org/en/master/releases/index.html), follow the mailing lists and follow Twitter (hashtag: #usegalaxy). There is a "Galaxy-Admins" discussion group, which meets regularly using telephone conferences. The best place to get to know the latest developments in the Galaxy community is to go to the annual Galaxy Community Conference. There are also many other Galaxy related events around the globe throughout the year. Knowing about the new features is one thing, actually looking into them and test them yourself is another issue which will take time. But this is time very well invested.
```

### Galaxy MethylIT testing report

This message was shared with our galaxy expert:

```
Dear Greg CC Hardik,

Our lab member Hardik zoomed with me during a Galaxy MethylIT execution.
Based on our testing, I share just two problems/ideas about running Galaxy MethylIT.

1. TAIR10: Problem using tair10 gene annotation in the final step, "Count DMPs at gene-body"
2. SEEING DATA: Inability to see current objects: we want to see, for example, GRanges items in our history

I summarize these issues below.

Hardik is the first (and only) to walk the Galaxy MethylIT with me.  (Thanks Hardik!)
Except for the last-step failure (item 1) and the inability to see objects (item 2), this testing session looked pretty good.

UNRELATED UPDATES:
I added more RAM, physically, to the galaxy machine, at 16GB, our testing jobs have enough RAM.
I may try to copy our galaxy to a larger machine in the lab, with 256GB RAM, to allow for bigger testing jobs.
I will send you updates, like this one, as news comes in.

Thanks,
Tom

TAIR10 problem:

We got successfully through an entire execution of Arabidopsis analysis until
the last tool, "MethylIT: Count DMPs at gene-body".  When I click upon the
eyeball, aka "View data" of the "process log" in my history, this text shows
up alone in the middle pane:

Error in readGFF(filepath, version = version, filter = filter) :
  reading GFF file: line 1 has less than 8 tab-separated columns
Calls: readGFFAsGRanges -> readGFF
Execution halted

That makes me think that perhaps the tair10 gene annotation that we used has a problem.
Right now in our dev/test server, this tool allows me to choose between two items
found in the form under label "Using gene annotations":

- hg38chr13
- tair10

As you know, the "hg38chr13" works good with the cancer example.  I have not seen
the tair10 work yet.  I also do not know how it got there or how I can put one in
there myself.  I have some small soybean data and so it would be nice to know how to
add to the list of items under "Using gene annotations" on the form found in the tool named
"MethylIT: Count DMPs at gene-body"

For troubleshooting I have tried a few things, without luck, including:

- changing our input counts files to use "chr1" instead of "1" for each of the chromosome names
- trying to analyze only one chromosome (by using "pattern" in the "Convert Read counts" tool)



SEEING DATA:

During our test run, we knew what should have been in the objects created by our history: we know
what should be in the output of "Estimate Divergence" or "Select cytosine positions" and it would be
nice to be able to click the "Download" button in our history and get the "RData" file to view it on
our machine, or to see it somehow in Galaxy.  When I click on the "Download" button in history I get
a file with a name like this and linux "file" command tells me that its a gzip:

$ file Galaxy573-\[MethylIT__Estimate_divergence_\(infDiv\)_on_data_511\,_data_510\,_and_others\].infdiv
Galaxy573-[MethylIT__Estimate_divergence_(infDiv)_on_data_511,_data_510,_and_others].infdiv: gzip compressed data, from Unix

..now if I rename it to have a ".gz" extension, then gunzip will uncompress it:

$ mv Galaxy573-\[MethylIT__Estimate_divergence_\(infDiv\)_on_data_511\,_data_510\,_and_others\].infdiv Galaxy573.gz
$ gunzip Galaxy573.gz

..and now I see that "file" command says it is "data", which is exactly what "file" says that real ".RData" files are:

$ mv Galaxy573 Galaxy573.RData
$ file Galaxy573.RData
Galaxy573.RData: data

..so far it looks like I might have a real .RData archive, but when I open it in R, with load(), its not good.
Here we see, in R, that I cannot load() that file:

> load("Galaxy573.RData")
Error in load("Galaxy573.RData") :
  bad restore file magic number (file may be corrupted) -- no data loaded
In addition: Warning messages:
1: In readChar(con, 5L, useBytes = TRUE) :
  truncating string with embedded nuls
2: file ‘Galaxy573.RData’ has magic number 'X'
  Use of save versions prior to 2 is deprecated
> q()

..and I think that error message "Use of save versions prior to 2 is deprecated" is bogus.
I don't think this thing is any kind of RData archive file but I am not sure about that.
The next thing we can try is to look inside this strange file from the Galaxy MethylIT Estimate Divergence tool.
Here we run strings on it and see that this file does contain familiar looking things:

$ strings Galaxy573.RData |head -44|tr '\n' ' '
UTF-8 seqnames values levels chr1 chr2 chr3 chr4 chr5 class factor lengths elementMetadata NULL metadata package S4Vectors strand factor S4Vectors ranges start width NAMES elementType IRanges IRanges seqinfo chr1 chr2 chr3 chr4 chr5 seqlengths is_circular genome Seqinfo
                                                                                                                                    GenomeInfoDb rownames nrows listData  %@2 ^c(? ^c(?


All of the files that we want to see in Galaxy MethylIT are like this example.
We could use the Boxplot and Histogram tools but it will be nice, if possible,
to see the real output object, an RData archive would be nice.

### Galaxy MethylIT arabidopsis files for testing

These file URLs were used during mostly successful Galaxy MethylIT testing:
```
memoryLine_100k_CG_chrPrefix_WandM3_12345
http://li1077-179.members.linode.com/memoryLine_100k/memory_W_3_1_100k_chrPrefix.txt
http://li1077-179.members.linode.com/memoryLine_100k/memory_W_3_2_100k_chrPrefix.txt
http://li1077-179.members.linode.com/memoryLine_100k/memory_W_3_3_100k_chrPrefix.txt
http://li1077-179.members.linode.com/memoryLine_100k/memory_W_3_4_100k_chrPrefix.txt
http://li1077-179.members.linode.com/memoryLine_100k/memory_W_3_5_100k_chrPrefix.txt
http://li1077-179.members.linode.com/memoryLine_100k/memory_M_3_1_100k_chrPrefix.txt
http://li1077-179.members.linode.com/memoryLine_100k/memory_M_3_2_100k_chrPrefix.txt
http://li1077-179.members.linode.com/memoryLine_100k/memory_M_3_3_100k_chrPrefix.txt
http://li1077-179.members.linode.com/memoryLine_100k/memory_M_3_4_100k_chrPrefix.txt
http://li1077-179.members.linode.com/memoryLine_100k/memory_M_3_5_100k_chrPrefix.txt

memoryLine_100k_CG_chrPrefix_W3_12345
http://li1077-179.members.linode.com/memoryLine_100k/memory_W_3_1_100k_chrPrefix.txt
http://li1077-179.members.linode.com/memoryLine_100k/memory_W_3_2_100k_chrPrefix.txt
http://li1077-179.members.linode.com/memoryLine_100k/memory_W_3_3_100k_chrPrefix.txt
http://li1077-179.members.linode.com/memoryLine_100k/memory_W_3_4_100k_chrPrefix.txt
http://li1077-179.members.linode.com/memoryLine_100k/memory_W_3_5_100k_chrPrefix.txt

memoryLine_100k_CG_chrPrefix_M3_12345
http://li1077-179.members.linode.com/memoryLine_100k/memory_M_3_1_100k_chrPrefix.txt
http://li1077-179.members.linode.com/memoryLine_100k/memory_M_3_2_100k_chrPrefix.txt
http://li1077-179.members.linode.com/memoryLine_100k/memory_M_3_3_100k_chrPrefix.txt
http://li1077-179.members.linode.com/memoryLine_100k/memory_M_3_4_100k_chrPrefix.txt
http://li1077-179.members.linode.com/memoryLine_100k/memory_M_3_5_100k_chrPrefix.txt
```


### Galaxy test with different seqnames for memory 100k counts files


```
tmaher@ubuntu:/var/www/html/memoryLine_100k$ ls *100k.txt|sed 's/\(.*\)\(.txt\)/cat \1\2 |egrep "^1|^2|^3|^4|^5"|sed "s#^#chr#" > \1_chrPrefix\2;sleep 1;/'
cat memory_M_2_1_100k.txt |egrep "^1|^2|^3|^4|^5"|sed "s#^#chr#" > memory_M_2_1_100k_chrPrefix.txt;sleep 1;
cat memory_M_2_2_100k.txt |egrep "^1|^2|^3|^4|^5"|sed "s#^#chr#" > memory_M_2_2_100k_chrPrefix.txt;sleep 1;
cat memory_M_2_3_100k.txt |egrep "^1|^2|^3|^4|^5"|sed "s#^#chr#" > memory_M_2_3_100k_chrPrefix.txt;sleep 1;
cat memory_M_2_4_100k.txt |egrep "^1|^2|^3|^4|^5"|sed "s#^#chr#" > memory_M_2_4_100k_chrPrefix.txt;sleep 1;
cat memory_M_2_5_100k.txt |egrep "^1|^2|^3|^4|^5"|sed "s#^#chr#" > memory_M_2_5_100k_chrPrefix.txt;sleep 1;
cat memory_M_3_1_100k.txt |egrep "^1|^2|^3|^4|^5"|sed "s#^#chr#" > memory_M_3_1_100k_chrPrefix.txt;sleep 1;
cat memory_M_3_2_100k.txt |egrep "^1|^2|^3|^4|^5"|sed "s#^#chr#" > memory_M_3_2_100k_chrPrefix.txt;sleep 1;
cat memory_M_3_3_100k.txt |egrep "^1|^2|^3|^4|^5"|sed "s#^#chr#" > memory_M_3_3_100k_chrPrefix.txt;sleep 1;
cat memory_M_3_4_100k.txt |egrep "^1|^2|^3|^4|^5"|sed "s#^#chr#" > memory_M_3_4_100k_chrPrefix.txt;sleep 1;
cat memory_M_3_5_100k.txt |egrep "^1|^2|^3|^4|^5"|sed "s#^#chr#" > memory_M_3_5_100k_chrPrefix.txt;sleep 1;
cat memory_M_4_1_100k.txt |egrep "^1|^2|^3|^4|^5"|sed "s#^#chr#" > memory_M_4_1_100k_chrPrefix.txt;sleep 1;
cat memory_M_4_2_100k.txt |egrep "^1|^2|^3|^4|^5"|sed "s#^#chr#" > memory_M_4_2_100k_chrPrefix.txt;sleep 1;
cat memory_M_4_3_100k.txt |egrep "^1|^2|^3|^4|^5"|sed "s#^#chr#" > memory_M_4_3_100k_chrPrefix.txt;sleep 1;
cat memory_M_4_4_100k.txt |egrep "^1|^2|^3|^4|^5"|sed "s#^#chr#" > memory_M_4_4_100k_chrPrefix.txt;sleep 1;
cat memory_M_4_5_100k.txt |egrep "^1|^2|^3|^4|^5"|sed "s#^#chr#" > memory_M_4_5_100k_chrPrefix.txt;sleep 1;
cat memory_M_5_1_100k.txt |egrep "^1|^2|^3|^4|^5"|sed "s#^#chr#" > memory_M_5_1_100k_chrPrefix.txt;sleep 1;
cat memory_M_5_2_100k.txt |egrep "^1|^2|^3|^4|^5"|sed "s#^#chr#" > memory_M_5_2_100k_chrPrefix.txt;sleep 1;
cat memory_M_5_3_100k.txt |egrep "^1|^2|^3|^4|^5"|sed "s#^#chr#" > memory_M_5_3_100k_chrPrefix.txt;sleep 1;
cat memory_M_5_4_100k.txt |egrep "^1|^2|^3|^4|^5"|sed "s#^#chr#" > memory_M_5_4_100k_chrPrefix.txt;sleep 1;
cat memory_M_5_5_100k.txt |egrep "^1|^2|^3|^4|^5"|sed "s#^#chr#" > memory_M_5_5_100k_chrPrefix.txt;sleep 1;
cat memory_M_6_1_100k.txt |egrep "^1|^2|^3|^4|^5"|sed "s#^#chr#" > memory_M_6_1_100k_chrPrefix.txt;sleep 1;
cat memory_M_6_2_100k.txt |egrep "^1|^2|^3|^4|^5"|sed "s#^#chr#" > memory_M_6_2_100k_chrPrefix.txt;sleep 1;
cat memory_M_6_3_100k.txt |egrep "^1|^2|^3|^4|^5"|sed "s#^#chr#" > memory_M_6_3_100k_chrPrefix.txt;sleep 1;
cat memory_M_6_4_100k.txt |egrep "^1|^2|^3|^4|^5"|sed "s#^#chr#" > memory_M_6_4_100k_chrPrefix.txt;sleep 1;
cat memory_M_6_5_100k.txt |egrep "^1|^2|^3|^4|^5"|sed "s#^#chr#" > memory_M_6_5_100k_chrPrefix.txt;sleep 1;
cat memory_W_2_1_100k.txt |egrep "^1|^2|^3|^4|^5"|sed "s#^#chr#" > memory_W_2_1_100k_chrPrefix.txt;sleep 1;
cat memory_W_2_2_100k.txt |egrep "^1|^2|^3|^4|^5"|sed "s#^#chr#" > memory_W_2_2_100k_chrPrefix.txt;sleep 1;
cat memory_W_2_3_100k.txt |egrep "^1|^2|^3|^4|^5"|sed "s#^#chr#" > memory_W_2_3_100k_chrPrefix.txt;sleep 1;
cat memory_W_2_4_100k.txt |egrep "^1|^2|^3|^4|^5"|sed "s#^#chr#" > memory_W_2_4_100k_chrPrefix.txt;sleep 1;
cat memory_W_2_5_100k.txt |egrep "^1|^2|^3|^4|^5"|sed "s#^#chr#" > memory_W_2_5_100k_chrPrefix.txt;sleep 1;
cat memory_W_3_1_100k.txt |egrep "^1|^2|^3|^4|^5"|sed "s#^#chr#" > memory_W_3_1_100k_chrPrefix.txt;sleep 1;
cat memory_W_3_2_100k.txt |egrep "^1|^2|^3|^4|^5"|sed "s#^#chr#" > memory_W_3_2_100k_chrPrefix.txt;sleep 1;
cat memory_W_3_3_100k.txt |egrep "^1|^2|^3|^4|^5"|sed "s#^#chr#" > memory_W_3_3_100k_chrPrefix.txt;sleep 1;
cat memory_W_3_4_100k.txt |egrep "^1|^2|^3|^4|^5"|sed "s#^#chr#" > memory_W_3_4_100k_chrPrefix.txt;sleep 1;
cat memory_W_3_5_100k.txt |egrep "^1|^2|^3|^4|^5"|sed "s#^#chr#" > memory_W_3_5_100k_chrPrefix.txt;sleep 1;
cat memory_W_4_1_100k.txt |egrep "^1|^2|^3|^4|^5"|sed "s#^#chr#" > memory_W_4_1_100k_chrPrefix.txt;sleep 1;
cat memory_W_4_2_100k.txt |egrep "^1|^2|^3|^4|^5"|sed "s#^#chr#" > memory_W_4_2_100k_chrPrefix.txt;sleep 1;
cat memory_W_4_3_100k.txt |egrep "^1|^2|^3|^4|^5"|sed "s#^#chr#" > memory_W_4_3_100k_chrPrefix.txt;sleep 1;
cat memory_W_4_4_100k.txt |egrep "^1|^2|^3|^4|^5"|sed "s#^#chr#" > memory_W_4_4_100k_chrPrefix.txt;sleep 1;
cat memory_W_4_5_100k.txt |egrep "^1|^2|^3|^4|^5"|sed "s#^#chr#" > memory_W_4_5_100k_chrPrefix.txt;sleep 1;
cat memory_W_5_1_100k.txt |egrep "^1|^2|^3|^4|^5"|sed "s#^#chr#" > memory_W_5_1_100k_chrPrefix.txt;sleep 1;
cat memory_W_5_2_100k.txt |egrep "^1|^2|^3|^4|^5"|sed "s#^#chr#" > memory_W_5_2_100k_chrPrefix.txt;sleep 1;
cat memory_W_5_3_100k.txt |egrep "^1|^2|^3|^4|^5"|sed "s#^#chr#" > memory_W_5_3_100k_chrPrefix.txt;sleep 1;
cat memory_W_5_4_100k.txt |egrep "^1|^2|^3|^4|^5"|sed "s#^#chr#" > memory_W_5_4_100k_chrPrefix.txt;sleep 1;
cat memory_W_5_5_100k.txt |egrep "^1|^2|^3|^4|^5"|sed "s#^#chr#" > memory_W_5_5_100k_chrPrefix.txt;sleep 1;
cat memory_W_6_1_100k.txt |egrep "^1|^2|^3|^4|^5"|sed "s#^#chr#" > memory_W_6_1_100k_chrPrefix.txt;sleep 1;
cat memory_W_6_2_100k.txt |egrep "^1|^2|^3|^4|^5"|sed "s#^#chr#" > memory_W_6_2_100k_chrPrefix.txt;sleep 1;
cat memory_W_6_3_100k.txt |egrep "^1|^2|^3|^4|^5"|sed "s#^#chr#" > memory_W_6_3_100k_chrPrefix.txt;sleep 1;
cat memory_W_6_4_100k.txt |egrep "^1|^2|^3|^4|^5"|sed "s#^#chr#" > memory_W_6_4_100k_chrPrefix.txt;sleep 1;
cat memory_W_6_5_100k.txt |egrep "^1|^2|^3|^4|^5"|sed "s#^#chr#" > memory_W_6_5_100k_chrPrefix.txt;sleep 1;
tmaher@ubuntu:/var/www/html/memoryLine_100k$ ls *100k.txt|sed 's/\(.*\)\(.txt\)/cat \1\2 |egrep "^1|^2|^3|^4|^5"|sed "s#^#chr#" > \1_chrPrefix\2;sleep 1;/'|/bin/sh
```
### Galaxy test nearly successful on 100k tair10 arabidopsis testing

Galaxy user hsk aka tester tester helped run an entire Galaxy MethylIT test.


### netstat output to nih on galaxy server during Get GEO tool execution

Here is the **netstat -taW** seen on galaxy server pc34 during an attempt to run
the Galaxy MethylIT tool named "Get GEO..":
```
tcp        0      0 E1-052734.science.psu.edu:51900 ftp22-1.be-md.ncbi.nlm.nih.gov:https TIME_WAIT
```
..and we are getting breast cancer and/or ESC files.

### galaxy MethylIT OOM killer problem

Sent to Galaxy expert:
```
No, 8GB is not enough amount of memory.  Here is a kernel log message from a machine with 1000GB, 1TB of RAM:

[Fri Oct 23 07:55:09 2020] Out of memory: Kill process 1705 (R) score 985 or sacrifice child

[Fri Oct 23 07:55:09 2020] Killed process 1705 (R), UID 1002, total-vm:1057936536kB, anon-rss:1040279728kB, file-rss:48kB, shmem-rss:0kB


That happened to someone in RStudio-server and there is almost never any way for them to know about it because the rstudio-server client gives no indication of any problem.  They will see an error a few lines of code later, when they try to access the object that got OOM-killered, then they will see an R error like this:

Error: object 'HD' not found


..even though their code is correct and, with a bigger machine, HD would be created and found.
Both estimateDivergence and gofReport are the functions that use too much RAM. We have done much to minimize this problem but big data is a problem.  We have big machines and do not normally process human data and so too little RAM is not usually a problem.

When it is a problem, we can process one chromosome at a time, save objects to disk, remove the large object (to reclaim the RAM) and move onto the next chromosome.  This solution makes the code very ugly, something like this where we calls to functions save, rm and load that normally would not be required:

HD_chr1 = estimateDivergence(...)
save(HD_chr1,file="/data/HD_chr1.RData")
rm(HD_chr1)

load(file="/data/HD_chr1.RData")
gof_chr1 = gofReport(HD_chr1,...)

MethylIT is very sensitive to its "num.cores" parameter in most functions.  Therefore, if we have RAM exhaustion problems, then we can change from "num.cores=64" to "num.cores=2" and dramatically reduce the RAM consumption (even nearly linearly, so, for example changing code from 64 cores to 2 cores, we can see nearly 30-fold decrease in memory usage, and a nearly 30-fold increase in runtime).
Even with clever programming, dozens of samples of human/tomato/soybean/big data will need hundreds of gigabytes of RAM.
```

### galaxy MethylIT video

Available right here: youtu.be/xYYLCg6Fm9Q
..embed code:
```
<iframe width="560" height="315" src="https://www.youtube.com/embed/xYYLCg6Fm9Q" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
```
..and an intro mail:
```
Dear Galaxy MethylIT users,

There is a new Galaxy MethylIT movie available right here: youtu.be/xYYLCg6Fm9Q
This movie is unlisted, has no sound, and runs 18 minutes.
The intention is to help a new user run the cancer example in MethylIT on Galaxy.
It shows how to manually perform a MethylIT analysis on Galaxy.
If you follow the steps shown in the movie on our dev/test server, it will take about 30 minutes.
We can see that our Galaxy expert Greg has done a great job--we go from counts on GEO to DMGs.
I am currently working with Greg to test and troubleshoot and learn to overcome some persisting problems.
The movie makes things look easy but in real life there have been many errors and crashings.
I will share more updates as we make progress.

Thanks,
Tom
```


### troubleshooting vidao of galaxy run of cancer example

Found here:

youtu.be/zF3IcAIMspY

```
MethylIT on Galaxy cancer example part 1, gets 2 sets of 3 files of WGBS data from GEO, runs up until launching "Convert Read counts to GRanges list"
```

Video is unlisted

### galaxy run of cancer example

Here we tried to start a summary of MethylIT execution but it ended up again as it did on
yesterday where the machine became unresponsive and now, 1438pm, its surely dead and needs
a visit.

We make notes along the way:
* Get GEO supplemental file:
    * ESC files, we just put in the 3 GEO numbers, comma separated, hit execute, job 184
    * cancer files, we just put in the 3 GEO numbers, comma separated, hit execute, job 190
    * these two jobs went fast and easy
* Convert read counts to GRanges list
    * At the top we choose **Collection of files** and then our two previously created jobs appear in selection box
    * ESC files, job 194, **194: MethylIT: Convert Read counts on data 188, data 187 and data 186 a list**
        * the form allowed us to specify the column numbers and item
        * the history, of item 184, let us see there are 5 columns, chromosome, start, strand, meth-counts, unmeth-counts
        * we click to **Insert column* four times to add four more columns in addition to the 1/chromosome that was already there
        * we named the sample ID with comma separated list **ESC1,ESC1,ESC1**
        * TAKING VERY LONG
            * RECALL that this job failed during our suspected disk problems on yesterday
            * we remain logged in to pc34 but its mostly unresponsive,
            * my attempt to run **w** has so far only shown the two keystrokes: **w** and **RETURN** after several minutes
            * we can ping from titan, even an hour after unresponsiveness
            * my **w** and **RETURN** are still there, one hour later, still logged in, but nothing, as if machine were overloaded
            * earlier on **Get GEO** jobs, the **w** output swelled to 10 for several minutes and htop was very busy with python, galaxy, postgres
            * dmesg has been clean until now when we cannot do anything
            * running **ssh -vv** does not work but does show, quickly, a good response, including::
                * debug1: Connecting to 128.118.84.68 [128.118.84.68] port 22.
                * debug1: Connection established.
            * strangely, I think I have hit these keys on pc34: w,ENTER,w,ENTER,ENTER,ENTER
            * ..and that very first **w ENTER** took some time to become visible and remained there, stuck for an hour, but
            * ..after an hour and no **w** output, I hit the space bar twice and those two spaces did show up, but not the previous keys and no output
            * **FINALLY** after more than one hour, ping fails:

```
ssh -vv 128.118.84.68
OpenSSH_7.4p1, OpenSSL 1.0.2k-fips  26 Jan 2017
debug1: Reading configuration data /home/twm118/.ssh/config
debug1: Reading configuration data /etc/ssh/ssh_config
debug1: /etc/ssh/ssh_config line 58: Applying options for *
debug2: resolving "128.118.84.68" port 22
debug2: ssh_connect_direct: needpriv 0
debug1: Connecting to 128.118.84.68 [128.118.84.68] port 22.
debug1: Connection established.
```
(base) [64 ~]$ ping -c 3 e1-052734
PING E1-052734.science.psu.edu (128.118.84.68) 56(84) bytes of data.

--- E1-052734.science.psu.edu ping statistics ---
3 packets transmitted, 0 received, 100% packet loss, time 1999ms

(base) [64 ~]$ date
Tue Nov  3 14:33:29 EST 2020
```



### galaxy machine restored via ddrescue cloned disk

The machine still gets very busy on poolFromGRList, running now,
and the last one failed but not much error info to be found, no kernel
error or /var/log/messages trouble.  Galaxy browser remained yellow and
did not update even after we could see linux load, via w, was down low for
minutes.  After refresh browser window, then both 180 and 181 jobs were red
but nothing to see how it failed.  Right now we try again, 183 and 182, yellow,
poolFromGRlist on data 179 178 177.  Here we see loaded machine

```
-bash-4.2$ w
 11:27:50 up  2:29,  1 user,  load average: 10.48, 6.35, 4.01
USER     TTY      FROM             LOGIN@   IDLE   JCPU   PCPU WHAT
twm118   pts/0    e1-052735.scienc 10:05    6.00s  0.19s  0.00s w
-bash-4.2$ htop
-bash-4.2$ w
 11:31:27 up  2:33,  1 user,  load average: 10.41, 7.59, 4.91
USER     TTY      FROM             LOGIN@   IDLE   JCPU   PCPU WHAT
twm118   pts/0    e1-052735.scienc 10:05   57.00s  0.25s  0.00s w
-bash-4.2$ dmesg -T|tail
[Tue Nov  3 08:59:05 2020] tun: Universal TUN/TAP device driver, 1.6
[Tue Nov  3 08:59:05 2020] tun: (C) 1999-2004 Max Krasnyansky <maxk@qualcomm.com>
[Tue Nov  3 08:59:05 2020] virbr0: port 1(virbr0-nic) entered blocking state
[Tue Nov  3 08:59:05 2020] virbr0: port 1(virbr0-nic) entered disabled state
[Tue Nov  3 08:59:05 2020] device virbr0-nic entered promiscuous mode
[Tue Nov  3 08:59:05 2020] virbr0: port 1(virbr0-nic) entered blocking state
[Tue Nov  3 08:59:05 2020] virbr0: port 1(virbr0-nic) entered listening state
[Tue Nov  3 08:59:05 2020] IPv6: ADDRCONF(NETDEV_UP): virbr0: link is not ready
[Tue Nov  3 08:59:05 2020] virbr0: port 1(virbr0-nic) entered disabled state
[Tue Nov  3 08:59:07 2020] NFSD: starting 90-second grace period (net ffffffff8a115c00)
```

### backup galaxy machine

```
-bash-4.2$ sudo tar -cf - --exclude "./data" --exclude "./dev" --exclude "./home" --exclude "./run" --exclude "./tmp" --exclude "./lost+found" --exclude "./sys" ./|(ssh e1-052764 'cd /data5/OLD_genomes/autism_cgmap/pc34rootWOdata/;tar -xf -')
twm118@e1-052764's password:
tar: ./boot/efi: implausibly old time stamp 1969-12-31 19:00:00
```
..that got too big and was killed because of /proc/kcore, and so here we do it again
without /proc and we also keep the permissions by only doing gzip at titan, and this
command finished successfully:
```
-bash-4.2$ sudo tar -cf - --exclude "./data" --exclude "./dev" --exclude "./home" --exclude "./run" --exclude "./tmp" --exclude "./lost+found" --exclude "./sys" --exclude "./proc" ./|(ssh e1-052764 'gzip >/data5/OLD_genomes/autism_cgmap/pc34rootWOdata/pc34_galaxy_20201102.tar.gz')
tar: ./opt/galaxy/supervisor_tmp/supervisor.sock: socket ignored
tar: ./var/lib/gssproxy/default.sock: socket ignored
tar: ./var/lib/sss/pipes/private/sbus-dp_default.4469: socket ignored
tar: ./var/lib/sss/pipes/private/sbus-monitor: socket ignored
tar: ./var/lib/sss/pipes/private/sbus-dp_default.29502: socket ignored
tar: ./var/lib/sss/pipes/private/sbus-dp_default.1075: socket ignored
tar: ./var/lib/sss/pipes/private/sbus-dp_default.4133: socket ignored
tar: ./var/lib/sss/pipes/private/sbus-dp_default.4417: socket ignored
tar: ./var/lib/sss/pipes/private/sbus-dp_default.4423: socket ignored
tar: ./var/lib/sss/pipes/private/sbus-dp_default.1094: socket ignored
tar: ./var/lib/sss/pipes/private/pam: socket ignored
tar: ./var/lib/sss/pipes/private/sbus-dp_default.4292: socket ignored
tar: ./var/lib/sss/pipes/private/sbus-dp_default.4219: socket ignored
tar: ./var/lib/sss/pipes/private/sbus-dp_default.4479: socket ignored
tar: ./var/lib/sss/pipes/private/sbus-dp_default.1105: socket ignored
tar: ./var/lib/sss/pipes/private/sbus-dp_default.1098: socket ignored
tar: ./var/lib/sss/pipes/private/sbus-dp_default.1096: socket ignored
tar: ./var/lib/sss/pipes/private/sbus-dp_default.4421: socket ignored
tar: ./var/lib/sss/pipes/private/sbus-dp_default.4572: socket ignored
tar: ./var/lib/sss/pipes/private/sbus-dp_default.942: socket ignored
tar: ./var/lib/sss/pipes/private/sbus-dp_default.16430: socket ignored
tar: ./var/lib/sss/pipes/private/sbus-dp_default.4420: socket ignored
tar: ./var/lib/sss/pipes/private/sbus-dp_default.14399: socket ignored
tar: ./var/lib/sss/pipes/pam: socket ignored
tar: ./var/lib/sss/pipes/nss: socket ignored
tar: ./var/spool/postfix/private/relay: socket ignored
tar: ./var/spool/postfix/private/error: socket ignored
tar: ./var/spool/postfix/private/defer: socket ignored
tar: ./var/spool/postfix/private/scache: socket ignored
tar: ./var/spool/postfix/private/discard: socket ignored
tar: ./var/spool/postfix/private/tlsmgr: socket ignored
tar: ./var/spool/postfix/private/anvil: socket ignored
tar: ./var/spool/postfix/private/virtual: socket ignored
tar: ./var/spool/postfix/private/smtp: socket ignored
tar: ./var/spool/postfix/private/retry: socket ignored
tar: ./var/spool/postfix/private/trace: socket ignored
tar: ./var/spool/postfix/private/local: socket ignored
tar: ./var/spool/postfix/private/bounce: socket ignored
tar: ./var/spool/postfix/private/proxywrite: socket ignored
tar: ./var/spool/postfix/private/proxymap: socket ignored
tar: ./var/spool/postfix/private/lmtp: socket ignored
tar: ./var/spool/postfix/private/verify: socket ignored
tar: ./var/spool/postfix/private/rewrite: socket ignored
tar: ./var/spool/postfix/public/qmgr: socket ignored
tar: ./var/spool/postfix/public/cleanup: socket ignored
tar: ./var/spool/postfix/public/flush: socket ignored
tar: ./var/spool/postfix/public/pickup: socket ignored
tar: ./var/spool/postfix/public/showq: socket ignored
-bash-4.2$
```
..and so now, what the heck, we try /data:
```
-bash-4.2$ sudo tar -cf - ./data/|(ssh e1-052764 'gzip >/data5/OLD_genomes/autism_cgmap/pc34rootWOdata/pc34_galaxy_data_20201102.tar.gz')
```

### rescued galaxy disk with dd_rescue -f -r3 /dev/sda /dev/sdb /var/tmp/dd_rescue_galaxy_20201102.txt

After we have some good tar of / and of /data, now we clone the disk, at the machine:

* turned off PC
* inserted new disk exactly same 1TB size, fdisk reports 931.5GB for each
* booted to cdrom linux, actually we booted to ram with one of the disks because the galaxy PC did not boot from CD tonight
* tried to run **dd_rescue** but it wasn't there
* disconnected ethernet
* ran fdisk and dmesg to see which disk was which
* ran dd_rescue like this:
* **dd_rescue -f -r3 /dev/sda /dev/sdb /var/tmp/dd_rescue_galaxy_20201102.txt**
* ..because the bad disk is at /dev/sda and the new copy is at /dev/sdb and the last item is a location for a log file

After starting it up we saw some stats go by and then we left.



### message to galaxy expert on bad disk

```
Dear Greg,

I update below with more galaxy details from today and yesterday.
I copy lab members Isaac and Xiadong.  Isaac is sometimes at the office and helped with the last reboot.
Please excuse lengthy report.

I would like if you can comment on the assessment and plan I have.

Thanks,
Tom

I left you last email with "Something is taking forever" and it got to be ridiculous after hours had gone by
on my "Convert Read counts" job.  The history stayed "yellow-and-spinning" forever.  Eventually I tried to
login to linux and was unable.  The machine did not ping, nothing.  My galaxy web browser window, left
alone, did not indicate any problem--it just looked like a yellow history item not yet complete.
Very early this morning I visited and found the machine on but unresponsive and with these messages on the terminal:Out of memory: Kill process 3224 (R) score 721 or sacrifice child
Killed process 3224

..but above that message were lots of bad SATA messages like "ata1.00: failed command: READ FPDMA QUEUED"

My assessment is that the machine freaked out because of disk trouble and somehow got into a "Out of memory" situation.
It seems impossible that the OOM killer "Out Of memory" was triggered by a normal R requesting too much RAM problem
because I just ran these and similar and bigger galaxy jobs for months including in the last 24 hours.
You might recall that we had this "lost machine" problem once before a month or so ago.
I took a picture of the monitor window, at the machine itself, this morning, before rebooting.
It did respond to CTRL-ALT-DEL and rebooted successfully.  I think the log says "Rebooted" because it got the signal
from my keyboard and rebooted.  After
that the machine was fine and I did lots of galaxy server administration learning and was able to get galaxy going again after
visiting with supervisord, supervisorctl, slurm, sinfo, squeue, systemctl.  I learned lots of things.  Starting galaxy probably
only needs a few of the things I ran to startup.  I did not actually change anything, did not edit any files or
anything so the machine setup should be exactly as you left it.

After the reboot and galaxy startup, the machine was running galaxy and it was in my browser window and things were fine.
I had successfully deleted the "yellow" job in my history and so there was nothing to do at that time.
I submitted another, even smaller (one file) "Convert Read counts" and my history turned yellow-and-spinning.
I was logged into linux concurrently and saw the load get up and machine become less responsive. Here is a copy-and-paste of the load:

-bash-4.2$ w
 07:50:11 up  3:07,  1 user,  load average: 66.27, 63.78, 48.60
USER     TTY      FROM             LOGIN@   IDLE   JCPU   PCPU WHAT
-bash-4.2$ w
 07:59:42 up  3:17,  1 user,  load average: 64.06, 62.43, 55.12
USER     TTY      FROM             LOGIN@   IDLE   JCPU   PCPU WHAT

Eventually the machine was lost again and I rebooted it again, this time with the reset button because CTRL-ALT-DEL
did not respond.  The kernel log had many bad SATA messages on the way down.

My plan for dealing with this is to use dd_rescue to clone the physical disk to another known-good disk.
I happen to already have known-good 1TB disk that may be similar enough.  dd_rescue is like dd in that it
makes a bit-for-bit copy but it also has smarts in it to keep moving when disk blocks cannot be read (which
will cause dd to take forever and fail).  I have done it before for backup and for disk rescue and will be very careful
about which disk is which.  Wish me luck!
If I get a smooth clone and can get it to boot, then the new known-good disk might be missing some things.  Therefore we might
want to check for problems especially with postgres and maybe run e2fsck.  Before dd_rescue, I will try to tar up
everything NOT on /data/ first because if that reads nicely than that will be a nice backup copy to have.
I think this problem has happened at least 3 times, twice just recently and once a month or two ago.
I notice that this problem has always happened after a "big" galaxy job is launched.  That
suggests that a disk problem is out there when reading on /data/ somewhere and so we might get the non-/data files, the
/ files without any trouble.

An important thing to keep in mind is that most recently, this morning, I started Galaxy after a reboot and that spun the machine into its bad ways again.
I still suspect it is because of an executing job because its still there in my galaxy tab spinning yellow and
my attempt to "Delete" it failed.  Therefore, I probably should have tried to delete that job from the queue
manually.  The point here is that I don't think even starting Galaxy is okay right now.  My galaxy user, I believe,
still has one job in the queue (spinning-yellow in my history) but I think I need to start galaxy to delete it and
starting galaxy right now kills the machine.  Therefore, it is running linux but not galaxy right now.  You can login
if you want but I think you will find everything in good order until galaxy starts and then, in about 1 or 2 minutes, themachine becomes unresponsive.  The most recent crash caused my logged-in terminal to become hung but ping still responded
and the monitor showed nothing at all--no kernel messages or anything on the physical monitor.

The plan, in summary, is like this:

1. Keep galaxy stopped
2. Backup /etc/ with tar
3. Backup /, but not /data/, with tar
4. Clone disk to known-good disk with dd_rescue
5. Boot known-good disk, hope it works
6. Leave suspect disk alone


```

### rebooted pc34 galaxy machine due to hung and not pingable

Went to work and hit CTRL-ALT-DEL after seeing OOM message on console and after 12 hours of not pingable.
Grabbed some root history surprisingly found at pc34 and now here: **/var/tmp/.his_052734_20201102_0531a**

We also saw interesting galaxy history, especially these items:
```
-bash-4.2$ which cdgalaxy
alias cdgalaxy='cd /opt/galaxy/galaxy'
        /bin/cd
-bash-4.2$ which startgalaxy
alias startgalaxy='supervisorctl start galaxy:*'
-bash-4.2$ which stopgalaxy
alias stopgalaxy='supervisorctl stop galaxy:*'
```
..and these:
```
  945  cdgalaxy
  946  . .venv/bin/activate
  947  stopgalaxy
  948  ps -ef | grep python
  949  ps -ef | grep galaxy
  950  startgalaxy
  951  cd logs
  952  tail -qf *.log
  953  exit
```
..and running those gets galaxy started but:

* my dead jobs from before reboot are still in history spinning in yellow color, so I delete one and the other turned from yellow to red
* a newly created ESC job, just as before, was submitted and the 2 new jobs turned grey and did not change
* so I got into user **galaxy** again and see this:

```
(.venv) -bash-4.2$ sinfo
PARTITION AVAIL  TIMELIMIT  NODES  STATE NODELIST
debug*       up   infinite      1  drain E1-052734
(.venv) -bash-4.2$ squeue
             JOBID PARTITION     NAME     USER ST       TIME  NODES NODELIST(REASON)
               236     debug g242_met   galaxy PD       0:00      1 (Nodes required for job are DOWN, DRAINED or reserved for jobs in higher priority partitions)
(.venv) -bash-4.2$
```
..and googleing for **nodes required for job are down drained** tells me about a slurm problem, and so
we try like this to restart slurm but **squeue** still shows same problem:
```
-bash-4.2$ sudo systemctl stop slurmd.service
-bash-4.2$ sudo systemctl start slurmd.service
-bash-4.2$ su - galaxy
-bash-4.2$ ls -latF /var/run/*.pid|head -3
-rw-r--r-- 1 root    root     6 Nov  2 06:53 /var/run/slurmd.pid
-rw-r--r-- 1 root    root     5 Nov  2 05:42 /var/run/atd.pid
-rw-r--r-- 1 root    root     4 Nov  2 05:42 /var/run/libvirtd.pid

-bash-4.2$ squeue
             JOBID PARTITION     NAME     USER ST       TIME  NODES NODELIST(REASON)
               236     debug g242_met   galaxy PD       0:00      1 (Nodes required for job are DOWN, DRAINED or reserved for jobs in higher priority partitions)
```
..still nothing, so we check and slurmd looks okay:
```
-bash-4.2$ sudo systemctl status slurmd.service -l
● slurmd.service - Slurm node daemon
   Loaded: loaded (/usr/lib/systemd/system/slurmd.service; enabled; vendor preset: disabled)
   Active: active (running) since Mon 2020-11-02 06:53:55 EST; 3min 46s ago
  Process: 13120 ExecStart=/usr/local/sbin/slurmd $SLURMD_OPTIONS (code=exited, status=0/SUCCESS)
 Main PID: 13122 (slurmd)
    Tasks: 1
   Memory: 776.0K
   CGroup: /system.slice/slurmd.service
           └─13122 /usr/local/sbin/slurmd

Nov 02 06:53:55 E1-052734.science.psu.edu systemd[1]: Starting Slurm node daemon...
Nov 02 06:53:55 E1-052734.science.psu.edu systemd[1]: Can't open PID file /var/run/slurmd.pid (yet?) after start: No such file or directory
Nov 02 06:53:55 E1-052734.science.psu.edu systemd[1]: Started Slurm node daemon.
-bash-4.2$ ls -latF /var/run/slurmd.pid
-rw-r--r-- 1 root root 6 Nov  2 06:53 /var/run/slurmd.pid
-bash-4.2$ date
Mon Nov  2 06:58:04 EST 2020
```
..and it looks like root needs to fix nodes like this:
```
-bash-4.2$ date
Mon Nov  2 06:58:04 EST 2020
-bash-4.2$ sinfo
PARTITION AVAIL  TIMELIMIT  NODES  STATE NODELIST
debug*       up   infinite      1  drain E1-052734

-bash-4.2$ which scontrol
/usr/local/bin/scontrol
-bash-4.2$ scontrol
scontrol: update NodeName=E1-052734 State=RESUME
slurm_update error: Invalid user id
scontrol: exit
-bash-4.2$ su - galaxy
-bash-4.2$ scontrol
scontrol: update NodeName=E1-052734 State=RESUME
slurm_update error: Invalid user id
scontrol: exit
-bash-4.2$ exit
-bash-4.2$ sudo su -
Last login: Mon Nov  2 05:28:32 EST 2020 on pts/0
~:E1-052734:root% scontrol
scontrol: update NodeName=E1-052734 State=RESUME
scontrol: exit
~:E1-052734:root% exit
logout
```
..at this point, in the galaxy browser window we see my 2 jobs turn from grey-to-spinningYellow-to-red
in quick succession.
We check more things:
```
-bash-4.2$ sudo systemctl status slurmd.service -l
● slurmd.service - Slurm node daemon
   Loaded: loaded (/usr/lib/systemd/system/slurmd.service; enabled; vendor preset: disabled)
   Active: active (running) since Mon 2020-11-02 06:53:55 EST; 17min ago
  Process: 13120 ExecStart=/usr/local/sbin/slurmd $SLURMD_OPTIONS (code=exited, status=0/SUCCESS)
 Main PID: 13122 (slurmd)
    Tasks: 1
   Memory: 168.1M
   CGroup: /system.slice/slurmd.service
           └─13122 /usr/local/sbin/slurmd

Nov 02 06:53:55 E1-052734.science.psu.edu systemd[1]: Starting Slurm node daemon...
Nov 02 06:53:55 E1-052734.science.psu.edu systemd[1]: Can't open PID file /var/run/slurmd.pid (yet?) after start: No such file or directory
Nov 02 06:53:55 E1-052734.science.psu.edu systemd[1]: Started Slurm node daemon.
-bash-4.2$ sinfo
PARTITION AVAIL  TIMELIMIT  NODES  STATE NODELIST
debug*       up   infinite      1   idle E1-052734
-bash-4.2$ squeue
             JOBID PARTITION     NAME     USER ST       TIME  NODES NODELIST(REASON)
```
..and so we restart slurmd and we get an "idle" node:
```
~:E1-052734:root% systemctl stop slurmd.service
~:E1-052734:root% systemctl start slurmd.service
~:E1-052734:root% systemctl status slurmd.service -l
● slurmd.service - Slurm node daemon
   Loaded: loaded (/usr/lib/systemd/system/slurmd.service; enabled; vendor preset: disabled)
   Active: active (running) since Mon 2020-11-02 07:14:44 EST; 9s ago
  Process: 23286 ExecStart=/usr/local/sbin/slurmd $SLURMD_OPTIONS (code=exited, status=0/SUCCESS)
 Main PID: 23288 (slurmd)
    Tasks: 1
   Memory: 768.0K
   CGroup: /system.slice/slurmd.service
           └─23288 /usr/local/sbin/slurmd

Nov 02 07:14:44 E1-052734.science.psu.edu systemd[1]: Starting Slurm node daemon...
Nov 02 07:14:44 E1-052734.science.psu.edu systemd[1]: Can't open PID file /var/run/slurmd.pid (yet?) after start: No such file or directory
Nov 02 07:14:44 E1-052734.science.psu.edu systemd[1]: Started Slurm node daemon.
~:E1-052734:root% date
Mon Nov  2 07:14:58 EST 2020
~:E1-052734:root% sinfo
PARTITION AVAIL  TIMELIMIT  NODES  STATE NODELIST
debug*       up   infinite      1   idle E1-052734
```
..not sure but these seem not to work:
```
~:E1-052734:root% date
Mon Nov  2 07:14:58 EST 2020
~:E1-052734:root% sinfo
PARTITION AVAIL  TIMELIMIT  NODES  STATE NODELIST
debug*       up   infinite      1   idle E1-052734
~:E1-052734:root% squeue
             JOBID PARTITION     NAME     USER ST       TIME  NODES NODELIST(REASON)
~:E1-052734:root% scontrol
scontrol: update NodeName=E1-052734 State=RESUME
slurm_update error: Invalid node state specified
scontrol: update NodeName=E1-052734 State=START
Invalid input: State=START
Request aborted
Valid states are: NoResp DRAIN FAIL FUTURE RESUME POWER_DOWN POWER_UP UNDRAIN
Not all states are valid given a node's prior state
scontrol: update NodeName=E1-052734 State=DRAIN
You must specify a reason when DOWNING or DRAINING a node. Request denied
scontrol: update NodeName=E1-052734 State=UNDRAIN
scontrol: update NodeName=E1-052734 State=RESUME
slurm_update error: Invalid node state specified
scontrol: update NodeName=E1-052734 State=POWER_UP
scontrol: update NodeName=E1-052734 State=RESUME
slurm_update error: Invalid node state specified
scontrol: exit
~:E1-052734:root% squeue
             JOBID PARTITION     NAME     USER ST       TIME  NODES NODELIST(REASON)
~:E1-052734:root% sinfo
PARTITION AVAIL  TIMELIMIT  NODES  STATE NODELIST
debug*       up   infinite      1   idle E1-052734
~:E1-052734:root% scontrol
scontrol: update NodeName=E1-052734 State=RESUME
slurm_update error: Invalid node state specified
scontrol: exit
~:E1-052734:root%
```
..and we keep trying:
```
:E1-052734:root% squeue
             JOBID PARTITION     NAME     USER ST       TIME  NODES NODELIST(REASON)
~:E1-052734:root% sinfo
PARTITION AVAIL  TIMELIMIT  NODES  STATE NODELIST
debug*       up   infinite      1   idle E1-052734
~:E1-052734:root% scontrol
scontrol: update NodeName=E1-052734 State=RESUME
slurm_update error: Invalid node state specified
scontrol: exit
~:E1-052734:root% scontrol
scontrol: update NodeName=E1-052734 State=RESUME
slurm_update error: Invalid node state specified
scontrol: update NodeName=E1-052734 State=POWER_DOWN
scontrol: update NodeName=E1-052734 State=POWER_UP
scontrol: exit
~:E1-052734:root% sinfo
PARTITION AVAIL  TIMELIMIT  NODES  STATE NODELIST
debug*       up   infinite      1  idle* E1-052734
~:E1-052734:root% squeue
             JOBID PARTITION     NAME     USER ST       TIME  NODES NODELIST(REASON)
```
..and see no queue items, but then we start a job in galaxy web browser and then **squeue** says something:```
~:E1-052734:root% squeue
             JOBID PARTITION     NAME     USER ST       TIME  NODES NODELIST(REASON)
               237     debug g243_met   galaxy  R       0:30      1 E1-052734
~:E1-052734:root% exit
```
..and the galaxy web browser looks okay and has two yellow jobs 173 and 174, yay.
..but now the PC34 is extremely busy and takes minutes to respond to **w** even though, right now,
we are only running **Convert Read counts** on a single file GSM2041629_WGBS_UCLA1_Primed_rep3_CGmethratio.tab.gz
which was previously put into my history:
```
-bash-4.2$ w
 07:36:33 up  2:54,  1 user,  load average: 55.85, 49.04, 28.04
USER     TTY      FROM             LOGIN@   IDLE   JCPU   PCPU WHAT
-bash-4.2$
-bash-4.2$
-bash-4.2$ w
 07:50:11 up  3:07,  1 user,  load average: 66.27, 63.78, 48.60
USER     TTY      FROM             LOGIN@   IDLE   JCPU   PCPU WHAT
-bash-4.2$ w
 07:59:42 up  3:17,  1 user,  load average: 64.06, 62.43, 55.12
USER     TTY      FROM             LOGIN@   IDLE   JCPU   PCPU WHAT
-bash-4.2$ w
```
Now we check **dmesg** and see these types of things:
```
[Mon Nov  2 08:11:54 2020] ata1.00: failed command: READ FPDMA QUEUED
[Mon Nov  2 08:11:54 2020] ata1.00: cmd 60/08:e8:a8:f3:17/00:00:01:00:00/40 tag 29 ncq 4096 in
         res 40/00:01:00:00:00/00:00:00:00:00/00 Emask 0x4 (timeout)
[Mon Nov  2 08:11:54 2020] ata1.00: status: { DRDY }
[Mon Nov  2 08:11:54 2020] ata1.00: failed command: READ FPDMA QUEUED
[Mon Nov  2 08:11:54 2020] ata1.00: cmd 60/08:f0:d8:00:fe/00:00:00:00:00/40 tag 30 ncq 4096 in
         res 40/00:00:00:4f:c2/00:00:00:00:00/00 Emask 0x4 (timeout)
[Mon Nov  2 08:11:54 2020] ata1.00: status: { DRDY }
[Mon Nov  2 08:11:54 2020] ata1: hard resetting link
[Mon Nov  2 08:11:54 2020] ata1: SATA link up 6.0 Gbps (SStatus 133 SControl 300)
[Mon Nov  2 08:11:54 2020] ata1.00: configured for UDMA/133
[Mon Nov  2 08:11:54 2020] ata1.00: device reported invalid CHS sector 0
[Mon Nov  2 08:11:54 2020] ata1.00: device reported invalid CHS sector 0
[Mon Nov  2 08:11:54 2020] ata1.00: device reported invalid CHS sector 0
[Mon Nov  2 08:11:54 2020] ata1.00: device reported invalid CHS sector 0
```
..and google gives at least these suggestions:

* backup and replace drive
* try smartmoncontrols, gsmartcontrol
* replace SATA cables
* BIOS defaults to emulate PATA mode, switching to AHCI fixed the problem

..and more details from SO:
```
This error is unlikely to damage your hard drive but is highly likely to corrupt your filesystem(s). Begin by determining which drive is throwing the errors. This usually be determined easily by a number of approaches such as:
1) Issuing the command dmesg | grep ata3 and looking for the hard drive make and model. (as ata3 is the port throwing the error in your situation. Adjust accordingly) this will provide output similar to this:

dmesg | grep ata3
[    4.756081] ata3: SATA max UDMA/133 abar m2048@0xf7f26000 port 0xf7f26200 irq 135
[    5.071981] ata3: SATA link up 3.0 Gbps (SStatus 123 SControl 300)
[    5.077850] ata3.00: HPA detected: current 1953523055, native 1953525168
[    5.077959] ata3.00: ATA-8: SAMSUNG HD103SJ, 1AJ10001, max UDMA/133
[    5.077960] ata3.00: 1953523055 sectors, multi 16: LBA48 NCQ (depth 32), AA
[    5.084057] ata3.00: configured for UDMA/133
A quick glance indicates that the drive connected to ata3 is the SAMSUNG HD103SJ

2) Issue the command below:

find -L /sys/bus/pci/devices/*/ata*/host*/target* -maxdepth 3 -name "sd*" 2>/dev/null | egrep block |egrep --colour '(ata[0-9]*)|(sd.*)'
This will provide both the ports and the device names highlighted on the same line as seen below:

output

It's easy to see that the device connected to ata3 has been assigned the device name sdb

3)install lsscsi with sudo apt install lsscsi and issue the command lsscsi

$ lsscsi
[0:0:0:0]    cd/dvd  ATAPI    iHAS124   F      CL9M  /dev/sr0
[1:0:0:0]    disk    ATA      WDC WD2003FZEX-0 1A01  /dev/sda
[2:0:0:0]    disk    ATA      SAMSUNG HD103SJ  0001  /dev/sdb
[3:0:0:0]    disk    ATA      ST6000VN0033-2EE SC60  /dev/sdc
Note that the first entry on each line above is the scsi_host, channel, target_number and LUN. It is placed in brackets and each element is colon separated. When there are multiple SCSI devices
their entries are sorted in ascending order.

Simply adding 1 to the first number in each line of output gives you the ATA port. You can find more detail on lsscsi here and here.

Since in your case we are seeing errors thrown on both 3.00 and 3.01 you have more than one drive connected to the same ATA port. You are going toi want to carefully check connectivity to both ata3.00 and ata3.01 This could be a multi-bay drive enclosure connected to the same cable. Since both drives are throwing errors, replacing the cable to the aforementioned multi-drive bay should eliminate the problem for both drives. These devices usually have an external power source which also could be the culprit and need to be replaced, but the cable (being the weakest link) is by far the most likely root cause of the problem.
```
..and these where we again see the SATA MB connector and cable mentioned:
```
I know this thread is old but I recently encountered the same problem on a newly bought machine with 6 sata slots. I installed the cdrom and the hardrive on 2 sata slots close to each other and then proceeded to install ubuntu without errors until I reboot then on I saw the ata8: hard resetting link error. The machine halts up to this point never recovered. I tried rebooting for a few times and it did not work. And then I tried to replace the hardrive on one of the 4 available slots and it worked just fine without hassle.

share  improve this answer  follow
answered Jul 11 '14 at 11:42

ultrajohn
16366 bronze badges
You mean you changed the SATA port the hard drive was plugged into, right? Or do you mean replaced the entire hard drive with another? I think it's the former, but just double-checking – Xen2050 Nov 19 '17 at 23:57
It's the former. – ultrajohn Nov 21 '17 at 0:15
add a comment

This error is dangerous and it can damage your HD.

To solve it:

Replace the SATA cable.
If the error persists, plug the SATA cable on other motherboard socket (the current socket could be oxidated).
If the error persists, the problem should be on your power supply unit (PSU).
http://eliasoenal.com/2012/10/31/power-supply-failures-can-be-pretty-annoying-to-find/
```
### Galaxy cancer example manual execution for sharing as video with local galaxy experts

Last night we successfully executed the entire cancer example using existing galaxy history items
but we have forgotten some things and so we are doing it all again right now but this time trying
also to create a movie that demonstrates the entire process and so will allow us to make a list of
items that are tricky.  Here is that list that can serve alongside the video to allow for help from
local experts about how to repair these problems, also notes along the way:

* **Convert Read Counts** requires us to know which data are in which columns even though it is hard to know that
    * we enter GEO numbers and galaxy fetches the file and we never see it and so do not know which columns have **strand** for example
    * we refer to **news2020_08.md** which tells us, in text, how these operations were done and where we glimpse the files from GEO

```

### galaxy restart after OOM killer failed and pc34 crashed

Summary of bad PC34 crash:

* R, running manually, got stuck at **poolFromGRlist** after trying to execute graft code, as shown below
* At work, OOM messages on the machine
* reset button restarted without anything else, as usual
* galaxy was not running
* These steps did not get it running:
    * cd galaxy
    * . .venv/bin/activate
    * startgalaxy
    * ERROR: unix:///opt/galaxy/supervisor_tmp/supervisor.sock refused connection

After reboot, we need to call, as normal galaxy user, **supervisord**, like this:
```
(.venv) -bash-4.2$ supervisord
Unlinking stale socket /opt/galaxy/supervisor_tmp/supervisor.sock
```
..and then the normal startup works:

* cd galaxy
* . .venv/bin/activate
* startgalaxy

Here we see the cause and hang from the crash with **poolFromGRlist**:
```
-bash-4.2$ R

R version 3.5.2 (2018-12-20) -- "Eggshell Igloo"
Copyright (C) 2018 The R Foundation for Statistical Computing
Platform: x86_64-redhat-linux-gnu (64-bit)

R is free software and comes with ABSOLUTELY NO WARRANTY.
You are welcome to redistribute it under certain conditions.
Type 'license()' or 'licence()' for distribution details.

  Natural language support but running in an English locale

R is a collaborative project with many contributors.
Type 'contributors()' for more information and
'citation()' on how to cite R or R packages in publications.

Type 'demo()' for some demos, 'help()' for on-line help, or
'help.start()' for an HTML browser interface to help.
Type 'q()' to quit R.
> library(BiocManager)
Bioconductor version 3.8 (BiocManager 1.30.4), ?BiocManager::install for help 
Bioconductor version '3.8' is out-of-date; the current release version '3.12'
  is available with R version '4.0'; see https://bioconductor.org/install
> library(MethylIT)
> library(MethylIT.utils)
Error: package or namespace load failed for 'MethylIT.utils':
 object 'unlist' is not exported by 'namespace:MethylIT'
> files <- list.files( pattern = ".CX_report.txt" )
> files
[1] "BS-13.CX_report.txt" "BS-14.CX_report.txt" "BS-15.CX_report.txt"
[4] "BS-16.CX_report.txt" "BS-17.CX_report.txt" "BS-18.CX_report.txt"
> sampleFiles <- c( files[1], files[2], files[3],files[4], files[5], files[6])
> sampleFiles
[1] "BS-13.CX_report.txt" "BS-14.CX_report.txt" "BS-15.CX_report.txt"
[4] "BS-16.CX_report.txt" "BS-17.CX_report.txt" "BS-18.CX_report.txt"
> sample.id = sub( ".CX_report.txt" ,"", sampleFiles )
> sample.id
[1] "BS-13" "BS-14" "BS-15" "BS-16" "BS-17" "BS-18"
> ml_CG_gen2 = readCounts2GRangesList(filenames = sampleFiles,
+                                     sample.id = sample.id,
+                                     columns = c(seqnames = 1, start = 2, strand = 3,
+                                                 mC = 4, uC = 5),
+                                     pattern = "^[1-5].*CG..",
+                                     remove = FALSE,
+                                     verbose = TRUE)
*** Processing file: BS-13.CX_report.txt
Taking input= as a system command ('grep ^[1-5].*CG.. BS-13.CX_report.txt') and a variable has been used in the expression passed to `input=`. Please use fread(cmd=...). There is a security concern if you are creating an app, and the app could have a malicious user, and the app is not running in a secure envionment; e.g. the app is running as root. Please read item 5 in the NEWS file for v1.11.6 for more information and for the option to suppress this message.
*** Processing file: BS-14.CX_report.txt
Taking input= as a system command ('grep ^[1-5].*CG.. BS-14.CX_report.txt') and a variable has been used in the expression passed to `input=`. Please use fread(cmd=...). There is a security concern if you are creating an app, and the app could have a malicious user, and the app is not running in a secure envionment; e.g. the app is running as root. Please read item 5 in the NEWS file for v1.11.6 for more information and for the option to suppress this message.
*** Processing file: BS-15.CX_report.txt
Taking input= as a system command ('grep ^[1-5].*CG.. BS-15.CX_report.txt') and a variable has been used in the expression passed to `input=`. Please use fread(cmd=...). There is a security concern if you are creating an app, and the app could have a malicious user, and the app is not running in a secure envionment; e.g. the app is running as root. Please read item 5 in the NEWS file for v1.11.6 for more information and for the option to suppress this message.
*** Processing file: BS-16.CX_report.txt
Taking input= as a system command ('grep ^[1-5].*CG.. BS-16.CX_report.txt') and a variable has been used in the expression passed to `input=`. Please use fread(cmd=...). There is a security concern if you are creating an app, and the app could have a malicious user, and the app is not running in a secure envionment; e.g. the app is running as root. Please read item 5 in the NEWS file for v1.11.6 for more information and for the option to suppress this message.
*** Processing file: BS-17.CX_report.txt
Taking input= as a system command ('grep ^[1-5].*CG.. BS-17.CX_report.txt') and a variable has been used in the expression passed to `input=`. Please use fread(cmd=...). There is a security concern if you are creating an app, and the app could have a malicious user, and the app is not running in a secure envionment; e.g. the app is running as root. Please read item 5 in the NEWS file for v1.11.6 for more information and for the option to suppress this message.
*** Processing file: BS-18.CX_report.txt
Taking input= as a system command ('grep ^[1-5].*CG.. BS-18.CX_report.txt') and a variable has been used in the expression passed to `input=`. Please use fread(cmd=...). There is a security concern if you are creating an app, and the app could have a malicious user, and the app is not running in a secure envionment; e.g. the app is running as root. Please read item 5 in the NEWS file for v1.11.6 for more information and for the option to suppress this message.
> ref_gen2_CG <- poolFromGRlist(list(ml_CG_gen2$`BS-16`, ml_CG_gen2$`BS-17`, ml_CG_gen2$`BS-18`), stat = "sum", num.cores = 12L)
*** Building a unique GRanges object from the list...
 *** Building coordinates for the new GRanges object ...
packet_write_wait: Connection to 128.118.84.68 port 22: Broken pipe
```
### galaxy update for Greg

```
Dear Greg

I try to summarize recent galaxy work, below.  The main takeaways are these:

0. It works!  Running MethylIT on Galaxy gives the same output as with R only.
1. We have our galaxy MethylIT server copied to a bigger machine.
2. Two tricky bugs with **Read Counts** and **Estimate Cutpoint**.
3. Next steps: two more functions: glmDataSet and countTest2, but not yet.

Thanks,
Tom

0. It works!  Running MethylIT on Galaxy gives the same output as with R only.

This is good news: the output is the same in Galaxy as in bare R.
Hardik and I have run most of the "Graft" project code on Galaxy.
This bigger run turned up a couple of bugs and we also ran into
analysis problems at the end that are still being figured out.
Both problems are discussed below.

1. We have our galaxy MethylIT server copied to a bigger machine.

We have now the Galaxy MethylIT running on a bigger server, "raulPC", at e1-051569.
Your galaxy user will be there at e1-051569.science.psu.edu:8080.  I can make you a linux user also if you want.
This new galaxy server was setup because of memory exhaustion trouble on the original "pc34", still running good at e1-052734.
I have details about this effort, if you are interested. It was not fun but it was roughly like this:

1. Copy all of /opt/galaxy/
2. Copy all of /data/galaxy
3. Install lots of software, slurm, munge, postgres, python, more.
4. Copy postgres database files when postgres is shutdown.  (This is a normal filesystem copy, no database backup tools)
5. Create exactly matching UID and GID users.

Everything works as far as I can tell and our existing galaxy users and histories are there.
One thing did not work: The tools under "Admin..Server..LocalData" were not there.  Instead I saw this message:

"You do not currently have any Data Managers installed. You can install some from a ToolShed."

This makes me think that galaxy is maintaining state somewhere besides the filesystem and the database, something I did not copy??
Or perhaps there are subtle version differences in some system/python software somewhere causing trouble?
In fact, of course, the tools are surely still there, installed.  I was there, in the first place, because I wanted to install another gene annotation.
I did a fair amount of reinstallation effort clicking around in Galaxy and eventually got it so that those tools appear to be there.
I did not reinstall those things but did eventually find existing things under "Admin..Tool Management..Install and Uninstall".
But the Gene Annotation Fetch tool, when I use it, ends up with a bad/red history item.
The existing gene annotations are there but I am unable to install new ones.


2. Two tricky bugs with **Read Counts** and **Estimate Cutpoint**.

1. **Read Counts** tool fails to work properly because **pattern** argument gets corrupted
2. **Estimate Cutpoint** tool fails because **pattern** argument gets corrupted

Our code might have a pattern like this:

^[1-5].*CG..

..which means we want to select only chromosomes 1 through 5 and only CG context.
But galaxy changes that pattern from "^[1-5].*CG.." to this:

^15CG

That pattern, of course, does not select the lines we are asking for.

There is a similar problem in EstimateCutpoint where it is changing the entered values for the names of the control and treatment samples (the form elements with labels: "Names of the control sample columns in the input GRange objects" and "Names of the treatment sample columns in the input GRange objects").  I entered these names because that is what the original R code had:

BS-13,BS-14,BS-15
BS-16,BS-17,BS-18

..but the tool changes them to these names:

BS13,BS14,BS15
BS16,BS17,BS18

..and then they cannot be found because the earlier tool, "Read Counts" did accept those names for "Sample id".

You might be able to see the malformed entries in the error screenshots here:



3. Next steps: two more functions: glmDataSet and countTest2, but not yet.

Hardik and I are currently working on using existing galaxy tools to combine data in the same way as typical MethylIT analysis:

1. First we run all three contexts separately: CG, CHG and CHH.
2. Next we combine the DIMPs from all three.
3. Then we continue processing with the aggregated data.

This workflow might be possible by using the existing Galaxy "Collections operations" but I haven't seen it work yet.
Hopefully the existing tools can run this kind of workflow without changes.
```

As we do not yet have countTest2, we might consider building it ourselves:

* we can start with a super easy tool that prints the R version
* the xml and .R files under **tools** in galaxy look complicated enough to be auto-generated with a tool **possibly**
* or maybe they are hand written, **possibly** ???


### graft code execution galaxy CHH poolFromGRlist OOM out of memory kernel killed on PC34

Galaxy running on PC34 is unable to run poolFromGRList galaxy tool on CHH for control samples BS16, BS17, BS18
and here we see the tail of the kernel log as in **dmesg -T |tail -2**:

```
[Sat Dec 12 14:40:35 2020] Out of memory: Kill process 24318 (R) score 843 or sacrifice child
[Sat Dec 12 14:40:35 2020] Killed process 24318 (R), UID 1005, total-vm:15737032kB, anon-rss:14237096kB, file-rss:20kB, shmem-rss:0kB
```
..and that was during poolFromGRlist with previously created ReadCounts2GRangesList for these items, copied from History log:
```
input_data_files:  input_data_dir/BS-16.CX_report_CHH.txt.gz, input_data_dir/BS-17.CX_report_CHH.txt.gz, input_data_dir/BS-18.CX_report_CHH.txt.gz
```
We then restarted galaxy in the normal way:
```
(.venv) -bash-4.2$ date;pwd;hostname
Sat Dec 12 14:49:18 EST 2020
/opt/galaxy/galaxy
E1-052734.science.psu.edu
```
### graft code execution RData save() list and script output

All of the linux terminal of R execution was captured like this:

```
64 Grafting_data_methylation_F18FTSUSAT1_ALL3_cov_MethylIT_with_updated_filters]$ script msh1_paper_R_code_data_20201127_Col0_on_msh1_4_Gen_1_vs_Col0_on_dcl234_msh1_reference_code_script_20201211.txt
```

Here we see nice things:

* saved RData object files
* the script command that was run

We have these objects and files after running hardik graft code:

```
-bash-4.2$ date;pwd
Fri Dec 11 20:38:26 EST 2020
/data5/OLD_genomes/Grafting_data_methylation_F18FTSUSAT1_ALL3_cov_MethylIT_with_updated_filters

-bash-4.2$ ls RData_20201211/
AG.RData                                                                                  DIMPs_BS_17.RData        HD_ml_CHG_G2_tvcut.RData
Col0_on_msh1_4_vs_Col0_on_dcl234_msh1_1_CountPerBp_0.0003_maxGrpCV_1_DMGs_12-11-2020.csv  DIMPs_BS_18_gene.RData   HD_ml_CHH_G2.RData
condition.RData                                                                           DIMPs_BS_18.RData        HD_ml_CHH_G2_tvcut.RData
control.nam.RData                                                                         DIMPs_CG.RData           ml_CG_gen2.RData
cutpoints_CG.RData                                                                        DIMPs_CHG.RData          ml_CHG_gen2.RData
cutpoints_CHG.RData                                                                       DIMPs_CHH.RData          ml_CHH_gen2.RData
cutpoints_CHH.RData                                                                       DIMPs_Gen2.RData         nlms_CG.RData
DIMPs_BS_13_gene.RData                                                                    DIMR_Gen2.RData          nlms_CHG.RData
DIMPs_BS_13.RData                                                                         dmg.RData                nlms_CHH.RData
DIMPs_BS_14_gene.RData                                                                    DMGs_1380.RData          PS_CG.RData
DIMPs_BS_14.RData                                                                         gene.RData               PS_CHG.RData
DIMPs_BS_15_gene.RData                                                                    Genes_DIMPs.RData        PS_CHH.RData
DIMPs_BS_15.RData                                                                         Genes_DMGs_ID.RData      ref_gen2_CG.RData
DIMPs_BS_16_gene.RData                                                                    HD_ml_CG_G2.RData        ref_gen2_CHG.RData
DIMPs_BS_16.RData                                                                         HD_ml_CG_G2_tvcut.RData  ref_gen2_CHH.RData
DIMPs_BS_17_gene.RData                                                                    HD_ml_CHG_G2.RData       treatment.nam.RData
```
Here we see that **script**
```
> system("ls /data5/OLD_genomes/Grafting_data_methylation_F18FTSUSAT1_ALL3_cov_MethylIT_with_updated_filters/RData_20201211/|wc")
     48      48     933
> q()
Save workspace image? [y/n/c]: n
(base) [e1-052764 Grafting_data_methylation_F18FTSUSAT1_ALL3_cov_MethylIT_with_updated_filters]$ exit
exit
Script done, file is msh1_paper_R_code_data_20201127_Col0_on_msh1_4_Gen_1_vs_Col0_on_dcl234_msh1_reference_code_script_20201211.txt```

### Error running graft paper in R

We get this error:

**Error: subscript contains invalid names**

..as shown in this snippet of R console output before/during error:

```
*** Trying nonlinear fit to a 3P Gamma distribution model ...
*** Performing nonlinear regression model  crossvalidation...
  |======================================================================| 100%

 *** Creating report ...
       w2p_AIC w2p_R.Cross.val w3p_AIC w3p_R.Cross.val   g2p_AIC
BS-13 -9647039       0.9997354      NA              NA -11348408
BS-14 -9631786       0.9997683      NA              NA -10681960
BS-15 -9879301       0.9997978      NA              NA -10408194
BS-16 -8333709       0.9995708      NA              NA -12336946
BS-17 -8308644       0.9995703      NA              NA -12280577
BS-18 -8448915       0.9995844      NA              NA -12393164
      g2p_R.Cross.val   g3p_AIC g3p_R.Cross.val bestModel
BS-13       0.9999159 -11385697       0.9999167       g3p
BS-14       0.9998826 -10716856       0.9998839       g3p
BS-15       0.9998486 -10446814       0.9998504       g3p
BS-16       0.9999800 -12532702       0.9999829       g3p
BS-17       0.9999804 -12286806       0.9999804       g3p
BS-18       0.9999791 -12535396       0.9999813       g3p

Model: treat ~ hdiv + bay.TV + logP + pos
Model: treat ~ hdiv + bay.TV + logP + pos
Model: treat ~ hdiv + bay.TV + logP + pos
Error: subscript contains invalid names
In addition: Warning message:
In gofReport(HD_ml_CG_G2, column = 9, num.cores = 48L, verbose = TRUE) :
 The best fitted model for sample(s) BS-13, BS-14, BS-15 require(s) for further analysis.
The model with the lowest AIC must have the highest R.Cross.val
> ls()
 [1] "AG"                 "control.nam"        "cutpoints_CG"
 [4] "cutpoints_CHG"      "cutpoints_CHH"      "DIMPs_BS_13"
 [7] "DIMPs_BS_14"        "DIMPs_BS_15"        "DIMPs_BS_16"
[10] "DIMPs_BS_17"        "DIMPs_BS_18"        "DIMPs_CG"
[13] "DIMPs_CHG"          "DIMPs_CHH"          "DIMPs_Gen2"
[16] "files"              "HD_ml_CG_G2"        "HD_ml_CG_G2_tvcut"
[19] "HD_ml_CHG_G2"       "HD_ml_CHG_G2_tvcut" "HD_ml_CHH_G2"
[22] "HD_ml_CHH_G2_tvcut" "ml_CG_gen2"         "ml_CHG_gen2"
[25] "ml_CHH_gen2"        "nlms_CG"            "nlms_CHG"
[28] "nlms_CHH"           "PS_CG"              "PS_CHG"
[31] "PS_CHH"             "ref_gen2_CG"        "ref_gen2_CHG"
[34] "ref_gen2_CHH"       "sample.id"          "sampleFiles"
[37] "treatment.nam"
```
### started graft execution in CHH in galaxy

### galaxy MethylIT to use exclusively 1 core on all tools on PC34, will be better with only 16GB

```
grep -Hin num_cores tools/methylome_analysis/*/methylit_*.xml
tools/methylome_analysis/methylit_estimate_cutpoint/methylit_estimate_cutpoint.xml:47:--num_cores 1
tools/methylome_analysis/methylit_estimate_divergence/methylit_estimate_divergence.xml:80:--num_cores 1
tools/methylome_analysis/methylit_evaluate_dimp_class/methylit_evaluate_dimp_class.xml:32:--num_cores 1
tools/methylome_analysis/methylit_gof_report/methylit_gof_report.xml:21:--num_cores 1
tools/methylome_analysis/methylit_pool_from_granges_list/methylit_pool_from_granges_list.xml:30:--num_cores 1
tools/methylome_analysis/methylit_unique_granges/methylit_unique_granges.xml:39:--num_cores 1
```

### galaxy graft code execution movie, also on yt at p6avWQf5GK4

This movie turned out okay:

galaxyMethylIT_graft_CG_allChrom_20201210.mp4

* 18 minutes
* 198 MB
* 1280x800
* no sound
* plays okay at 5x speed
* shows what the title says:
    * galaxy
    * MethylIT
    * graft
    * CG
    * all chromosomes
    * run today 20201210
* mp4 format

* YT Title,description,link
* Galaxy MethylIT graft experiment, CG, all chromosomes 20201210
* https://youtu.be/p6avWQf5GK4
* description, below

```
MethylIT is an R package for methylome analysis.  A new of MethylIT tools is being developed for MethylIT analysis to be possible on the Galaxy platform.  You can write R code with MethylIT R package, or you can do the same methylome analysis in Galaxy.  Here we see an analysis of Arabidopsis methylome data in the CG context for all chromosomes and 6 samples.
```

### hardik graft code execution

With anaconda Rv3.6.3 we need to do this to find MethylIT:
galaxyMethylIT_graft_CG_allChrom_20201210.mp4

### hardik graft code execution

With anaconda Rv3.6.3 we need to do this to find MethylIT:
```
.libPaths(c("/opt/nimda/R/x86_64-conda_cos6-linux-gnu-library/3.6","/opt/anaconda3/lib/R/library","/opt/nimda/R/x86_64-redhat-linux-gnu-library/3.6/","/usr/lib64/R/library/"))
```

..and things go well except:

* cutpoints and performance were all different than the comments in the code indicate, but only by a little
* object named **gene** is not found, next we see code that might fix that:

```
AG = import("/data/TAIR10_gff3/Arabidopsis_thaliana.TAIR10.38.gtf.gz")
gene = AG[ AG$type == "gene", c( "gene_id", "gene_biotype" ) ]
gene = gene[ gene$gene_biotype == "protein_coding", "gene_id" ]
seqlevels(gene, pruning.mode = "coarse") <- c("1", "2", "3", "4", "5")
seqlevels(gene)<- paste0("", 1:5)
gene = sortBySeqnameAndStart(gene)
```
..and next we see the previously failing line now working:
```
> class(DIMPs_Gen2)
[1] "list"
> DIMPs_BS_13_gene = getDIMPatGenes(DIMPs_Gen2$BS_13, gene)
```
That looks good, no error, but using a **gtf** file instead of **gff3** is unusual right?

..but, sadly, a few lines later we see trouble at countTest2:
```
> DIMPs_BS_14_gene = getDIMPatGenes(DIMPs_Gen2$BS_14, gene)
> DIMPs_BS_15_gene = getDIMPatGenes(DIMPs_Gen2$BS_15, gene)
> DIMPs_BS_16_gene = getDIMPatGenes(DIMPs_Gen2$BS_16, gene)
> DIMPs_BS_17_gene = getDIMPatGenes(DIMPs_Gen2$BS_17, gene)
> DIMPs_BS_18_gene = getDIMPatGenes(DIMPs_Gen2$BS_18, gene)
> Genes_DIMPs = uniqueGRanges(list( DIMPs_BS_16_gene[, 2], DIMPs_BS_17_gene[, 2], DIMPs_BS_18_gene[, 2],
+                                   DIMPs_BS_13_gene[, 2], DIMPs_BS_14_gene[, 2], DIMPs_BS_15_gene[, 2])
+                             , type = "equal", verbose = TRUE,
+                             chromosomes = c("1", "2", "3", "4", "5"),
+                             ignore.strand = TRUE )
 *** Building coordinates for the new GRanges object ...
 *** Setting strand information to * ...
 *** Processing GRanges for sample: #1
 *** Processing GRanges for sample: #2...
 *** Processing GRanges for sample: #3...

 *** Processing GRanges for sample: #4...
 *** Processing GRanges for sample: #5...
 *** Processing GRanges for sample: #6...
 *** Sorting by chromosomes and start positions...
>
> colnames( mcols(Genes_DIMPs)) <- c("BS_16","BS_17","BS_18", "BS_13","BS_14","BS_15")
>
> condition = data.frame(condition = factor(c("CT", "CT", "CT",
+                                             "TT", "TT", "TT"),
+                                           levels = c("CT", "TT")))
>
> rownames(condition) <- c("BS_16","BS_17","BS_18", "BS_13","BS_14","BS_15")
>
>
>
> DIMR_Gen2 <- glmDataSet(GR = Genes_DIMPs,
+                         colData = condition )
> DMGs_1380 = countTest2(DS = DIMR_Gen2, num.cores = 24L, minCountPerIndv = 7, countFilter = TRUE, FilterLog2FC = TRUE, test = "LRT",
+                        CountPerBp = 0.0003, Minlog2FC = 1, pvalCutOff = 0.05, MVrate = .95, verbose = TRUE, maxGrpCV=c(1,1))
*** Number of GR after filtering counts 0
Warning message:
In countTest2(DS = DIMR_Gen2, num.cores = 24L, minCountPerIndv = 7,  :
  * No genomic region passed the 'minCountPerIndv'
filtering conditions
```
That **gtf** file was probably not what we wanted, it is empty:
```
> head(gene)
GRanges object with 0 ranges and 1 metadata column:
   seqnames    ranges strand |     gene_id
      <Rle> <IRanges>  <Rle> | <character>
  -------
  seqinfo: 5 sequences from an unspecified genome; no seqlengths
> seqlevels(gene)
[1] "1" "2" "3" "4" "5"
```
..maybe this **Arabidopsis_thaliana.TAIR10.48.gff3.gz** will do better:
```
AG = import("/data/TAIR10_gff3/Arabidopsis_thaliana.TAIR10.48.gff3.gz")
##NO:gene = AG[ AG$type == "gene", c( "gene_id", "gene_biotype" ) ]
gene = AG[ AG$type == "gene", c( "gene_id", "biotype" ) ]
##NO:gene = gene[ gene$gene_biotype == "protein_coding", "gene_id" ]
gene = gene[ gene$biotype == "protein_coding", "gene_id" ]
seqlevels(gene, pruning.mode = "coarse") <- c("1", "2", "3", "4", "5")
seqlevels(gene)<- paste0("", 1:5)
gene = sortBySeqnameAndStart(gene)

```

The entire successful execution is found as R console output in this file mentioned in the git commit:
```
git commit -m "added misc/msh1_paper_R_code_data_20201127_Col0_on_msh1_4_Gen_1_vs_Col0_on_dcl234_msh1_reference_code_txt_executionOUTPUT_20201210.txt which holds the R console output from the execution in R of script code in  misc/msh1_paper_R_code_data_20201127_Col0_on_msh1_4_Gen_1_vs_Col0_on_dcl234_msh1_reference_code.txt"
```
..in this file:**misc/msh1_paper_R_code_data_20201127_Col0_on_msh1_4_Gen_1_vs_Col0_on_dcl234_msh1_reference_code_txt_executionOUTPUT_20201210.txt**
### galaxy tester tries graft project CG all chrom on PC34

We asked for these files under:

* Get Data
* Composite
* Fetch

..with these URL pasted in, as seen here on cloud location:
```
ubuntu:/var/www/html/memory.methylit.org/graft$ ls |grep CX_report_CG.txt.gz|sed 's#^#http://memory.methylit.org/graft/#'
http://memory.methylit.org/graft/BS-13.CX_report_CG.txt.gz
http://memory.methylit.org/graft/BS-14.CX_report_CG.txt.gz
http://memory.methylit.org/graft/BS-15.CX_report_CG.txt.gz
http://memory.methylit.org/graft/BS-16.CX_report_CG.txt.gz
http://memory.methylit.org/graft/BS-17.CX_report_CG.txt.gz
http://memory.methylit.org/graft/BS-18.CX_report_CG.txt.gz
```
..and we see these files appear on PC34 galaxy:
```
-bash-4.2$ ls -latF /data/galaxy/database/files/datasets/001/|head
total 1122396
drwxr-xr-x 6 galaxy galaxy     12288 Dec 10 10:25 ./
-rw-r--r-- 1 galaxy galaxy 132083198 Dec 10 10:25 dataset_1193.dat
-rw-r--r-- 1 galaxy galaxy 132157584 Dec 10 10:25 dataset_1192.dat
-rw-r--r-- 1 galaxy galaxy 132052359 Dec 10 10:25 dataset_1191.dat
-rw-r--r-- 1 galaxy galaxy 132290927 Dec 10 10:25 dataset_1190.dat
-rw-r--r-- 1 galaxy galaxy 132253301 Dec 10 10:24 dataset_1189.dat
-rw-r--r-- 1 galaxy galaxy 132410504 Dec 10 10:24 dataset_1188.dat
-rw-r--r-- 1 galaxy galaxy     24294 Dec 10 10:03 dataset_1187.dat
-rw-r--r-- 1 galaxy galaxy     18786 Dec 10 10:03 dataset_1186.dat
```
..and we can see that those **.dat** files are that size because here we see that one of them:

* is 25MB or 26,024,655 bytes as gzip compressed, and
* wc reports uncompressed size of about 132MB
* and so we know that dataset_1188.dat on galaxy is exactly file BS-13.CX_report_CG.txt.gz

```
ubuntu:/var/www/html/memory.methylit.org/graft$ ls -al BS-13.CX_report_CG.txt.gz|sed 's/.*er//'
 26024655 Nov 27 15:10 BS-13.CX_report_CG.txt.gz

ubuntu:/var/www/html/memory.methylit.org/graft$ zcat BS-13.CX_report_CG.txt.gz |wc
5567714 38973998 132410504
```
..so far so good except that in galaxy history the downloaded file history items stay yellow forever
Next we get the 3 samples as a group for the reference:
```
http://memory.methylit.org/graft/BS-16.CX_report_CG.txt.gz
http://memory.methylit.org/graft/BS-17.CX_report_CG.txt.gz
http://memory.methylit.org/graft/BS-18.CX_report_CG.txt.gz
```
..and we do the same as before and name this collection:
**graft_BS161718_CG_allChromForReference**

Now that we have two collections of files with these samples, CG only, all chromosomes:

* BS13,BS14,BS15,BS16,BS17,BS18
* BS16,BS17,BS18

..now we will use that list-of-3 items to call PoolFromGRlist tool and we choose:

* stat="sum"
* graft_BS161718_CG_allChromForReference (that list-of-3 items)

..now that we have a pooled Reference and a list of 6 individuals, we can call estimateDivergence.

We tried to reduce the num.cores to use only one core by editing this file:

**/opt/galaxy/galaxy/tools/methylome_analysis/methylit_estimate_divergence/methylit_estimate_divergence.xml**

..and changing one line from this to this:

* --num_cores \${GALAXY_SLOTS:-1}
* --num_cores 1

..or to see the actual diff:

```
-bash-4.2$ diff tools/methylome_analysis/methylit_estimate_divergence/methylit_estimate_divergence_xml_ORIG_20201210_beforeTomBroke_tryingToUseOnlyOneCore tools/methylome_analysis/methylit_estimate_divergence/methylit_estimate_divergence.xml
80c80
< --num_cores \${GALAXY_SLOTS:-1}
---
> --num_cores 1
```

..because I think **GALAXY_SLOTS** is set elsewhere to 4.  This is a risky untested idea, pray for us.

When we ran MethylIT EstimateDivergence tool in galaxy and then checked the **htop** output on PC34, it appears
to have worked because we consistently see only 1 CPU at 100% load.  That is strong evidence that this num.cores
attempt worked and estimateDivergence is running in fact using only one core.  It also appears to be taking a
ery long time and in general **htop** is showing about 6.0GB in use out of 16GB available at PC34.  This is good
news and might indicate that we can run even CHG and CHH on this machine.

..similarly as before we try to reduce num.cores used by gofReport like this:

```
-bash-4.2$ diff tools/methylome_analysis/methylit_gof_report/methylit_gof_report.xml tools/methylome_analysis/methylit_gof_report/methylit_gof_report_xml_ORIG_20201210_beforeTomBroke_tryingToUseOnlyOneCore
21c21
< --num_cores 1
---
> --num_cores \${GALAXY_SLOTS:-4}
```
#### CHG and CHH runs on galaxy graft data, but with OOM error

We did the CHG successfully and now we do CHH:
```
http://memory.methylit.org/graft/BS-13.CX_report_CHH.txt.gz
http://memory.methylit.org/graft/BS-14.CX_report_CHH.txt.gz
http://memory.methylit.org/graft/BS-15.CX_report_CHH.txt.gz
http://memory.methylit.org/graft/BS-16.CX_report_CHH.txt.gz
http://memory.methylit.org/graft/BS-17.CX_report_CHH.txt.gz
http://memory.methylit.org/graft/BS-18.CX_report_CHH.txt.gz
```
..and we named that collection: **graft_BS131415161718_CHH_allChrom**

..likewise we make another collection for the reference with these:
```
http://memory.methylit.org/graft/BS-16.CX_report_CHH.txt.gz
http://memory.methylit.org/graft/BS-17.CX_report_CHH.txt.gz
http://memory.methylit.org/graft/BS-18.CX_report_CHH.txt.gz
```

..and we named that collection: **graft_BS161718_CHH_allChromForReference**

Here we see cloud PC log file shows that our galaxy did get the files:
```
tail /var/www/html/logs/memory.methylit.org/log/access.log
128.118.84.68 - - [10/Dec/2020:15:54:32 -0500] "GET /graft/BS-18.CX_report_CHG.txt.gz HTTP/1.1" 200 27702604 "-" "Python-urllib/3.6"
128.118.84.68 - - [10/Dec/2020:20:29:24 -0500] "GET /graft/BS-13.CX_report_CHH.txt.gz HTTP/1.1" 200 274399524 "-" "Python-urllib/3.6"
128.118.84.68 - - [10/Dec/2020:20:31:23 -0500] "GET /graft/BS-14.CX_report_CHH.txt.gz HTTP/1.1" 200 273171278 "-" "Python-urllib/3.6"
128.118.84.68 - - [10/Dec/2020:20:33:28 -0500] "GET /graft/BS-15.CX_report_CHH.txt.gz HTTP/1.1" 200 273587762 "-" "Python-urllib/3.6"
128.118.84.68 - - [10/Dec/2020:20:35:32 -0500] "GET /graft/BS-16.CX_report_CHH.txt.gz HTTP/1.1" 200 271633092 "-" "Python-urllib/3.6"
128.118.84.68 - - [10/Dec/2020:20:37:34 -0500] "GET /graft/BS-17.CX_report_CHH.txt.gz HTTP/1.1" 200 272323006 "-" "Python-urllib/3.6"
128.118.84.68 - - [10/Dec/2020:20:39:32 -0500] "GET /graft/BS-18.CX_report_CHH.txt.gz HTTP/1.1" 200 271907412 "-" "Python-urllib/3.6"
128.118.84.68 - - [10/Dec/2020:20:41:51 -0500] "GET /graft/BS-16.CX_report_CHH.txt.gz HTTP/1.1" 200 271633092 "-" "Python-urllib/3.6"
128.118.84.68 - - [10/Dec/2020:20:43:54 -0500] "GET /graft/BS-17.CX_report_CHH.txt.gz HTTP/1.1" 200 272323006 "-" "Python-urllib/3.6"
128.118.84.68 - - [10/Dec/2020:20:45:56 -0500] "GET /graft/BS-18.CX_report_CHH.txt.gz HTTP/1.1" 200 271907412 "-" "Python-urllib/3.6"
```

During CHH Read Counts 2 GRanges:
```
dmesg -T|tail
[Thu Dec 10 21:19:19 2020] [19137]  1005 19137    28389        2      11      115             0 bash
[Thu Dec 10 21:19:19 2020] [25927]  1005 25927  4061015  3700944    7433    78262             0 R
[Thu Dec 10 21:19:19 2020] [27211]    26 27211    59676     1210      62      428             0 postgres
[Thu Dec 10 21:19:19 2020] [27966]    99 27966    21632      552      46        0             0 BESClient
[Thu Dec 10 21:19:19 2020] [28431]    26 28431    59108      360      52      184             0 postgresThu Dec 10 21:19:19 2020] [28432]     0 28432    28951      128      10       20             0 ksmtuned
[Thu Dec 10 21:19:19 2020] [28433]     0 28433    28951      128      10       20             0 ksmtuned
[Thu Dec 10 21:19:19 2020] [28434]     0 28434    38252      102      30        0             0 pgrep
[Thu Dec 10 21:19:19 2020] Out of memory: Kill process 25927 (R) score 839 or sacrifice child
[Thu Dec 10 21:19:19 2020] Killed process 25927 (R), UID 1005, total-vm:16244060kB, anon-rss:14803776kB, file-rss:0kB, shmem-rss:0kB
```

The only thing to consider is that we did run both of them close together, both the list-of-3 and the list-of-6.

..and so we stop and start galaxy:
```
. .venv/bin/activate

(.venv) -bash-4.2$ stopgalaxy
galaxy:handler0: stopped
galaxy:handler1: stopped
galaxy:handler2: stopped
galaxy:handler3: stopped
galaxy:handler4: stopped
galaxy:handler5: stopped
galaxy:handler6: stopped
galaxy:handler7: stopped
galaxy:galaxy_uwsgi: stopped

(.venv) -bash-4.2$ startgalaxy
galaxy:handler0: started
galaxy:handler1: started
galaxy:handler2: started
galaxy:handler3: started
galaxy:handler4: started
galaxy:handler5: started
galaxy:handler6: started
galaxy:handler7: started


```

### galaxy edited tools/methylome_analysis/methylit_get_dimp_at_genes/methylit_get_dimp_at_genes.R

These lines now work for TAIR10 chr3 and might also work generally because they now have
the gene annotation object assume whatever seqnames are in use by the input PDMP object:

```
## Tom 20201209_1436, try like original, but only seqnames 3: these 3 lines worked:
genes <- gene_annot[ gene_annot$type == "gene", c( "gene_id", "biotype", "Name" ) ];
genes <- genes[ genes$biotype == "protein_coding", "gene_id" ];
#seqlevels(genes) <- "3";

gr <- readRDS(opt$input);
#seqlevels(genes) <- "3";
## Tom 20201209_1442 like original but set seqlevels to be equal to whatever input is:
#NOseqlevels(genes) <- seqlevels(gr);
seqlevels(genes) <- seqlevels(gr[[1]]);

```
### make gene object with TAIR10_gff3/Arabidopsis_thaliana.TAIR10.38.gtf.gz for use in tools/methylome_analysis/methylit_get_dimp_at_genes/methylit_get_dimp_at_genes.R

..this comes from old times:
```
AG = import("/data/TAIR10_gff3/Arabidopsis_thaliana.TAIR10.38.gtf.gz")
gene = AG[ AG$type == "gene", c( "gene_id", "gene_biotype" ) ]
gene = gene[ gene$gene_biotype == "protein_coding", "gene_id" ]
seqlevels(gene, pruning.mode = "coarse") <- c("1", "2", "3", "4", "5")
seqlevels(gene)<- paste0("", 1:5)
gene = sortBySeqnameAndStart(gene)
```
..and that gtf file is here:

https://git.psu.edu/genomath/MethylIT_data/-/raw/1d0522171be651da0351e382a24cd71c003d3382/Arabidopsis_thaliana.TAIR10.38.gtf.gz

..and we end up running this code on one of the **Get DIMPs at Gene Body** galaxy downloaded RData files:
```
Genes_DIMPs = uniqueGRanges(list( galaxy666gdag$BS16[, 2], galaxy666gdag$BS17[, 2], galaxy666gdag$BS18[, 2],
                                  galaxy666gdag$BS13[, 2], galaxy666gdag$BS14[, 2], galaxy666gdag$BS15[, 2])
                            , type = "equal", verbose = TRUE,
                            chromosomes = c("1", "2", "3", "4", "5"),
                            ignore.strand = TRUE )
```


### bad Get DIMP at Genes output for graft on PC34 CG chr3

After the whole run we get bad empty DMGs:

```
> galaxy652gdag <- readRDS("~/Downloads/Galaxy652-[MethylIT__Count_DMPs_at_gene-body_(DMPPatGenes)_on_data_650].grangelist")
> class(galaxy652gdag)
[1] "list"
> class(galaxy652gdag$BS13)
[1] "GRanges"
attr(,"package")
[1] "GenomicRanges"
> head(galaxy652gdag$BS18)
GRanges object with 0 ranges and 2 metadata columns:
   seqnames    ranges strand |   GeneID     DIMPs
      <Rle> <IRanges>  <Rle> | <factor> <integer>
  -------
  seqinfo: no sequences
```
..but we may have a chr1 annotation so we, again, in **Admin Local Data** run the fetcher to get this file:
ftp://ftp.ensemblgenomes.org/pub/release-48/plants/gff3/arabidopsis_thaliana/Arabidopsis_thaliana.TAIR10.48.chromosome.3.gff3.gz

..which we name this **tair10_48_chr3**

..and then we will run **Get DIMP at gene body** tool again with chr3.

..but, sadly, this ends better but not good enough:
```
> galaxy657gdag <- readRDS("~/Downloads/Galaxy657-[MethylIT__Count_DMPs_at_gene-body_(DMPPatGenes)_on_data_650].grangelist"
+ )
> head(galaxy657gdag$BS13)
GRanges object with 6 ranges and 2 metadata columns:
      seqnames     ranges strand |         GeneID     DIMPs
         <Rle>  <IRanges>  <Rle> |    <character> <integer>
  [1]        3 1-23459830      * | 3_1_23459830_*      2648
  [2]        3  1609-4159      - |  3_1609_4159_-      2648
  [3]        3  1609-1797      - |  3_1609_1797_-      2648
  [4]        3  1609-1936      - |  3_1609_1936_-      2648
  [5]        3  1798-1936      - |  3_1798_1936_-      2648
  [6]        3  2048-2142      - |  3_2048_2142_-      2648
  -------
  seqinfo: 1 sequence from an unspecified genome; no seqlengths
>
```
..incidentally, that **GeneID** column we see does NOT appear in the GFF file:
```
(base) Users-MacBook-Pro:TomsWork user$ zcat ~/Downloads/Arabidopsis_thaliana.TAIR10.48.gff3.gz |head -33|grep GeneID
```
..but instead we see **ID** in there:
```
(base) Users-MacBook-Pro:TomsWork user$ zcat ~/Downloads/Arabidopsis_thaliana.TAIR10.48.gff3.gz |head -17|grep ID
1       TAIR10  chromosome      1       30427671        .       .       .       ID=chromosome:1;Alias=CP002684.1,Chr1,NC_003070.9
1       araport11       gene    3631    5899    .       +       .       ID=gene:AT1G01010;Name=NAC001;biotype=protein_coding;description=NAC domain-containing protein 1 [Source:UniProtKB/Swiss-Prot%3BAcc:Q0WV96];gene_id=AT1G01010;logic_name=araport11
1       araport11       mRNA    3631    5899    .       +       .       ID=transcript:AT1G01010.1;Parent=gene:AT1G01010;biotype=protein_coding;transcript_id=AT1G01010.1
```
..but neither does such a thing appear, **Gene_ID** appear in Homo sapiens gff3:
```
-bash-4.2$ zcat /data/galaxy/database/files/datasets/000/dataset_399_files/Homo_sapiens.GRCh38.91.chromosome.13.gff3.gz|head -333|grep Gene_ID
```
..but, where we see, instead, **ID** and **gene_id**
```
-bash-4.2$ zcat /data/galaxy/database/files/datasets/000/dataset_399_files/Homo_sapiens.GRCh38.91.chromosome.13.gff3.gz|head -12
##gff-version 3
##sequence-region   13 1 114364328
#!genome-build Ensembl GRCh38.p10
#!genome-version GRCh38
#!genome-date 2013-12
#!genome-build-accession NCBI:GCA_000001405.25
#!genebuild-last-updated 2017-06
13      Ensembl chromosome      1       114364328       .       .       .       ID=chromosome:13;Alias=CM000675.2,chr13,NC_000013.11
###
13      havana  pseudogene      18174010        18178465        .       -       .       ID=gene:ENSG00000279924;Name=AL356585.4;biotype=unprocessed_pseudogene;gene_id=ENSG00000279924;logic_name=havana;version=1
13      havana  pseudogenic_transcript  18174010        18178465        .       -       .       ID=transcript:ENST00000623078;Parent=gene:ENSG00000279924;Name=AL356585.4-201;biotype=unprocessed_pseudogene;tag=basic;transcript_id=ENST00000623078;transcript_support_level=NA;version=1
13      havana  exon    18174010        18174103        .       -       .       Parent=transcript:ENST00000623078;Name=ENSE00003759026;constitutive=1;ensembl_end_phase=-1;ensembl_phase=-1;exon_id=ENSE00003759026;rank=4;version=1
```
### macport port upgrade outdated

This ran for hours on Mac OSX High Sierra and went from 2.6.3 to 2.6.4 with some good luck and bad luck:

**sudo port upgrade outdated**
### galaxy admin fetcher add URL for TAIR10 chromosome 1 gff3

This is what we put into the tool named **fetcher** last month on pc34 galaxy
```
ftp://ftp.ensemblgenomes.org/pub/plants/release-48/gff3/arabidopsis_thaliana/Arabidopsis_thaliana.TAIR10.48.gff3.gz
```
..which I think gave us the entire GFF3 for tair10.



### galaxy admin tools not there on raulPC even though they are there on pc34 galaxy and solution

-------------------------------------------------------
**UPDATE: 20201206_1410pm** this was fixed by going to:
-------------------------------------------------------
* Admin
* Tool Install and Uninstall
* Installed Only
* data_manager_fetch_genome_dbkeys_all_fasta
    * data_manager_fetch_genome_all_fasta_dbkey
    * Uninstall
    * Install

Inside of **Tool Install and Uninstall** and **data_manager_fetch_genome_dbkeys_all_fasta**, there was
only one thing with the RED **Uninstall** button.  In fact, it looked like that was the only one in the
entire place that said **Uninstall**.  After clicking to **Uninstall** and then to **Install**, we saw
some activity that looked like something was being installed.

**This fixed it** because when we click upon **Local Data** we now see that tool.  Worryingly, we also
do not see two other tools in **Local Data** that we do see on PC34.  Therefore, those tools, which were
in BLUE as in **Install** so we click to install.  We got the less recent version of fetcher because the
one on top seemed to do nothing after clicking **Install** but it seems like these are black box installs
sometimes and not much happens..it either changes to **RED Uninstall** or just stays **Blue Install** and
so its not clear if anything happens or an error.  It takes awhile also which is a problem because maybe
what looks like a doomed do-nothing Install is actually working.

-------------------------------------------------------
END UPDATE
-------------------------------------------------------
Because pc34 galaxy installation is a copy of raulPC69, its hard to understand why the admin tools
we need for gff3/annotation files are not there???

There is somehow state being stored outside of the filesystem and DB because it looks like our "local data"
is there but there is not any way to install another one.  Here we see identical files on pc34 and raulpc69:

```
(.venv) galaxy@E1-051569:~/galaxy$ ls -altF tool-data/|head
total 292
drwxrwxr-x  7 galaxy galaxy  4096 Nov 12 08:55 ./
drwxr-xr-x  3 galaxy galaxy  4096 Nov 12 08:55 tair10_48_12345MtPt/
drwxrwxr-x 26 galaxy galaxy  4096 Aug 28 16:38 ../
drwxr-xr-x  3 galaxy galaxy  4096 Aug 28 10:23 tair10/
drwxr-xr-x  3 galaxy galaxy  4096 Aug 28 10:21 hg38chr13/
-rw-rw-r--  1 galaxy galaxy     0 Aug 28 09:29 gene_annotation.loc
-rw-rw-r--  1 galaxy galaxy     0 Aug 28 09:29 gene_annotation.loc.sample
-rw-rw-r--  1 galaxy galaxy   828 Aug 28 09:28 all_fasta.loc.sample
-rw-rw-r--  1 galaxy galaxy  1463 Aug 28 09:28 fasta_indexes.loc
```
..same as pc34:
```
(.venv) -bash-4.2$ ls -altF tool-data/|head
total 292
drwxr-xr-x  3 galaxy galaxy  4096 Nov 12 08:55 tair10_48_12345MtPt/
drwxrwxr-x  7 galaxy galaxy  4096 Nov 12 08:55 ./
drwxrwxr-x 26 galaxy galaxy  4096 Aug 28 16:38 ../
drwxr-xr-x  3 galaxy galaxy  4096 Aug 28 10:23 tair10/
drwxr-xr-x  3 galaxy galaxy  4096 Aug 28 10:21 hg38chr13/
-rw-rw-r--  1 galaxy galaxy     0 Aug 28 09:29 gene_annotation.loc
-rw-rw-r--  1 galaxy galaxy     0 Aug 28 09:29 gene_annotation.loc.sample
-rw-rw-r--  1 galaxy galaxy   828 Aug 28 09:28 all_fasta.loc.sample
-rw-rw-r--  1 galaxy galaxy  1463 Aug 28 09:28 fasta_indexes.loc
```
..and in the galaxy interface we see these annotations on BOTH galaxy servers:

* http://e1-051569.science.psu.edu:8080/
* http://e1-052734.science.psu.edu:8080/

..when we click upon:

* MethylIT
* MethylIT: Count DMPs at gene-body

..we see tair10 and hg38_chr13 and all of them...but no way, only on raulPC69, to add more via:

* Admin
* local data

..where we read this problem: **You do not currently have any Data Managers installed. You can install some from a ToolShed.**
..which seems to be discussed here: https://github.com/galaxyproject/galaxy/issues/3171
..https://cloud.githubusercontent.com/assets/2264697/11728738/cccdda96-9f8b-11e5-828c-835b6b01a10b.png

That is a problem because I want to add more, I want to add tair10_chr1 and one each for one chromosome.

We try to fix like this, which is not done on pc34:

**cp config/tool_sheds_conf.xml.sample config/tool_sheds_conf.xml**

..as shown here:
```
(.venv) galaxy@E1-051569:~/galaxy$ cp !$ !$
cp config/tool_sheds_conf.xml.sample config/tool_sheds_conf.xml.sample
cp: ‘config/tool_sheds_conf.xml.sample’ and ‘config/tool_sheds_conf.xml.sample’ are the same file
(.venv) galaxy@E1-051569:~/galaxy$ cp config/tool_sheds_conf.xml.sample config/tool_sheds_conf.xml
(.venv) galaxy@E1-051569:~/galaxy$ stopgalaxy
galaxy:galaxy_uwsgi: stopped
galaxy:handler2: stopped
galaxy:handler4: stopped
galaxy:handler5: stopped
galaxy:handler3: stopped
galaxy:handler1: stopped
galaxy:handler6: stopped
galaxy:handler7: stopped
galaxy:handler0: stopped
(.venv) galaxy@E1-051569:~/galaxy$ cp confi
(.venv) galaxy@E1-051569:~/galaxy$ startgalaxy

```

### pc34 galaxy stopped

I probably stopped and forgot to start now that we use raulPC:
```
Last login: Fri Dec  4 12:52:22 EST 2020 on pts/0
-bash-4.2$ cd galaxy/
-bash-4.2$ . .venv/bin/activate
(.venv) -bash-4.2$ startgalaxy
```
..but that did not do it, need also to start postgres?:
```
-bash-4.2$ sudo systemctl stop postgresql
-bash-4.2$ sudo systemctl start postgresql
-bash-4.2$ sudo systemctl status postgresql
● postgresql.service - PostgreSQL database server
   Loaded: loaded (/usr/lib/systemd/system/postgresql.service; enabled; vendor preset: disabled)
   Active: active (running) since Sun 2020-12-06 08:54:27 EST; 4s ago
  Process: 21205 ExecStop=/usr/bin/pg_ctl stop -D ${PGDATA} -s -m fast (code=exited, status=0/SUCCESS)
  Process: 7337 ExecStart=/usr/bin/pg_ctl start -D ${PGDATA} -s -o -p ${PGPORT} -w -t 300 (code=exited, status=0/SUCCESS)
  Process: 7331 ExecStartPre=/usr/bin/postgresql-check-db-dir ${PGDATA} (code=exited, status=0/SUCCESS)
 Main PID: 7340 (postgres)
    Tasks: 7
   Memory: 11.9M
   CGroup: /system.slice/postgresql.service
           ├─7340 /usr/bin/postgres -D /var/lib/pgsql/data -p 5432
           ├─7341 postgres: logger process
           ├─7344 postgres: checkpointer process
           ├─7345 postgres: writer process
           ├─7346 postgres: wal writer process
           ├─7347 postgres: autovacuum launcher process
           └─7348 postgres: stats collector process

Dec 06 08:54:26 E1-052734.science.psu.edu systemd[1]: Starting PostgreSQL dat...
Dec 06 08:54:27 E1-052734.science.psu.edu systemd[1]: Started PostgreSQL data...
Hint: Some lines were ellipsized, use -l to show in full.
-bash-4.2$ ps -ef|grep slurm
slurm     1811     1  0 Nov08 ?        00:15:33 /usr/local/sbin/slurmctld
root      1845     1  0 Nov08 ?        00:00:09 /usr/local/sbin/slurmd
-bash-4.2$ ps -ef|grep mung
munge     1775     1  0 Nov08 ?        00:00:28 /usr/sbin/munged
-bash-4.2$  su - galaxy
Password:
Last login: Sun Dec  6 08:46:45 EST 2020 on pts/0
-bash-4.2$ cd galaxy/
-bash-4.2$ ps -ef|grep post
root      1545     1  0 Nov08 ?        00:00:10 /usr/libexec/postfix/master -w
postfix   1792  1545  0 Nov08 ?        00:00:01 qmgr -l -t unix -u
postfix   1813  1545  0 07:33 ?        00:00:00 pickup -l -t unix -u
postgres  7340     1  0 08:54 ?        00:00:00 /usr/bin/postgres -D /var/lib/pgsql/data -p 5432
postgres  7341  7340  0 08:54 ?        00:00:00 postgres: logger process
postgres  7344  7340  0 08:54 ?        00:00:00 postgres: checkpointer process
postgres  7345  7340  0 08:54 ?        00:00:00 postgres: writer process
postgres  7346  7340  0 08:54 ?        00:00:00 postgres: wal writer process
postgres  7347  7340  0 08:54 ?        00:00:00 postgres: autovacuum launcher process
postgres  7348  7340  0 08:54 ?        00:00:00 postgres: stats collector process
galaxy    7511  7455  0 08:56 pts/0    00:00:00 grep --color=auto post
-bash-4.2$ . .venv/bin/activate
(.venv) -bash-4.2$ startgalaxy
galaxy:galaxy_uwsgi: started
galaxy:handler0: started
galaxy:handler1: started
galaxy:handler2: started
galaxy:handler3: started
galaxy:handler4: started
galaxy:handler5: started
galaxy:handler6: started
galaxy:handler7: started
(.venv) -bash-4.2$ !net
netstat -tan|grep 8080
tcp        0      0 0.0.0.0:8080            0.0.0.0:*               LISTEN
```

### galaxy per-chromosome per-context counts files

We have strange very-last files in the output of galaxy methylit analysis.
This has not been carefully understood but the same files seem okay in the
cancer analysis and the only major difference that is obvious is that the
cancer example counts data and the annotation file are all and only on one
chromosome, chr13.  Therefore, we get set by creating and installing the
annotation for tair10 as per-chromosome and per-context and we also create
the counts files for tair graft data to have only per-chromosome and
per-context counts.  Here we see the creation of chr1 CHH data for 6 samples:

### galaxy methylit troubleshooting graft

In galaxy on raulPC this morning we reran all of the graft steps but first we reran the
tool **Read Counts**, both times, and did it this time with names like this:

* BS16,BS17,BS18
* BS13,BS14,BS15,BS16,BS17,BS18

..and now, with good names without a hyphen character, we reran all the subsequent steps
in exactly the same way but with these new GRanges objects.  In the end we fail again
at **estimateCutpoint** galaxy tool but this time we see what appears to be good values
for **--treatment-names** and **--control-names**.  Here we see **readRDS()** to see
the galaxy **potdimp** object that we downloaded, it looks okay and so it seems like
we are calling galaxy tool **estimateCutpoint** wrongly somehow:

```
> galaxy816potdimp <- readRDS("~/Downloads/Galaxy816-[MethylIT__Select_cytosine_sites_on_data_814_and_data_811].potdimp")
> class(galaxy816potdimp)
[1] "pDMP"   "InfDiv" "list" 
> names(galaxy816potdimp)
[1] "BS13" "BS14" "BS15" "BS16" "BS17" "BS18"
> dim(mcols(galaxy816potdimp$BS13)
+ )
[1] 9610   10
> head(mcols(galaxy816potdimp$BS13))
DataFrame with 6 rows and 10 columns
         c1        t1        c2        t2        p1        p2         TV
  <numeric> <numeric> <numeric> <numeric> <numeric> <numeric>  <numeric>
1         8         2         6         6  0.783135  0.628334 -0.3000000
2         3        15         0        21  0.472162  0.262489 -0.1666667
3        10         4         6        10  0.747990  0.534754 -0.3392857
4         4        17         3        21  0.461544  0.325962 -0.0654762
5        14         5        11        10  0.754976  0.607773 -0.2130326
6         7         6         9         0  0.675869  0.874333  0.4615385
     bay.TV      hdiv       wprob
  <numeric> <numeric>   <numeric>
1 -0.154801  0.348419 0.020424192
2 -0.209673  0.979735 0.000101837
3 -0.213236  0.801304 0.000440177
4 -0.135582  0.453188 0.008197592
5 -0.147203  0.528176 0.004317372
6  0.198464  0.687267 0.001133020
```
..we also see that none of the samples are empty:
```
> dim(mcols(galaxy816potdimp$BS14))
[1] 8390   10
> dim(mcols(galaxy816potdimp$BS15))
[1] 9285   10
> dim(mcols(galaxy816potdimp$BS16))
[1] 23167    10
> dim(mcols(galaxy816potdimp$BS17))
[1] 22380    10
> dim(mcols(galaxy816potdimp$BS18))
[1] 22202    10
```

### galaxy troubles continue

We have these problems:

* bad GEO file
* bad **pattern argument value** rewriting problem in at least two galaxy MethylIT tools
* output of getDIMPatGenes may be a problem even after download and use of **readRDS()** call

Mitigation so far:

* uploaded files to cloud so we can pull CG only samples, solves bad GEO and

### poolFromGRlist functional testing for galaxy

This is lifted directly from MethylIT::poolFromGRlist examples section and works:

```
gr1 <- makeGRangesFromDataFrame(
data.frame(chr = 'chr1', start = 11:15, end = 11:15, strand = '*',
mC = 1, uC = 1:5), keep.extra.columns = TRUE)
gr2 <- makeGRangesFromDataFrame(
data.frame(chr = 'chr1', start = 11:15, end = 11:15,
strand = '*', mC = 1, uC = 1:5), keep.extra.columns = TRUE)
answer <- poolFromGRlist(list(gr1, gr2), stat = 'mean', verbose = FALSE)


equalToOne_func = function(x) return(x == 1)
equalToGRanges_func = function(x) return(x == "GRanges")

stopifnot(1==1)
stopifnot(equalToGRanges_func(class(answer)))
stopifnot(equalToOne_func(mcols(answer)[,1][1]))

print("ok")

```

### galaxy functional testing update

Lots of chatter last week about galaxy testing that I did not transfer as documentation to here
and so we add some things:

```
Dear Greg,

The code below should run if you have the attached file at /var/tmp/file23.cov.

That file has 10 lines of typical coverage data.  It is in a format that bismark creates.
The contents of the file are also pasted farther below.
The paste job seems to have changed the tabs to spaces, so the attached file might be better.

Normally R package test code uses the "testthat" package and MethylIT functions all have some (or should have) some testthat code which runs during package building.  I pasted the testthat code for function readCounts2GRangesList even farther below.  Its a good test and checks for working calls and calls that should create and error.  Not all MethylIT functions have as nice code.  Even so, these existing tests would be nice to reuse if possible.  They are located in the package code itself.  The test shown below is found in that package at this location:
MethylIT/tests/testthat/test_readCounts2GRangesList.R

All of the testthat tests are in there: MethylIT/tests/testthat/

The testthat tests do not require external files but, like the test_readCounts2GRangesList.R code
shown farther below, generally create their own data--that test actually creates a file, uses it, and then removes it.

The simple test shown immediately below needs the file named file23.cov (attached to this email) to be located
at /var/tmp/file23.cov and the code does not remove the file.  It tests that the first methylated counts column of the
first row is equal to 3.  It also checks that the class of the returned object is "list".

This function, readCounts2GRangesList, is more complicated than either of these tests actually test.  Technically
speaking the "test coverage" is not complete.

I am not sure if this is the kind of test dataset that you need.

Thanks,
Tom

library(BiocManger)
library(MethylIT)
library(MethylIT.utils)

filename=c("/var/tmp/file23.cov")
LR <- try(readCounts2GRangesList(filenames = filename, remove = FALSE, sample.id = 'test23', columns = c(seqnames = 1, start = 2, strand = 3, mC = 4, context = 5, uC = 6)),silent = TRUE)

equalToThree_func = function(x) return(x == 3)
equalToList_func = function(x) return(x == "list")

stopifnot(1==1)
stopifnot(equalToList_func(class(LR)))
stopifnot(equalToThree_func(mcols(LR[[1]][1,1])[1,1]))

print("ok")





$ cat /var/tmp/file23.cov
Chr1 109 + 3 0 CG CGA
Chr1 110 - 1 0 CG CGG
Chr1 115 + 4 0 CG CGG
Chr1 116 - 1 0 CG CGG
Chr1 161 + 4 2 CG CGT
Chr1 162 - 2 1 CG CGA
Chr1 310 + 5 2 CG CGA
Chr1 311 - 2 1 CG CGT
Chr1 500 + 8 5 CG CGT
Chr1 501 - 1 2 CG CGA







$ cat MethylIT/tests/testthat/test_readCounts2GRangesList.R

library(testthat)
library(GenomicRanges)
library(MethylIT)

context("readCounts2GRangesList tests")

test_that("readCounts2GRangesList from a file with 'gz' in the name", {
  # Create a cov file with it's file name including "gz" (tarball extension)
  filename <- "./filegz.cov"
  gr1 = sortBySeqnameAndStart(as(c("chr1:1-1", "chr1:2-2"), "GRanges"))
  write.table(as.data.frame(gr1),
              file = filename, col.names = FALSE, row.names = FALSE,
              quote = FALSE)

  # Load and delete the file
  gr2 <- readCounts2GRangesList(filenames = filename,
                                sample.id = 'test',
                                columns = c(seqnames = 1, start = 2, end = 3),
                                verbose = TRUE)
  file.remove(filename)

  # Test if gr1 == gr2
  expect_true( all(gr1 == gr2$test) )
})

test_that("readCounts2GRangesList with wrong columns argument", { filename <- "./file.cov"
  gr1 = sortBySeqnameAndStart(as(c("chr1:1-1", "chr1:2-2"), "GRanges"))
  write.table(as.data.frame(gr1),
              file = filename, col.names = FALSE, row.names = FALSE,
              quote = FALSE)

  # We expect an error!!
  expect_error(
    readCounts2GRangesList(files_names = filename,
                           sample.id = 'test',
                           columns = c(seqnames = 1, start = 2, end = 2),
                           verbose = TRUE))

  # Clean up
  file.remove(filename)
})
```
### galaxy testing glmDataSet JSON experimental design

There is more stuff at **glmDataSet** tool including a new capacity to upload experimental design info via JSON

### added misc/MethylIT/galaxyFuncTest_readCounts2GRangesList.R for possible use with galaxy functional testing

This file:

**misc/MethylIT/galaxyFuncTest_readCounts2GRangesList.R**

..has this code which works if the file is located at /var/tmp/file23.cov:

```
library(BiocManger)
library(MethylIT)
library(MethylIT.utils)

filename=c("/var/tmp/file23.cov")
LR <- try(readCounts2GRangesList(filenames = filename, remove = FALSE, sample.id = 'test23', columns = c(seqnames = 1, start = 2, strand = 3, mC = 4, context = 5, uC = 6)),silent = TRUE)

equalToThree_func = function(x) return(x == 3)
equalToList_func = function(x) return(x == "list")

stopifnot(1==1)
stopifnot(equalToList_func(class(LR)))
stopifnot(equalToThree_func(mcols(LR[[1]][1,1])[1,1]))

print("ok")
```

### added misc/MethylIT/file23.cov for possible use with galaxy functional testing, this one made with bismark

The misc/MethylIT/file.cov file looked a bit funny and it was because bismark did not make it.
And so we added **misc/MethylIT/file23.cov** which was made by bismark:

```
64 ~]$ head /data/experiments/F15FTSUSAT0821_ARAhlaM/bismarkCytosineReport/23.CpG.cov
Chr1    109     +       3       0       CG      CGAChr1    110     -       1       0       CG      CGG
Chr1    115     +       4       0       CG      CGG
Chr1    116     -       1       0       CG      CGG
Chr1    161     +       4       2       CG      CGT
Chr1    162     -       2       1       CG      CGA
Chr1    310     +       5       2       CG      CGA
Chr1    311     -       2       1       CG      CGT
Chr1    500     +       8       5       CG      CGT
Chr1    501     -       1       2       CG      CGA

64 ~]$ head /data/experiments/F15FTSUSAT0821_ARAhlaM/bismarkCytosineReport/23.CpG.cov >> /var/tmp/file23.cov
```

### added misc/MethylIT/file.cov for possible use with galaxy functional testing

This new file is also here: **misc/MethylIT/file.cov**
..and was created like this on titan64:

```ls -lh /data/experiments/F15FTSUSAT0821_ARAhlaM/bismarkCoverage/byChr/31.chr4.bismark.cov
-rw-r--r--. 1 759700 mackenzie 71M Oct 30  2017 /data/experiments/F15FTSUSAT0821_ARAhlaM/bismarkCoverage/byChr/31.chr4.bismark.cov

(base) [64 ~]$ tail /data/experiments/F15FTSUSAT0821_ARAhlaM/bismarkCoverage/byChr/31.chr4.bismark.cov
Chr4    18584608        18584608        20      1       4
Chr4    18584615        18584615        0       0       5
Chr4    18584617        18584617        80      4       1
Chr4    18584618        18584618        80      4       1
Chr4    18584624        18584624        0       0       5
Chr4    18584629        18584629        0       0       5
Chr4    18584634        18584634        0       0       5
Chr4    18584643        18584643        0       0       5
Chr4    18584645        18584645        0       0       5
Chr4    18584646        18584646        20      1       4
(base) [64 ~]$ tail /data/experiments/F15FTSUSAT0821_ARAhlaM/bismarkCoverage/byChr/31.chr4.bismark.cov >> /var/tmp/file.cov
```

### glmDataSet and countTest2 example code for Galaxy development

This might be a simple way of looking at it:
```
url <- paste0("https://github.com/genomaths/genomaths.github.io/raw/master/AT_memory/","dmps_mm-vs-nm_all-context_gen1_nmRef_min-meth-3_cov-4_04-16-20.RData")
temp <- tempfile(fileext = ".RData")
download.file(url = url, destfile = temp)
load(temp)
ls()
class(dmps)

#[1] "pDMP" "list"

url <- paste0("https://github.com/genomaths/genomaths.github.io/raw/master/","Annotation/Arabidopsis_thaliana_genes_TAIR10.38.gtf.RData")
temp2 <- tempfile(fileext = ".RData")
download.file(url = url, destfile = temp2)
load(temp2)
class(dmps)

#[1] "pDMP" "list"

class(dmps)<-"list"
class(dmps)

# "list"

GENES <- genes[genes$type == "gene"]
dmps_gdag <-getDIMPatGenes(dmps,GENES = GENES)
class(dmps_gdag)

#[1] "list"

names(dmps_gdag)

#[1] "M_1_105" "M_1_168" "M_1_179" "M_1_27"  "M_1_3"   "NM_1_12" "NM_1_45" "NM_1_70" "NM_1_86"

colData <- data.frame(condition = factor(c("MM", "MM","MM","MM", "MM","NM","NM","NM","NM"),levels = c("NM", "MM")),names(dmps),row.names = 2)
colData

#        condition
#M_1_105        MM
#M_1_168        MM
#M_1_179        MM
#M_1_27         MM
#M_1_3          MM
#NM_1_12        NM
#NM_1_45        NM
#NM_1_70        NM
#NM_1_86        NM

dmps_gdag_ugr <- uniqueGRanges(dmps_gdag,columns = 2)

class(dmps_gdag_ugr)

#[1] "GRanges"
#attr(,"package")
#[1] "GenomicRanges"

names(mcols(dmps_gdag_ugr))

#[1] "DIMPs"   "DIMPs.1" "DIMPs.2" "DIMPs.3" "DIMPs.4" "DIMPs.5" "DIMPs.6" "DIMPs.7" "DIMPs.8"

names(mcols(dmps_gdag_ugr))<-names(dmps)
names(mcols(dmps_gdag_ugr))

#[1] "M_1_105" "M_1_168" "M_1_179" "M_1_27"  "M_1_3"   "NM_1_12" "NM_1_45" "NM_1_70" "NM_1_86"

glmDmpsColData <- glmDataSet(GR = dmps_gdag_ugr, colData = colData)
dmgs_mcpi8_mgcv11_ml2fc1_cpbp01 <- countTest2(DS = glmDmpsColData,minCountPerIndv = 8,maxGrpCV = c(1, 1),Minlog2FC = 1,CountPerBp = 0.01,test = 'LRT',num.cores = 1L,verbose = TRUE)
class(dmgs_mcpi8_mgcv11_ml2fc1_cpbp01)

#[1] "GRanges"
#attr(,"package")
#[1] "GenomicRanges"

dim(mcols(dmgs_mcpi8_mgcv11_ml2fc1_cpbp01))

#[1] 172  17

head(dmgs_mcpi8_mgcv11_ml2fc1_cpbp01)
#GRanges object with 6 ranges and 17 metadata columns:
#      seqnames          ranges strand |   M_1_105   M_1_168   M_1_179    M_1_27     M_1_3   NM_1_12   NM_1_45   NM_1_70   NM_1_86
#         <Rle>       <IRanges>  <Rle> | <numeric> <numeric> <numeric> <numeric> <numeric> <numeric> <numeric> <numeric> <numeric>
#  [1]        1 1444983-1446116      + |         9        15        11        19         8         6         1         2         5
#  [2]        1 3572674-3573173      + |         5         7        26         7         5         1         0         0         0
#  [3]        1 3892580-3894677      + |        25        20        25        23        24         0         9         6         4
#  [4]        1 6588542-6589338      + |        14        10         4        10         2         0         3         1         2
#  [5]        1 6589835-6592762      + |        48        45        52        41        43         8         9        14         4
#  [6]        1 7072192-7076619      - |        64        42        61        48        53         9        13        11         4
#                log2FC  scaled.deviance               pvalue          model             adj.pval    CT.SignalDensity   TT.SignalDensity
#             <numeric>        <numeric>            <numeric>       <factor>            <numeric>           <numeric>          <numeric>
#  [1] 1.30902401197386  5.9359522378911   0.0148350509496814 Neg.Binomial.W   0.0171250252573503 0.00308641975308642 0.0109347442680776
#  [2] 2.17475172148416 17.4977825938594 2.87642969334298e-05   Neg.Binomial 7.38426727246256e-05               5e-04               0.02
#  [3] 1.44100172293269 8.89929149746455  0.00285281326399316 Neg.Binomial.W  0.00408903234505686 0.00226406101048618 0.0111534795042898
#  [4] 1.38753798851268 5.22864901526428    0.022217783015244 Neg.Binomial.W   0.0244965299911665 0.00188205771643664 0.0100376411543287
#  [5] 1.66294714596632 59.4466388909327   1.256555209094e-14 Neg.Binomial.W 1.54376782831548e-13 0.00298838797814208 0.0156420765027322
#  [6] 1.75839738893679 14.6174093198146 0.000131692328745752 Neg.Binomial.W 0.000272904584870714 0.00208897922312556 0.0121047877145438
#      SignalDensityVariation
#                   <numeric>
#  [1]    0.00784832451499118
#  [2]                 0.0195
#  [3]    0.00888941849380362
#  [4]     0.0081555834378921
#  [5]     0.0126536885245902
#  [6]     0.0100158084914182
#  -------
#  seqinfo: 5 sequences from an unspecified genome; no seqlengths
```

```
> rm(list=ls())
> ## ===== Download methylation data from Github ========
> url <- paste0("https://github.com/genomaths/genomaths.github.io/raw/master/AT_memory/",
+               "dmps_mm-vs-nm_all-context_gen1_nmRef_min-meth-3_cov-4_04-16-20.RData")
> temp <- tempfile(fileext = ".RData")
> download.file(url = url, destfile = temp)
trying URL 'https://github.com/genomaths/genomaths.github.io/raw/master/AT_memory/dmps_mm-vs-nm_all-context_gen1_nmRef_min-meth-3_cov-4_04-16-20.RData'
Content type 'application/octet-stream' length 34340502 bytes (32.7 MB)
==================================================
downloaded 32.7 MB

> load(temp)
> ls()
[1] "dmps" "temp" "url"
> class(dmps)
[1] "pDMP" "list"
> ## ===== Download methylation data from GitHub ========
> url <- paste0("https://github.com/genomaths/genomaths.github.io/raw/master/",
+               "Annotation/Arabidopsis_thaliana_genes_TAIR10.38.gtf.RData")
> temp <- tempfile(fileext = ".RData")
> download.file(url = url, destfile = temp)
trying URL 'https://github.com/genomaths/genomaths.github.io/raw/master/Annotation/Arabidopsis_thaliana_genes_TAIR10.38.gtf.RData'
Content type 'application/octet-stream' length 1544700 bytes (1.5 MB)
==================================================
downloaded 1.5 MB

> load(temp)
> class(dmps)
[1] "pDMP" "list"
> class(dmps)<-"list"
> names(mcols(dmps$M_1_105))
 [1] "c1"      "t1"      "c2"      "t2"      "p1"      "p2"      "TV"      "bay.TV"  "hdiv"    "wprob"   "context"
> class(dmps)
[1] "list"
>
> GENES <- genes[genes$type == "gene"]
>
> class(dmps)
[1] "list"
> dmps_gdag <-getDIMPatGenes(dmps,GENES = GENES)
> class(dmps_gdag)
[1] "list"
> names(dmps_gdag)
[1] "M_1_105" "M_1_168" "M_1_179" "M_1_27"  "M_1_3"   "NM_1_12" "NM_1_45" "NM_1_70" "NM_1_86"
> colData <- data.frame(condition = factor(c("MM", "MM","MM","MM", "MM",
+                                            "NM","NM","NM","NM"),
+                                          levels = c("NM", "MM")),
+                       names(dmps),
+                       row.names = 2)
> dmps_gdag_ugr <- uniqueGRanges(dmps_gdag,columns = 2)
 *** Building coordinates for the new GRanges object ...
 *** Strand information is preserved ...
 *** Processing GRanges for sample: #1
 *** Processing GRanges for sample: #2...
 *** Processing GRanges for sample: #3...
 *** Processing GRanges for sample: #4...
 *** Processing GRanges for sample: #5...
 *** Processing GRanges for sample: #6...
 *** Processing GRanges for sample: #7...
 *** Processing GRanges for sample: #8...
 *** Processing GRanges for sample: #9...
 *** Sorting by chromosomes and start positions...
> class(dmps_gdag_ugr)
[1] "GRanges"
attr(,"package")
[1] "GenomicRanges"
> names(mcols(dmps_gdag_ugr))
[1] "DIMPs"   "DIMPs.1" "DIMPs.2" "DIMPs.3" "DIMPs.4" "DIMPs.5" "DIMPs.6" "DIMPs.7" "DIMPs.8"
> names(mcols(dmps_gdag_ugr))<-names(dmps)
> names(mcols(dmps_gdag_ugr))
[1] "M_1_105" "M_1_168" "M_1_179" "M_1_27"  "M_1_3"   "NM_1_12" "NM_1_45" "NM_1_70" "NM_1_86"
> glmDmpsColData <- glmDataSet(GR = dmps_gdag_ugr, colData = colData)
> dmgs_mcpi8_mgcv11_ml2fc1_cpbp01 <- countTest2(DS = glmDmpsColData,
+                    minCountPerIndv = 8,
+                    maxGrpCV = c(1, 1),
+                    Minlog2FC = 1,
+                    CountPerBp = 0.01,
+                    test = 'LRT',
+                    num.cores = 2L,
+                    verbose = TRUE)
*** Number of GR after filtering counts 178
*** GLM...
> class(dmgs_mcpi8_mgcv11_ml2fc1_cpbp01)
[1] "GRanges"
attr(,"package")
[1] "GenomicRanges"
> dim(mcols(dmgs_mcpi8_mgcv11_ml2fc1_cpbp01))
[1] 172  17
> head(dmgs_mcpi8_mgcv11_ml2fc1_cpbp01)
GRanges object with 6 ranges and 17 metadata columns:
      seqnames          ranges strand |   M_1_105   M_1_168   M_1_179    M_1_27     M_1_3   NM_1_12   NM_1_45   NM_1_70   NM_1_86
         <Rle>       <IRanges>  <Rle> | <numeric> <numeric> <numeric> <numeric> <numeric> <numeric> <numeric> <numeric> <numeric>
  [1]        1 1444983-1446116      + |         9        15        11        19         8         6         1         2         5
  [2]        1 3572674-3573173      + |         5         7        26         7         5         1         0         0         0
  [3]        1 3892580-3894677      + |        25        20        25        23        24         0         9         6         4
  [4]        1 6588542-6589338      + |        14        10         4        10         2         0         3         1         2
  [5]        1 6589835-6592762      + |        48        45        52        41        43         8         9        14         4
  [6]        1 7072192-7076619      - |        64        42        61        48        53         9        13        11         4
                log2FC  scaled.deviance               pvalue          model             adj.pval    CT.SignalDensity   TT.SignalDensity
             <numeric>        <numeric>            <numeric>       <factor>            <numeric>           <numeric>          <numeric>
  [1] 1.30902401197386  5.9359522378911   0.0148350509496814 Neg.Binomial.W   0.0171250252573503 0.00308641975308642 0.0109347442680776
  [2] 2.17475172148416 17.4977825938594 2.87642969334298e-05   Neg.Binomial 7.38426727246256e-05               5e-04               0.02
  [3] 1.44100172293269 8.89929149746455  0.00285281326399316 Neg.Binomial.W  0.00408903234505686 0.00226406101048618 0.0111534795042898
  [4] 1.38753798851268 5.22864901526428    0.022217783015244 Neg.Binomial.W   0.0244965299911665 0.00188205771643664 0.0100376411543287
  [5] 1.66294714596632 59.4466388909327   1.256555209094e-14 Neg.Binomial.W 1.54376782831548e-13 0.00298838797814208 0.0156420765027322
  [6] 1.75839738893679 14.6174093198146 0.000131692328745752 Neg.Binomial.W 0.000272904584870714 0.00208897922312556 0.0121047877145438
      SignalDensityVariation
                   <numeric>
  [1]    0.00784832451499118
  [2]                 0.0195
  [3]    0.00888941849380362
  [4]     0.0081555834378921
  [5]     0.0126536885245902
  [6]     0.0100158084914182
  -------
  seqinfo: 5 sequences from an unspecified genome; no seqlengths
```
### galaxy countTest2 and glmDataSet reportedly working

Greg showed us good output.  When I login to PC34 I see both tools but not yet at raulPC69.
Even so, when I open glmDataset and hope it will eat my recently created (and GREEN) output
countDIMPatGenes, its not there in the select box.

It seems impossible that this glmDataSet tool could work without the **colData** argument
which tells which samples in the list of GRanges are treatment and which are control


### lab meeting cancelled, sent off galaxyTestMaker.tar

This tar file has a tiny test for every major function

### countTest2 and glmDataSet galaxy test dataset

```
dfChr1 <- data.frame(chr = 'chr1', start = 11:15, end = 11:15,strand = c('+','-','+','*','.'), score = 1:5)
dfChr2 <- data.frame(chr = 'chr1', start = 11:15, end = 11:15,strand = c('+','-','+','*','.'), score = 1:5)
dfChr3 <- data.frame(chr = 'chr1', start = 11:15, end = 11:15,strand = c('+','-','+','*','.'), score = 1:5)

```

```
countData <- matrix(sample.int(200, 500, replace = TRUE), ncol = 4)
colnames(countData) <- c('A1','A2','B1','B2')
start <- seq(1, 25e4, 2000)
end <- start + 1000
chr <- c(rep('chr1', 70), rep('chr2', 55))
GR <- GRanges(seqnames = chr, IRanges(start = start, end = end))
mcols(GR) <- countData

## Gene IDs
names(GR) <- paste0('gene', 1:length(GR))

## An experiment design is set.
colData <- data.frame(condition = factor(c('A','A','B','B')),
c('A1','A2','B1','B2'), row.names = 2)

glmDataSet(GR = GR, colData = colData)
```

### MethylIT galaxy test data

I forgot to mail this code and RData files:

```
library(BiocManager)
library(MethylIT)

filename=c("/var/tmp/file23.cov")
rc2grl <- readCounts2GRangesList(filenames = filename, remove = FALSE, sample.id = 'test23', columns = c(seqnames = 1, start = 2, strand = 3, mC = 4, context = 5, uC = 6))
save(rc2grl,file="/var/tmp/rc2grl.RData")
pfgrl <- poolFromGRlist(rc2grl)
save(rc2grl,file="/var/tmp/rc2grl.RData")

load(hd1,file="/var/tmp/hd1.RData")
gof1 <- gofReport(HD=hd1,model=c("Weibull2P"),column=9,output="all",verbose=FALSE)
save(gof1,file="/var/tmp/gof1.RData")

ps1 <- getPotentialDIMP(LR = hd1,nlms = gof1$nlms, div.col = 9L,dist.name = gof1$bestModel)
save(ps1,file="/var/tmp/ps1.RData")

ecp1 <- estimateCutPoint( LR = ps1, simple = TRUE, div.col = 9, control.names = c("W_3_3"), treatment.names = c("M_3_5"), column = c( hdiv = TRUE, bay.TV = TRUE, wprob = TRUE, pos = TRUE ), classifier1 = "qda", prop = 0.6, clas.perf = TRUE, verbose = FALSE )
save(ecp1,file="/var/tmp/ecp1.RData")

dmps1 <- selectDIMP(ps1, div.col = 9, cutpoint = ecp1$cutpoint)
save(dmps1,file="/var/tmp/dmps1.RData")


load(genes1, file="/var/tmp/genes1.RData")

gdag1 <- getDIMPatGenes(GR = dmps1, GENES = genes1, ignore.strand = TRUE)
gdag1 <- uniqueGRanges( gdag1, columns = 2L, ignore.strand = TRUE, type = "equal" )
colnames(mcols(gdag1)) <- names(dmps1)
save(gdag1,file="/var/tmp/gdag1.RData")

colData1 <- data.frame(condition = factor( c("WT", "ML"), levels = c("WT", "ML") ), names(dmps1), row.names = 2)
save(colData1,file="/var/tmp/colData1.RData")

glmds1 <- glmDataSet(GR = gdag1, colData = colData1)
save(glmds1,file="/var/tmp/glmds1.RData")

dmgs1 <- countTest2( DS = glmds1, minCountPerIndv = 1, maxGrpCV = c(1.2, 1.2), Minlog2FC = 0.5, CountPerBp = 0.00001, test = "LRT", verbose = TRUE )
save(glmds1,file="/var/tmp/dmgs1.RData")
```

### galaxy test datasets generation

This is difficult for these reasons:

* many functions, like estimateDivergence, have testthat that uses embedded DATA
* gofReport uses embedded data in example and testthat


