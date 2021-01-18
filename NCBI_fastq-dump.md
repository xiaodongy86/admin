#It is kind of a long read but it explains how to create the symbolic link you will want to have in place if you ever try to download NCBI data to titan 
#with the fastq-dump program.  Creating this link is the same thing we need to do to keep the rstudio-server from filling up our home directory.  
NCBI_fastq dump_TIPS
ncbi automatically downloads data to home directory
No matter where you run fastq-dump you will automatically be forced to download tons of data into a hard coded folder named ncbi in your home directory. This plan WILL NOT WORK:

'
change directory to spacious filesystem: cd /data5/bigData/
run fastq-dump SRR123456
'

If that sample SRR123456 is larger than 5 GB, then your home directory will grow to use more data at /home/username/ than the ECOS NFS server disk quota will allow. You will receive emails warning about the problem and eventually you will be unable to login again until you email the helpdesk to remove the ncbi folder and all of its contents.

Therefore, we must create a link named ncbi in our home directory and that link must point to another location where there is enough storage capacity to hold all of the data you will download using fastq-dump. Firstly remove an existing ncbi link or directory at the root of your home directory:

file /home/username/ncbi
If file tells us that it is a directory, then we could rename it to prevent losing whatever data is in that folder:

mv /home/username/ncbi /home/username/ncbi_20210115/
If file tells us that it is a symbolic link, then we could let it be and use it the way it is. Here we see:

a file named ncbi in a home directory that is a link
plenty of storage capacity where that link points to (315 GB available)
-bash-4.2$ file /home/twm118/ncbi 
/home/twm118/ncbi: symbolic link to `/data2/ncbi'

-bash-4.2$ ls -al /home/twm118/ncbi
lrwxrwxrwx 1 twm118 root 11 Dec 28 09:30 /home/twm118/ncbi -> /data2/ncbi

-bash-4.2$ df -ha |egrep "Use|data2"
Filesystem                                 Size  Used Avail Use% Mounted on
/dev/sdg1                                  9.1T  8.8T  315G  97% /data2
Notice that symbolic links can be very confusing, if you look very closely and notice the difference between the file command with a trailing slash and without a trailing slash:

-bash-4.2$ pwd
/home/twm118

-bash-4.2$ file ncbi
ncbi: symbolic link to `/data2/ncbi'

-bash-4.2$ file ncbi/
ncbi/: directory
Inside of that target-of-the-symbolic-link folder we see some existing sra files that are using 120 GB of storage:

-bash-4.2$ ls /data2/ncbi/public/sra/
README.txt  SRR9321764.sra  SRR9321765.sra  SRR9321766.sra  SRR9668888.sra  SRR9668889.sra  SRR9668890.sra  SRR9668891.sra  SRR9668892.sra  SRR9668893.sra  SRR9668894.sra

-bash-4.2$ du -ah /data2/ncbi/public/sra/|tail -1
120G	/data2/ncbi/public/sra/
We are very happy that our home directory did not become full and our symbolic link caused that storage to be used on a filesystem (at /data2/) with enough storage capacity to house the files.

If we do not like that target (/data2/ncbi) for our link (/home/username/ncbi) then we can change it. We can remove the link and that will not affect the data where the link was pointing to (the data at /data2/ncbi/) will be unaffected:

rm /home/username/ncbi
It would have been a mistake to use a trailing slash to remove the symbolic link named ncbi, as we just learned, but fortunately the rm command does not remove directories and so we would see this helpful protection and error message if we had included a trailing slash:

-bash-4.2$ rm ncbi/
rm: cannot remove ‘ncbi/’: Is a directory
After our home directory no longer has anything named ncbi:

-bash-4.2$ ls -al ~/ncbi
ls: cannot access /home/twm118/ncbi: No such file or directory
..then we are ready to create a symbolic link pointing to a filesystem location that has enough space to hold lots of data:

-bash-4.2$ pwd
/home/twm118
-bash-4.2$ mkdir /data/users/twm118/ncbi
-bash-4.2$ ln -s /data/users/twm118/ncbi /home/twm118/ncbi
-bash-4.2$ file /home/twm118/ncbi
/home/twm118/ncbi: symbolic link to `/data/users/twm118/ncbi'
-bash-4.2$ cp /etc/issue /home/twm118/ncbi/
-bash-4.2$ ls /data/users/twm118/ncbi/
issue
Now we are ready to run fastq-dump and when it creates very large files at /home/twm118/ncbi, they will actually be written to our large filesystem location at /data/users/twm118/ncbi and our home directory will not fill up.

