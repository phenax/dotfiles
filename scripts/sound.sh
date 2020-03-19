#!/usr/bin/env bash

case "$1" in
  mute) amixer -D pulse set Master toggle ;;
  volume) case "$2" in
    up) amixer -D pulse sset Master '5%+' ;;
    down) amixer -D pulse sset Master '5%-' ;;
  esac ;;
  *) echo "Wrong command" ;;
esac

