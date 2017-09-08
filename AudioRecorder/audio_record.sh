#!/bin/bash

# Arduino serial is open with screen
# the line format is :
# id=Danvou;lux=13940.88;bmpP=997.03;bmpT=20.32;topT=0;entryT=0;h=70.55;siT=19.38;rainLevel=2.24;RainFall=466;milli=332143870;
ARDUINOLOG="/home/jobee/screen.log"

# Directory for records
RECORDPATH="/media/sda1/recordings"

#
RECORDFILENAME=`date +%Y-%m-%d-%H%M%S`
RECORDFILEPATH="$RECORDPATH/$RECORDFILENAME.wav"

# Luminosity threshold
THRESHOLD=10


# We need ambient luminosity level (Daylight snapshots + audio record)
LUX=`tail -1 $ARDUINOLOG | awk -F ";" '{print $2}' | awk -F "=" '{print $2}'`

#echo Lux: $LUX THRESHOLD: $THRESHOLD


if (( $(echo "$THRESHOLD $LUX" | awk '{print ($1 <= $2)}') ));
then
#	echo RECORDFILEPATH $RECORDFILEPATH

	# S16_LE is the only format accepted by the USB mic (ZOOM)
	# -d59 because 60s + file write overlay on the next record
	# -r 44100
	# -D hw:1,0 second card here, -D hw:2,0 on Orange Pi (soundcard + HDMI ?)
	# -c 2 for stereo channels
	arecord -f S16_LE -d59 -r 44100 -D hw:1,0 -c 2 $RECORDFILEPATH

fi
