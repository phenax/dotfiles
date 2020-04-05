#!/bin/bash

backlight_source=/sys/class/backlight/intel_backlight;
step=1000;

get_raw_brightness() { cat "$backlight_source/brightness"; }
get_max_brightness() { cat "$backlight_source/max_brightness"; }
set_raw_brightness() { sudo echo "$1" > $backlight_source/brightness; }

get_brightness() {
  echo "100 * $(get_raw_brightness) / $(get_max_brightness)" | bc;
}

set_brightness() {
  local b=$1;
  [[ $b -gt 100 ]] && b=100;
  [[ $b -lt 1 ]]  && b=1;

  echo "Setting brightness to $b%";

  set_raw_brightness "$(echo "$b * $(get_max_brightness) / 100" | bc)";
}

increment() {
  local b=$(echo "($(get_raw_brightness) + $step) * 100/$(get_max_brightness)" | bc);
  set_brightness "$b";
}

decrement() {
  local b=$(echo "($(get_raw_brightness) - $step) * 100/$(get_max_brightness)" | bc);
  set_brightness "$b";
}

case $1 in
  get) get_brightness ;;
  set) set_brightness "$2" "$3" ;;
  # set_r) set_raw_brightness "$2" ;;
  inc) increment ;;
  dec) decrement ;;
  *) echo "brightness (get|inc|dec|set <n>%)" ;;
esac

