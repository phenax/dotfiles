#!/usr/bin/env bash

volume_component() { amixer get Master | awk -F'[][]' '/dB/ {print $C}' C="$1"; }

battery_component() { echo -e "$(cat "/sys/class/power_supply/BAT0/$1")"; }


playerctl_icon() {
  local playstate="$(playerctl metadata --format '{{status}}' || echo "Stopped")";
  case "$playstate" in
    Paused) echo "" ;;
    Playing) echo "" ;;
    Stopped) echo "" ;;
    *) ;;
  esac
}

volume_icon() {
  volume_component 6 | sed 's/on//; s/off//';
}

icon() {
  case "$1" in
    date)        echo "" ;;
    battery)     echo "" ;;
    music)       playerctl_icon ;;
    volume)      volume_icon ;;
    brightness)  echo "" ;;
    *) ;;
  esac
}

date_module() {
  echo "$(icon date) $(date +"%A,%e %b -%l:%M %p")";
}

battery_module() {
  echo "$(icon battery) $(battery_component capacity)%";
}

music_module() {
  echo "$(icon music)  $(playerctl metadata --format '{{title}} - {{artist}}' || echo '..')"
}

brightness_module() {
  echo "$(icon brightness) $(printf "%.0f%s" "$(xbacklight -get)" "%")"
}

volume_module() {
  echo "$(icon volume) $(volume_component 2)"
}

case "$1" in
  date) date_module ;;
  battery) battery_module ;;
  volume) volume_module ;;
  music) music_module ;;
  brightness) brightness_module ;;
esac;

