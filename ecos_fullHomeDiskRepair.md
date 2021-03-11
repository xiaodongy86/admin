
### Worked full ecos home directory problems

If your ECOS home directory fills up then you will be unable to login anywhere.
This happens around here because RStudio-server, by default, stores your stuff
in a hidden directory in your home directory named **.rstudio**.  And so user
abc123 would be writing data to /home/abc123/.rstudio/ as they use the
rstudio-server.  MethylIT can easily fill a disk with a quota of 5GB, 10GB and
even 25GB, all of which have happened.  The solution to this problem is
discussed on this page (search this page for "TARGET" to see the solution).
But the solution to a full home directory is more difficult because you
cannot login to delete files.  These solutions do work:

* if already logged in to any ECOS machine, you can use it to delete files
* if already logged into Rstudio-server, you can write R code to find and delete files
* a nearby friend can login and allow you type, for example, these commands:
** su - abc123
** du -a |sort -rn|more
** rm bigFile.zip
** exit

For some reason, even with a full disk, **su - username123** does allow you to
get a shell and from there you can delete files which will allow you to free
enough disk space so that you can again login.

Alternatively, you can ask the ecos helpdesk to delete some things for you by
emailing them at helpdesk@science.psu.edu

### changed rstudio-server's **cache** location for locals

Spending anytime on rstudio-server reveals that it uses lots of space on your
disk.  Because we login as our PSU account, we login with a home directory that
is our ECOS space.  That home directory, found in /home/user123/ when logging in
to any linux machine has a  major limitation:  **there is a 5GB data maximum**.
After getting to 4.8GB, an email is automatically sent to you warning that you
are about to reach your limit.  A few minutes later, you get another mail saying
that you are over your maximum limit 5.0GB.  Without a single byte of available
space in your home directory, you are unable even to login at all to any
machine.  Logging in requires a few bytes of storage and the enforcing quota
system denies even a trickle and causes login failure.  In most cases, because
nobody can read/delete anyone else's home directory, this will require mailing
the ecos helpdesk at helpdesk@science.psu.edu.  In both recent cases, however,
we were either:

* already logged in somewhere (and so could delete files to free up space), or
* had an already open rstudio-server window (and so could delete files to free up space either in R with function calls or via the Rstudio **environment** window pane)

The problem is that rstudio-server consumes lots of disk space.  Getting over
5.0GB in a single session is not difficult when using our large data.  For
example, even running the cancer_example.Rmd will cause a full disk event.

This long story is being told to explain why we are fixing the problem.  The fix
is to **change the location that rstudio-server uses as scratch disk space**.
These steps worked twice this week for local users:

```{bash}
cd
TARGET=/data/users/user123/.rstudio
echo $TARGET
mv ~/.rstudio/ $TARGET/
ln -s $TARGET.rstudio ~/.rstudio
```

That newly created link will look and work good when you are on Titan.  On every
other machine it will look like a bad link.  The reason that this is a solution
is because the new scratch space that rstudio server will use is on the /data/
filesystem on Titan and has plenty of space.  The ecos home directory will not
be used whenever rstudio-server is being used.  Every user of rstudio-server
should setup their scratch space so that they don't fill up their 5GB ecos home
directory space.

