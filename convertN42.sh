#!/bin/bash
#filename="$(basename -- $1)"
filename=$1
echo $filename
newfile="${filename}.txt"
#cat $1 | grep "/" --invert-match | grep "<" --invert-match | grep ">" --invert-match | sed "s/ /\n/g" | tail -n 16191 > $newfile
cat $1 > $newfile
