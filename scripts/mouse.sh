#!/usr/bin/env bash

MOVE_DEFAULT=20;

move() {
  case "$1" in
    left)  xdotool mousemove_relative  -- -$2  0   ;;
    right) xdotool mousemove_relative  -- $2   0   ;;
    up)    xdotool mousemove_relative  -- 0    -$2 ;;
    down)  xdotool mousemove_relative  -- 0    $2  ;;
    *) exit 1 ;;
  esac
}

click() {  xdotool click 1; }
rclick() { xdotool click 3; }

case "$1" in
  move) move "$2" "${3:-$MOVE_DEFAULT}" ;;
  click) click ;;
  rclick) rclick ;;
  *) echo "no"; exit 1; ;;
esac

