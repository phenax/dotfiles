#!/usr/bin/env bash

case "$1" in
  mute) amixer set Master toggle ;;
  mute-mic) amixer set Capture toggle ;;
  volume) case "$2" in
    up) amixer sset Master '5%+' ;;
    down) amixer sset Master '5%-' ;;
  esac ;;
  *) echo "Wrong command" ;;
esac

#~/scripts/statusbar/statusbar.sh update volume;
update-dwmblock volume;
