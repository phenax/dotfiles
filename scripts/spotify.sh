#!/bin/bash

# https://community.spotify.com/t5/Desktop-Linux/Basic-controls-via-command-line/td-p/4295625

spotify_launch() { spotify; }

SP_DEST=org.mpris.MediaPlayer2.spotify;
SP_PATH=/org/mpris/MediaPlayer2;
SP_MEMB=org.mpris.MediaPlayer2.Player;

# Extract value of a property from dictionary or array
extract() { echo "$1" | awk -F'|' '$1 == MATCH { print $2 }' MATCH="$2"; }

# Sanitize output string
# sanitize() { sed 's/[^A-Za-z0-9\-\(\)]/ /g' | sed 's/\s\+/ /g'; }
sanitize() { sed 's/\s\+/ /g'; }

# Get a property from media player interface
spotify_get_property() {
  dbus-send                                                                   \
  --print-reply                                         \
  --dest=$SP_DEST                                                             \
  $SP_PATH                                                                    \
  org.freedesktop.DBus.Properties.Get                                         \
  string:"$SP_MEMB" string:$1                                                 \
    | grep -Ev "^method"                              \
    | grep -Eo '("(.*)")|(\b[0-9][a-zA-Z0-9.]*\b)' \
    | sed -E '2~2 a|'                                       \
    | tr -d '\n'                                        \
    | sed -E 's/\|/\n/g'                                   \
    | sed -E 's/(xesam:)|(mpris:)//'                     \
    | sed -E 's/^"//'                                       \
    | sed -E 's/"$//'                                \
    | sed -E 's/"+/|/'                               \
    | sed -E 's/ +/ /g'                            
}

# Send a signal to player
spotify_signal() {
  dbus-send --print-reply --dest=$SP_DEST $SP_PATH org.mpris.MediaPlayer2.Player.$1;
}

# Get song metadata
get_metadata() { spotify_get_property Metadata; }

# Get player state
get_play_state() { spotify_get_property PlaybackStatus; }

# Get title - artist (song label)
get_label() {
  local meta=$(get_metadata);
  local artist=$(extract "$meta" artist | sanitize);
  local title=$(extract "$meta" title | sanitize);
  local label="$title - $artist";
  echo "$label";
}

# Play/Pause toggle:
play_pause() { spotify_signal PlayPause; }

# Next/Prev
next() { spotify_signal Next; }
prev() { spotify_signal Previous; }

notify() {
  notify-send "Song change $1 $2 $3";
}

case "$1" in
  start) spotify_launch ;;
  play_pause|pp) play_pause ;;
  next|n) next ;;
  prev|p) prev ;;
  dump_metadata) get_metadata ;;
  get_label) get_label ;;
  get_play_state) get_play_state ;;
  notify) notify ;;
  *) echo "Learn how to use shit before you use them" ;;
esac

