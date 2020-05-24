#!/usr/bin/env bash

outfile=${1:-"$HOME/Pictures/recordings/video-screen-$(date -Iminutes).mp4"};

ffmpeg -f x11grab -s 1920x1080 -i :0.0 -f alsa -i hw:0,0 $outfile;
