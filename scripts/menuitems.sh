#!/usr/bin/env bash

volume_component() { amixer get Master | awk -F'[][]' '/dB/ {print $C}' C="$1"; }

playerctl_icon() {
  local playstate="$(playerctl metadata --format '{{status}}' || echo "Stopped")";
  case "$playstate" in
    Paused) echo "" ;;
    Playing) echo "" ;;
    Stopped) echo "" ;;
    *) ;;
  esac
}

network_state() {
  local state=$(connmanctl state);
  local status="$(echo -e "$state" | awk -F' = ' '/State / {print $2}')";

  (echo -e "$state" | grep 'OfflineMode = True' > /dev/null) && echo 'offline' || echo "$status";
}

icon() {
  case "$1" in
    date)        echo "" ;;
    battery)     echo "" ;;
    music)       playerctl_icon ;;
    volume)      volume_component 6 | sed 's/on//; s/off//' ;;
    brightness)  echo "" ;;
    network)     network_state | sed 's/online//; s/idle//; s/offline/❌/' ;;
    *) ;;
  esac
}

date_module() {
  echo "$(icon date) $(date +"%A, %e %b - %I:%M %p")";
}

battery_module() {
  local capacity=$(cat "/sys/class/power_supply/BAT0/capacity");
  echo "$(icon battery) $capacity%";
}

music_module() {
  local label=$(playerctl metadata --format '{{title}} - {{artist}}' || echo '...');
  echo "$(icon music)  $label";
}

brightness_module() {
  echo "$(icon brightness) $(printf "%.0f%s" "$(xbacklight -get)" "%")"
}

volume_module() {
  echo "$(icon volume) $(volume_component 2)";
}

keymode_module() {
  echo "$(~/scripts/shotkey.sh mode)";
}

network_module() {
  echo "$(icon network)";
}


get_module() {
  case "$1" in
    date) date_module ;;
    battery) battery_module ;;
    volume) volume_module ;;
    music) music_module ;;
    brightness) brightness_module ;;
    keymode) keymode_module ;;
    network) network_module ;;
  esac;
}

padding="  ";

echo "$padding$(get_module $1)$padding";
