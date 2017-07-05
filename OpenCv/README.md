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
