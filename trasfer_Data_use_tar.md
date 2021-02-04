
#send  the file named real_time_ATS.R under the current directory to Titan
#tar is needed when transfering huge amount of data
```
tar -cf - ./real_time_ATS.R |(ssh xzy50@e1-052764.science.psu.edu 'cd /data5/xzy50/; tar -xf -')
```
#for small file, can just use scp

```
scp file.txt username@e1-052764.science.psu.edu:/data5/bigData/
```
