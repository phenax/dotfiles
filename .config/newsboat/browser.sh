#!/usr/bin/env bash

run() { setsid -f "$@" > /dev/null 2>&1; }

case "$1" in
  video)
    notify-send "Loading video...";
    run mpv "$2";
  ;;
  *) run sensible-browser "$2" ;;
esac

