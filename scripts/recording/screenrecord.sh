#!/usr/bin/env bash

ffmpeg -f x11grab -s 1920x1080 -i :0.0 -f alsa -i default out.mkv
