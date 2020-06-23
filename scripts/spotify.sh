#!/bin/bash

player() { playerctl --player=mopidy "$@"; }

# Get player state
get_play_state() { player metadata --format '{{status}}' || echo 'Stopped'; }

# Get title - artist (song label)
get_label() { player metadata --format '{{title}} - {{artist}}'; }

# Play/Pause toggle:
play_pause() {
  player play-pause;
  #~/scripts/statusbar/statusbar.sh update music;
  update-dwmblock music;
}

# Next/Prev
next() {
  player next;
  #~/scripts/statusbar/statusbar.sh update music;
  update-dwmblock music;
}
prev() {
  player previous;
  #~/scripts/statusbar/statusbar.sh update music;
  update-dwmblock music;
}

notify() {
  update-dwmblock music;
}

case "$1" in
  play_pause|pp) play_pause ;;
  next|n) next ;;
  prev|p) prev ;;
  dump_metadata) get_metadata ;;
  get_label) get_label ;;
  get_play_state) get_play_state ;;
  notify) notify ;;
  *) echo "Learn how to use shit before you use them" ;;
esac

