#!/bin/bash

battery() { echo -e "$(cat "/sys/class/power_supply/BAT0/$1")"; }

case "$1" in
  brightness) echo "$(echo "($(~/scripts/brightness.sh get) * 100)/1" | bc)" ;;
  battery) echo "$(battery status) $(battery capacity)" ;;
  volume) echo "$(amixer get Master | grep % | awk '{print $4}' | sed 's/[^0-9\%]//g' | head -n1)" ;;
  do-show-time) kitty -e "calcurse" ;;
  *) echo "Not a valid menu item" ;;
esac

