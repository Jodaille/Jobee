# Essais Vespa Velutina detection

You need to install OpenCv

## from project directory :
```sh
 jody@samssd:~/Jobee$ ./OpenCv/VespaOrangeTailDetect.py VespaVelutina/2017-05-16-133001.jpg
```


## on every images in VespaVelutina directory
```sh
find VespaVelutina/ -type f -name *.jpg -exec ./OpenCv/VespaOrangeTailDetect.py {} \;
```


Delete old files
```sh

find VespaVelutina/ -type f -name *_mask.jpg -delete
find VespaVelutina/ -type f -name *_blob.jpg -delete
```

```sh
ls /media/sda1/recordings/ -lh && du -h --max-depth=1 /media/sda1/recordings/ && ls /media/sda1/recordings/ | wc -l
total 14G
-rw------- 1 jody jody  11M juil.  4 23:15 170704-2315-1240KHz.wav
-rw------- 1 jody jody 9,8M juil.  4 23:16 170704-2316-1240KHz.wav
-rw------- 1 jody jody 9,8M juil.  4 23:17 170704-2317-1240KHz.wav
-rw------- 1 jody jody  10M juil.  4 23:19 170704-2318-1240KHz.wav
-rw------- 1 jody jody  10M juil.  4 23:20 170704-2319-1240KHz.wav
-rw------- 1 jody jody  10M juil.  4 23:20 170704-2320-1240KHz.wav
-rw------- 1 jody jody  10M juil.  4 23:22 170704-2321-1240KHz.wav
-rw------- 1 jody jody  10M juil.  4 23:22 170704-2322-1240KHz.wav
...

-rw------- 1 jody jody  10M juil.  5 23:00 170705-2259-1240KHz.wav
-rw------- 1 jody jody  10M juil.  5 23:01 170705-2300-1240KHz.wav
-rw------- 1 jody jody  10M juil.  5 23:02 170705-2301-1240KHz.wav
-rw------- 1 jody jody  10M juil.  5 23:02 170705-2302-1240KHz.wav
-rw------- 1 jody jody  10M juil.  5 23:04 170705-2303-1240KHz.wav
-rw------- 1 jody jody 5,0M juil.  5 23:04 new.wav
14G     /media/sda1/recordings/
1428
```
