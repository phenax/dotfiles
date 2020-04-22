#!/usr/bin/env bash

source "$HOME/scripts/modules/utils.sh";

is_torrent() { echo "$1" | grep '^magnet:'; }

add_torrent() {
  is_torrent "$1" && \
    transmission-remote -a "$1" && \
    notify-send "Torrent" "Added torrent for downloading";
}

add_from_clipboard() {
  add_torrent "$(read_clipboard)";
}

case "$1" in
  add) add_torrent "$2" ;;
  add_from_clipboard) add_from_clipboard ;;
esac;

