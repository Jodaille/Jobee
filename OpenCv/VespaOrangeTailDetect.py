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

writeimages = False

# reading image: sys.argv[1] is parameter passed to script
img = cv2.imread(sys.argv[1], 1)

imgname = basename(sys.argv[1])
imgdirname = dirname(sys.argv[1])
base=os.path.basename(sys.argv[1])
filename = os.path.splitext(base)[0]
resultDir = "/Users/j_noury/Jobee/results"
print "file:", filename, "imgdirname:", imgdirname

maskImgName = resultDir + '/' + filename + '_mask.jpg'
blobImgName = resultDir + '/' + filename + '_blob.jpg'

# color conversion
hsv = cv2.cvtColor(img, cv2.COLOR_BGR2HSV)

lower_range = np.array([14, 100, 100], dtype=np.uint8)
upper_range = np.array([34, 255, 255], dtype=np.uint8)

mask = cv2.inRange(hsv, lower_range, upper_range)

print "maskImgName:", maskImgName
print "blobImgName:", blobImgName


# Setup SimpleBlobDetector parameters.
params = cv2.SimpleBlobDetector_Params()
# Change thresholds
params.minThreshold = 15
params.maxThreshold = 200

# Filter by Area.
params.filterByArea = True
params.minArea = 25
params.maxArea = 1500

# Filter by Circularity
params.filterByCircularity = False
params.minCircularity = 0.15
params.maxCircularity = 0.22

# Filter by Convexity
params.filterByConvexity = False
params.minConvexity = 0.8

# Filter by Inertia
params.filterByInertia = True
params.minInertiaRatio = 0.00
params.maxInertiaRatio = 0.38

# Create a detector with the parameters
ver = (cv2.__version__).split('.')
if int(ver[0]) < 3 :
    detector = cv2.SimpleBlobDetector(params)
else :
    detector = cv2.SimpleBlobDetector_create(params)

# Detect blobs.
mask = cv2.bitwise_not(mask)
keypoints = detector.detect(mask)
print keypoints

# Draw detected blobs as red circles.
# cv2.DRAW_MATCHES_FLAGS_DRAW_RICH_KEYPOINTS ensures the size of the circle corresponds to the size of blob
im_with_keypoints = cv2.drawKeypoints(img, keypoints, np.array([]), (0,0,255), cv2.DRAW_MATCHES_FLAGS_DRAW_RICH_KEYPOINTS)


nbpoints = len(keypoints)
print "Number if VV FOUND:", nbpoints

if nbpoints == 1 :
    cv2.imwrite(blobImgName, im_with_keypoints)
    cv2.imwrite(maskImgName, mask)
elif nbpoints > 1 :
    cv2.imshow('mask',mask)
    cv2.imshow('image', img)
    cv2.imshow('Keypoints', im_with_keypoints)
    cv2.waitKey(0)
else :
    print "No VV FOUND in", imgname

#
# while(1):
#   k = cv2.waitKey(0)
#   if(k == 27):
#     break
#
# cv2.destroyAllWindows()
