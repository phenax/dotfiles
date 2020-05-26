#!/bin/bash

battery_component() { echo -e "$(cat "/sys/class/power_supply/BAT0/$1")"; }
get_battery_state() { echo "  $(battery_component status)"; }
get_battery() { echo "$(battery_component capacity)"; }

volume_component() { amixer get Master | awk -F'[][]' '/dB/ {print $C}' C="$1"; }
get_volume() { volume_component 2; }
get_volume_state() { volume_component 6 | sed 's/on//; s/off//'; }

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
  local label=$(~/scripts/spotify.sh get_label 2> /dev/null | cut -c 1-30);

  if [[ "$label" == " - " ]];
    then echo "-";
    else echo "$label.. ";
  fi;
}

list_workspaces() {
  bspc wm -g |
     sed -Ee 's/:m/ \n  M\>/g' \
     -e 's/:O|:F/ \n ^bg(#03fa96)^fg(#111111)  /g' \
     -e 's/:o/ \n ^bg()^fg(#ffffff)  /g' \
     -e 's/:U/ \n ^bg()^fg(#ffffff)  /g' \
     -e 's/:u/ \n ^bg(#dc322f)^fg(#ffffff)  /g' \
     -e 's/:/ \n  /g' \
     | grep "fg" \
     | sed 's/Desktop/S/g' \
     | tr '\n' '@' \
     | sed 's/@/^fg()/g'
}

aur_updates() {
  local arch=0;
  local aur=0;
  if ! arch=$(checkupdates 2> /dev/null | wc -l); then
      arch=0
  fi
  if ! aur=$(yay -Qum 2> /dev/null | wc -l); then
      aur=0
  fi

  echo " $arch  $aur ";
}

case "$1" in
  brightness) echo "$(echo "($(~/scripts/brightness.sh get) * 100)/1" | bc)" ;;
  battery) get_battery ;;
  battery_icon) get_battery_state ;;
  volume) get_volume ;;
  volume_icon) get_volume_state ;;
  spotify_song) get_spotify_label ;;
  spotify_song_icon) get_spotify_play_state ;;
  workspaces) list_workspaces ;;
  aur_updates) aur_updates ;;
  *) echo "Not a valid menu item" ;;
esac

