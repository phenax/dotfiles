#!/usr/bin/env bash

bspc subscribe node_add | while read line; do
  id=$(echo "$line" | awk '{print $5}');
  className=$(bspc query -n "0x0220000E" -T | jq ".client.className" | sed 's/"//g');
  client=$(bspc query -n "0x0220000E" -T | jq ".client");

  echo "$(bspc query -n "0x0220000E" -T)";
  echo -e "$client";

  # case "$className" in
    # Spotify) bspc node "$id" -d '^4' ;;
  # esac
done;

