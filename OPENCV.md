# OpenCV training

## OpenCV annotation
From http://answers.opencv.org/question/75083/documentation-for-opencv_annotation/

1. Create a folder with images that need to be annotated.
2. Call the application on your data ``` opencv_annotation -images /data/image_folder/ -annotations /data/annotations.txt```. Keep in mind that the tool loves absolute paths, since relative paths can screw up the processing.
3. The tool will open up the first image from the folder. However, since listing files inside a folder is system specific, it might be possible that it is not the first image you see. Since we need to process each and every image in the foldder, this is no problem at all.
4. Use your mouse to select a region of interest, keeping the borders as close as possible to the actual object your want to train a model for. When you are okay with the annotation, press the c key on your keypad to confirm. You will see the red annotation turn to green.
5. Continue untill all objects in the image are annotated.
6. Press the n key on your keyboard to load the next image.
7. If you want to shut down the annotation tool, press the ESC key.

```bash
opencv_annotation --annotations=/Users/j_noury/Jobee/VespaVelutina/annotations.txt --images=/Users/j_noury/Jobee/VespaVelutina
```


## Generate vector file from images
opencv_createsamples -info annotations.txt -bg  /Users/j_noury/Jobee/negative.txt -vec /Users/j_noury/Jobee/positiveVectorFile.vec -w 60 -h 60


## Visualisation of created samples
opencv_createsamples -vec positiveVectorFile.vec


## Generate cascade HAAR file

opencv_traincascade -data /Users/j_noury/Jobee/OpenCv/data -vec positiveVectorFile.vec -bg negative.txt -numPos 40 -numNeg 100 -numStages 20  -w 60 -h 60
