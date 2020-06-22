#!/usr/bin/env bash

SCREENSHOTS=$HOME/Pictures/screenshots;

scrsht() {
  local window=$([ -z "$2" ] && echo "" || echo "-window $2");
  magick import $window "$SCREENSHOTS/$1-$(date '+%Y_%m_%d_%H_%M_%S').jpg";
}

full_screenshot() { scrsht full root; }

part_screenshot() { scrsht part & disown; }

window_screenshot() { scrsht window "${1:-"$(xdo id)"}"; }

case $1 in
  full) full_screenshot ;;
  part) part_screenshot ;;
  window) window_screenshot "$2" ;;
  *) echo "no"; exit 1 ;;
esac

