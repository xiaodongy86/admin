
### setup locals to use Titan's local rstudio

Titan runs rstudio-server which we know and love and that runs on port 8787 in
your web browser.  The desktop rstudio is almost the same experience but is a
completely different stack.  Desktop rstudio is difficult to use because Titan
currently has an unusable display (due to a big fat NVIDIA video card that
doesn't work that well with linux).  Even so, we can run the local desktop
rstudio on Titan and have its display appear on our (remote) screen.  Using
**ssh -X** as discussed below allows this to work.

We setup Putty and a **Windows 10 compatible X server** to get this working.
Doing so required at least these things:

* an Xserver for Windows 10 (Xming works best for all other Windows versions 7/8)
* a properly configured Putty (see sections of **SSH** and **X Forwarding**

The display was a little bit less sharp on Windows 10 but it is very usable.

In R, we ran this command:

```{r}
.libPaths()
```

..and noticed that the package path information looked right and we are able
to use all of the packages available when we connect to Titan via the
rstudio-server with our web browser on port 8787.  Desktop rstudio on Titan
because:

* Titan generally has all of the data
* Titan has 80 cores and 1000GB of RAM
* Desktop rstudio is not rstudio-server and can serve as a complete alternative in case there are ever troubles with rstudio-server


