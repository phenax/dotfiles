#!/usr/bin/env bash

case "$1" in
  mute) amixer set Master toggle ;;
  volume) case "$2" in
    up) amixer sset Master '5%+' ;;
    down) amixer sset Master '5%-' ;;
  esac ;;
  *) echo "Wrong command" ;;
esac

