#!/usr/bin/env python

# source:
# https://henrydangprg.com/2016/06/26/color-detection-in-python-with-opencv/

# Import OpenCv library
import cv2
import numpy as np

# Import system lib (filename as parameter)
import sys, os

# fiile/directory path manipulation
from os.path import basename, dirname

# reading image: sys.argv[1] is parameter passed to script
img = cv2.imread(sys.argv[1], 1)

imgname = basename(sys.argv[1])
imgdirname = dirname(sys.argv[1])
base=os.path.basename(sys.argv[1])
filename = os.path.splitext(base)[0]
print filename
maskImgName = imgdirname + '/' + filename + '_mask.jpg'

# color conversion
hsv = cv2.cvtColor(img, cv2.COLOR_BGR2HSV)

lower_range = np.array([14, 100, 100], dtype=np.uint8)
upper_range = np.array([34, 255, 255], dtype=np.uint8)

mask = cv2.inRange(hsv, lower_range, upper_range)

print maskImgName
cv2.imwrite(maskImgName, mask)


cv2.imshow('mask',mask)
cv2.imshow('image', img)


#
# while(1):
#   k = cv2.waitKey(0)
#   if(k == 27):
#     break
#
# cv2.destroyAllWindows()
