#!/bin/bash

source "$HOME/scripts/modules/utils.sh";
source "$HOME/scripts/modules/rofi-menu.sh";

DIR="$HOME/scripts/fontawesome-menu";
FONTS_DIR="$DIR/icons";
SCRIPT_FILE="$DIR/fa-menu.sh";

get_fonts() { cat $FONTS_DIR/$1; }

ALL="all"
SOLID="solid"
REGULAR="regular"
BRANDS="brands"

get_script() { echo "$SCRIPT_FILE $1"; }

show_menu() {
  rofi \
    -show combi \
    -modi combi,$SOLID:"$(get_script $SOLID)",$REGULAR:"$(get_script $REGULAR)",$BRANDS:"$(get_script $BRANDS)",emoji \
    -combi-modi $SOLID:"$(get_script $SOLID)",$REGULAR:"$(get_script $REGULAR)",$BRANDS:"$(get_script $BRANDS)",emoji \
  ;
}

# Parse and copy
if [[ ! -z "$2" ]]; then
  icon="$(echo "$2" | awk -F'|' '{ print $1 }')";
  label="$(echo "$2" | awk -F'|' '{ print $2 }')";
  copy_str "$icon";
  notify-send "$label icon ($icon) copied to clipboard";
  killall -9 rofi; # Fixes rofi freeze bug
  exit 1;
fi;

case "$1" in
  all) get_fonts * ;;
  $SOLID) get_fonts $SOLID ;;
  $REGULAR) get_fonts $REGULAR ;;
  $BRANDS) get_fonts $BRANDS ;;
  menu) show_menu ;;
esac

