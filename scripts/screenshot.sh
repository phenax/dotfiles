#!/usr/bin/env bash

full_screenshot() {
  scrot '%Y-%m-%d-%s_screenshot_$wx$h.jpg' -e 'mv $f ~/Pictures/screenshots';
}

part_screenshot() {
  sleep 0.2;
  scrot -s 'part-%Y-%m-%d-%s_screenshot_$wx$h.jpg' -e 'mv $f ~/Pictures/screenshots';
}

case $1 in
  full) full_screenshot ;;
  part) part_screenshot ;;
  *) echo "no"; exit 1 ;;
esac
