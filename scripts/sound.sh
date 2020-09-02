#!/usr/bin/env bash

case "$1" in
  mute-mic) amixer set Capture toggle ;;
  mic-vol) case "$2" in
    up) amixer sset 'Mic Boost' '1%+' && amixer sset 'Internal Mic Boost' '1%+' ;;
    down) amixer sset 'Mic Boost' '1%-' && amixer sset 'Internal Mic Boost' '1%-' ;;
    full) amixer sset 'Mic Boost' '100%' && amixer sset 'Internal Mic Boost' '100%' ;;
  esac ;;

  mute) amixer set Master toggle ;;
  volume) case "$2" in
    up) amixer sset Master '5%+' ;;
    down) amixer sset Master '5%-' ;;
  esac ;;
  *) echo "Wrong command" ;;
esac

#~/scripts/statusbar/statusbar.sh update volume;
update-dwmblock volume;
