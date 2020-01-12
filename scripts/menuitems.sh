#!/bin/bash

battery() { echo -e "$(cat "/sys/class/power_supply/BAT0/$1")"; }

get_volume() {
  amixer get Master |
    awk -F'[][]' '/dB/ {print $6 " " $2}' |
    sed 's/on //; s/off/muted/';
}

case "$1" in
  brightness) echo "$(echo "($(~/scripts/brightness.sh get) * 100)/1" | bc)" ;;
  battery) echo "$(battery status) $(battery capacity)" ;;
  volume) get_volume ;;
  do-show-time) kitty -e "calcurse" ;;
  *) echo "Not a valid menu item" ;;
esac

