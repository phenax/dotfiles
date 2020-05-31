#!/usr/bin/env bash

NAME=monkeybar;
POSITION=top;

COLOR_FG="#ffffff";
COLOR_BG="#0f1215";
COLOR_ACCENT="#5180e9"
ALPHA="dd";

SEPERATOR=" :: ";

reset_wm() {
  bspc config top_padding 0;
  bspc config bottom_padding 0;
}

statusbar() {
  local truebg=$(echo $COLOR_BG | sed "s/^#/#$ALPHA/");

  lemonbar $([[ "$POSITION" == "bottom" ]] && echo "-b") \
    -o 0 \
    -f 'Fira Code:size=9' \
    -o -2 \
    -f 'Font Awesome 5 Free:size=7' \
    -o -3 \
    -f 'Symbols Nerd Font:size=7' \
    -F "$COLOR_FG" \
    -B "$truebg" \
    -n 'monkeybar' \
  ;
}


icon() {
  case "$1" in
    date) echo "" ;;
    battery) echo " " ;;
    music) ~/scripts/dzen2bar/menuitems.sh spotify_song_icon ;;
    volume) ~/scripts/dzen2bar/menuitems.sh volume_icon ;;
    brightness) echo "" ;;
    *) ;;
  esac
}

sep() { echo "%{F#666}$SEPERATOR%{F$COLOR_FG}"; }



# Modules {{{
bspwm_module() {
  local wsp=$(bspc query -D --names);
  local selected_ws=$(bspc query -D -d --names);
  echo -n $wsp | sed "s/ $selected_ws / %{F$COLOR_ACCENT}$selected_ws%{F$COLOR_FG} /";
}

date_module() {
  echo "$(icon date)$(date +"%l:%M %p")";
}

battery_module() {
  echo "$(icon battery)$(~/scripts/dzen2bar/menuitems.sh battery)%";
}

music_module() {
  echo "$(icon music)$(~/scripts/dzen2bar/menuitems.sh spotify_song)"
}

brightness_module() {
  echo "$(icon brightness) $(printf "%.0f%s" "$(xbacklight -get)" "%")"
}

volume_module() {
  echo "$(icon volume) $(~/scripts/dzen2bar/menuitems.sh volume)"
}
# }}}



get_left_bar() {
  echo "$(bspwm_module)";
}

get_center_bar() {
  echo "$(music_module)";
}

get_right_bar() {
  echo "$(volume_module)$(sep)$(brightness_module)$(sep)$(date_module)$(sep)$(battery_module)";
}

case "$1" in
  show)
    while true; do
      echo "%{I} $(get_left_bar) %{c}$(get_center_bar) %{r}$(get_right_bar) ";
      sleep 1;
    done | statusbar
    ;;
  hide)
    killall -9 lemonbar;
    reset_wm;
    ;;
  *) echo "Usage: statusbar.sh (show|hide)" ;;
esac

