#!/bin/sh  
#
# record.sh
# credits: http://www.w0ch.net/linux/audio_record.htm
#
# This is a script that will automatically record a radio audio stream to a .wav file using the arecord program.
#
#   arecord program significant options:
#
#   -r, --rate=#<Hz> Sampling rate in Hertz. The default rate is 8000 Hertz.
#
#   -d, --duration=# Interrupt recording after # seconds.
#
#   -c, --channels=# The number of channels.  The default is one channel.
#
#####################################################################################################################################

#  First we determine today's date and set variables $DAY, $MO and $YR.  Also set variable $NOW for current date and time. 
DAY=$(date +%d)                                                          # set variable $DAY for day
MO=$(date +%m)                                                           # set variable $MO for month
YR=$(date +%y)                                                           # set variable $YR for year (2 digits)
NOW=$(date)                                                              # sets date / time variable $NOW

#  Next we determine the current time and set variables $H and $M.  Also we set the frequency variable $F.
H=$(date +%H)                                                            # set variable $H for hour (24 hour)
M=$(date +%M)                                                            # set variable $M for minute
F=$(cat /${HOME}/radio/frequency.txt)                                    # set variable $F for radio frequency
echo
echo 
echo $NOW "Recording radio frequency "$F KHz to audio file $YR$MO$DAY-$H$M-$F"KHz".wav  # puts start time entry in record.log

#  Edit the following line for the recording duration, examples:  -d420 = 420 seconds  -d600 = 600 seconds

#arecord -d420 -r16000 -c1 /${HOME}/radio/recordings/new.wav              # Records audio stream for 7 minutes (420 seconds)
arecord -f S16_LE -d59 -r 44100 -D hw:2,0 -c 2 ${HOME}/radio/recordings/new.wav              # Records audio stream for 7 minutes (420 seconds)

mv /${HOME}/radio/recordings/new.wav /${HOME}/radio/recordings/$YR$MO$DAY-$H$M-$F"KHz".wav
echo
NOW=$(date)                                                              # resets date / time variable $NOW to current time
echo $NOW "Finished recording "$YR$MO$DAY-$H$M-$F"KHz".wav               # puts stop recording time entry in record.log
echo
ls -lh /${HOME}/radio/recordings/$YR$MO$DAY-$H$M-$F"KHz".wav              # lists output file size and details
echo
echo
echo "- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -"  # puts separation line in record.log
				

