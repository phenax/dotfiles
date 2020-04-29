#!/usr/bin/env bash

# ffmpeg -i /dev/video0 out.mkv
ffmpeg -i /dev/video0 -f alsa -i default out.mkv
