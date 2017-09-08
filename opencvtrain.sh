
#opencv_createsamples -data /Users/j_noury/Jobee/OpenCv/data -vec annotations.txt -bg negative.txt -w 20 -h 20
#opencv_createsamples -data /Users/j_noury/Jobee/OpenCv/data -vec annotations.txt -bg negative.txt


# Make annotations/selections in images
# cf: http://answers.opencv.org/question/75083/documentation-for-opencv_annotation/
opencv_annotation --annotations=annotations.txt --images=.

# generate vector file from images
opencv_createsamples -info  annotations.txt -bg  negative.txt -vec positiveVectorFile.vec -w 60 -h 60

# visualisation of created samples
opencv_createsamples -vec positiveVectorFile.vec

# generate cascade HAAR file

opencv_traincascade -data /Users/j_noury/Jobee/OpenCv/data -vec positiveVectorFile.vec -bg negative.txt -numPos 10 -numNeg 10 -numStages 20  -w 60 -h 60
