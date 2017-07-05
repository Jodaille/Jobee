# Essais Vespa Velutina detection

You need to install OpenCv

## from project directory try to detect orange/yellow tail in one image:
```sh
 jody@samssd:~/Jobee$ ./OpenCv/VespaOrangeTailDetect.py VespaVelutina/2017-05-16-133001.jpg
```


## on every images in VespaVelutina directory
```sh
find VespaVelutina/ -type f -name *.jpg -exec ./OpenCv/VespaOrangeTailDetect.py {} \;
```


Delete old files
file with _mask.jpg extension contains yellow part of image detected
file with _blob.jpg extension detected zones (blob)
```sh

find VespaVelutina/ -type f -name *_mask.jpg -delete
find VespaVelutina/ -type f -name *_blob.jpg -delete
```

## Volume disk usage statistics
24 hours recorded of 59 secondes wav stereo with Zoom H1 USB microphone
with a(lsa)record
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
-rw------- 1 jody jody  10M juil.  5 23:08 170705-2308-1240KHz.wav
-rw------- 1 jody jody  10M juil.  5 23:10 170705-2309-1240KHz.wav
-rw------- 1 jody jody  10M juil.  5 23:11 170705-2310-1240KHz.wav
-rw------- 1 jody jody  10M juil.  5 23:11 170705-2311-1240KHz.wav
-rw------- 1 jody jody  10M juil.  5 23:13 170705-2312-1240KHz.wav
-rw------- 1 jody jody  10M juil.  5 23:14 170705-2313-1240KHz.wav
-rw------- 1 jody jody  10M juil.  5 23:15 170705-2314-1240KHz.wav
-rw------- 1 jody jody 8,5M juil.  5 23:15 new.wav
14G     /media/sda1/recordings/
1439

```

```sh
jody@orangepipcplus:~/Jobee$ df -h
Filesystem      Size  Used Avail Use% Mounted on
...
/dev/sda1        15G   14G  880M  95% /media/sda1
```
