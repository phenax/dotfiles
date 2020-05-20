#!/bin/bash

spotify_launch() { spotify; }

# Get player state
get_play_state() { playerctl metadata --format '{{status}}'; }

# Get title - artist (song label)
get_label() { playerctl metadata --format '{{title}} - {{artist}}'; }

# Play/Pause toggle:
play_pause() { playerctl play-pause; }

# Next/Prev
next() { playerctl next; }
prev() { playerctl previous; }

notify() {
  echo "1";
  # notify-send "Playing $(get_label)...";
}

case "$1" in
  start) spotify_launch ;;
  play_pause|pp) play_pause ;;
  next|n) next ;;
  prev|p) prev ;;
  dump_metadata) get_metadata ;;
  get_label) get_label ;;
  get_play_state) get_play_state ;;
  notify) notify ;;
  *) echo "Learn how to use shit before you use them" ;;
esac

