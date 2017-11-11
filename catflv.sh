#!/bin/sh
#################
# Concatenate FLV files using FFMPEG
#################
#### check if ffmpeg is installed
command -v ffmpeg 1> /dev/null 2>&1 || { echo "Please install ffmpeg first" >&2; exit 1; }
################
#### check if there is no  final.flv
#### we should exit if such a file exists!
#### it's possible to rewrite to a previous job
if [ -e ./final.flv ]; then
    (1>&2 echo "Please delete the old final.flv")
    exit 1
fi
################
#### remove the old list of files
test -e ./catflv_list.txt && rm catflv_list.txt;
################
#### confirm list of files and write to a file
echo "List of flv files to concat:"
printf "file './%s'\n" $@ | tee catflv_list.txt
read -p "Do you confirm? [y/Y] " confirm
if [[ confirm =~ ^[^yY]$ ]]; then
    echo "Abort."
    exit 0;
fi
################
#### concatenate the .flv files
ffmpeg -f concat -safe 0 -i catflv_list.txt -c copy final.flv
