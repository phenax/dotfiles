#!/bin/bash

clear_img() { kitty +kitten icat --clear  --transfer-mode file --silent; }

get_width() { tput cols; }
get_height() { tput lines; }

get_default_layout() {
  width="50";
  height=$(get_height);
  left="$(echo "$(get_width) - $width" | bc)";
  echo "${width}x${height}@${left}x1";
}

show_image() {
  position="${2:-"$(get_default_layout)"}";
  clear;
  kitty +kitten icat \
    --place "$position" \
    --transfer-mode file \
    --silent \
    --align=right \
    "$1";
}

rest=${@:2};

case "$1" in
  preview) show_image $rest ;;
  clear) clear_img $rest ;;
  get_width) get_width $rest ;;
  get_height) get_height $rest ;;
  *) echo "Usage (clear|show_image|get_image|get_height)" ;;
esac;

