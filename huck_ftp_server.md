
### hiseq.huck.psu.edu ftp server

We logged on today with filezilla and noticed nothing new in there:

```
    Hostname: hiseq.huck.psu.edu
    Username: sally-mackenzie
    Password: mry2645x
```

We had been looking for something new under /data5/ but nothing was
there and so we quit looking.  We might have expected something
because we got prompted to provide hiseq download instructions which
are shown below from the response/report that was generated this week.

### hiseq.huck.psu.edu downloading tips

Shared these tips today:

```
When I read this email yesterday I did not see an attachment.
Now I do see and and I have more to say based on February notes.
Its lots to read but

Thanks,
Tom

The important details are in the mail you received:

    SERVER: hiseq.huck.psu.edu
    DIRECTORY-ON-SERVER: sally-mackenzie/200203_NB551436_0114_AHVHNKBGXC/fastq
    requires an FTP client
    cannot be accessed from outside the Penn State domain

I expect that wget, on titan, is a good ftp client and should work.

However, my notes show that I ran filezilla on titan.  This is less convenient from home because
it is a graphical program.  It should work from home if you try these steps:

    setup VPN
    go to titan with -Y like this: ssh -Y e1-052764
    filezilla

Inside of filezilla you will want to do these steps:

    File...Site Manager
    ENTER GOOD INFORMATION
        Host: hiseq.huck.psu.edu
        Protocol: ftp
        Encryption: Use plain ftp
        Logon Type: Ask
            User: ENTER YOUR USERNAME
            Password: DO NOT ENTER A PASSWORD

Once you see a good connection after being prompted for and entering your password, then you need to drive the filezilla GUI.

The main things to get right is this:

Local Site: /data5/NewHiseqPsuData       ### You should FIRST! create a directory on titan where you want to store the data
Remote Site: sally-mackenzie/200203_NB551436_0114_AHVHNKBGXC/fastq

You should not be typing into these "Local Site:" and "Remote Site:" locations.  Because you are running filezilla on titan, you
will see /data5/ and other places on titan and you can just click with your mouse to get the right "Local Site:" entry.
Same for "Remote Site:", you will see the directories that your username/password have access to.  After clicking around
you should find the folder that you are looking for, in this case: 200203_NB551436_0114_AHVHNKBGXC.

After getting good things into the filezilla "Local Site:" and "Remote Site:" locations, then you can drag and drop the folder
you want from the files you see under the "Remote Site:" pane in filezilla and drop them into the folder you want on the
"Local Site:" side of filezilla.


Driving filezilla is not difficult.  You may be able to copy and paste or drag and drop or there may be other ways.

Depending on how slow things are, you will want to have a stable internet connection.  In particular, you will want to see
the logs in the top pane of filezilla look good.  Please let me know if you have internet connection problems.  You should already
have a "keep alive" setup on your mactop which will keep your terminal connections from being kicked off.  We can fix
problems if you get kicked off but I dont think you will.

You will also see, under "Remote Site:", how many bytes of data are in there.  These are real bytes and so the number for
the top directory should be a number in the billions, like 88,123,456,789, if there are 88 gigabytes of data in there.  After you
are done downloading, you can check on titan with a command like this:

cd /data5/NewHiseqPsuData
du -a |tail

..and the "du -a|tail" number at the bottom should also be 88123456789, or very nearly so.

Seeing the amount of data that you have on titan after download (with du) and seeing the amount of data filezilla "Remote Site:" says are in
that directory you are downloding is a good double check to know that things downloaded successfully.
Seeing good output in the filezilla log pane during the downloading is another good thing to see and look at.  Green text is good, red is bad.
```

