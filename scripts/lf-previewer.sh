#!/bin/sh

img() { ~/scripts/image-preview.sh "$@"; }

get_lf_dimens() {
  width="$(echo "$(img get_width) / 2 - 3" | bc)";
  height="$(img get_height)";
  left="$(echo "$width + 5" | bc)";
  top="5";
  echo "${width}x${height}@${left}x${top}";
}

show_image() {
  dimens="$(get_lf_dimens)";
  img preview "$1" "$dimens";
}

img clear;

case "$1" in
    *.tar*) tar tf "$1";;
    *.zip) unzip -l "$1";;
    *.rar) unrar l "$1";;
    *.7z) 7z l "$1";;
    *.pdf) pdftotext "$1" -;;
    *.webp) show_image "$1";;
    *.jpg) show_image "$1";;
    *.jpeg) show_image "$1";;
    *.png) show_image "$1";;
    *.gif) show_image "$1";;
    *) highlight -O ansi "$1" || cat "$1";;
esac

# Use pygmentize for syntax highlighting

