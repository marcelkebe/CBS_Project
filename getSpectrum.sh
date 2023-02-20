#!/bin/bash

#clear detector
wget "http://gamma-spectrometer.internal/ORTEC/ClearData" -O /dev/null
sleep 5

#start detector
wget "http://gamma-spectrometer.internal/ORTEC/StartAcq" -O /dev/null
sleep 5

#integrate spectrum
sleep 1200


stamp=`date +"%Y%m%d-%H%M%S"`
curr=`caget -t -f1 de-beam-i3`
lifetime=`caget -t -f1 de-beam-tau`
outfile="${stamp}_${curr}mA_${lifetime}s_longtime.dat"

echo $outfile
wget "http://gamma-spectrometer.internal/ORTEC/DS50Spect.N42" -O temp.dat

./convertN42.sh temp.dat

mv temp.dat.txt $outfile
rm -f temp.dat

#stop detector
wget "http://gamma-spectrometer.internal/ORTEC/StopAcq" -O /dev/null

#download detctor status
statusfile="${outfile}.html"
wget "http://gamma-spectrometer.internal/ORTEC/" -O $statusfile
