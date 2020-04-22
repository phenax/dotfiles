#!/bin/bash

battery_component() { echo -e "$(cat "/sys/class/power_supply/BAT0/$1")"; }
get_battery_state() { echo "  $(battery_component status)"; }
get_battery() { echo "$(battery_component capacity)"; }

volume_component() { amixer get Master | awk -F'[][]' '/dB/ {print $C}' C="$1"; }
get_volume() { volume_component 2; }
get_volume_state() { volume_component 6 | sed 's/on//; s/off//'; }

get_spotify_play_state() {
  local playstate="$(~/scripts/spotify.sh get_play_state 2> /dev/null)";
  case "$playstate" in
    Paused) echo "  " ;;
    Playing) echo "  " ;;
    Stopped) echo "  " ;;
    *) ;;
  esac
}

get_spotify_label() {
  local label=$(~/scripts/spotify.sh get_label 2> /dev/null | cut -c 1-20);

  if [[ "$label" == " - " ]];
    then echo "-";
    else echo "$label.. ";
  fi;
}

case "$1" in
  brightness) echo "$(echo "($(~/scripts/brightness.sh get) * 100)/1" | bc)" ;;
  battery) get_battery ;;
  battery_icon) get_battery_state ;;
  volume) get_volume ;;
  volume_icon) get_volume_state ;;
  spotify_song) get_spotify_label ;;
  spotify_song_icon) get_spotify_play_state ;;
  do-show-time) sensible-terminal -e "calcurse" ;;
  *) echo "Not a valid menu item" ;;
esac

