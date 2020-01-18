#!/bin/bash

# https://community.spotify.com/t5/Desktop-Linux/Basic-controls-via-command-line/td-p/4295625

spotify_launch() {
  spotify;
}

spotify_signal() {
  dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.$1;
}

# Play/Pause toggle:
play_pause() { spotify_signal PlayPause; }

# Next/Prev
next() { spotify_signal Next; }
prev() { spotify_signal Previous; }

case "$1" in
  start) spotify_launch ;;
  play_pause|pp) play_pause ;;
  next|n) next ;;
  prev|p) prev ;;
  *) echo "Learn how to use shit before you use them" ;;
esac

