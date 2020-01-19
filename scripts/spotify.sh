#!/bin/bash

# https://community.spotify.com/t5/Desktop-Linux/Basic-controls-via-command-line/td-p/4295625

spotify_launch() { spotify; }

SP_DEST=org.mpris.MediaPlayer2.spotify;
SP_PATH=/org/mpris/MediaPlayer2;
SP_MEMB=org.mpris.MediaPlayer2.Player;

# Extract value of a property from dictionary or array
extract() { echo "$1" | awk -F'|' '$1 == MATCH { print $2 }' MATCH="$2"; }

# Get a property from media player interface
spotify_get_property() {
  dbus-send                                                                   \
  --print-reply                                  `# We need the reply.`       \
  --dest=$SP_DEST                                                             \
  $SP_PATH                                                                    \
  org.freedesktop.DBus.Properties.Get                                         \
  string:"$SP_MEMB" string:$1                                                 \
    | grep -Ev "^method"                           `# Ignore the first line.`   \
    | grep -Eo '("(.*)")|(\b[0-9][a-zA-Z0-9.]*\b)' `# Filter interesting fiels.`\
    | sed -E '2~2 a|'                              `# Mark odd fields.`         \
    | tr -d '\n'                                   `# Remove all newlines.`     \
    | sed -E 's/\|/\n/g'                           `# Restore newlines.`        \
    | sed -E 's/(xesam:)|(mpris:)//'               `# Remove ns prefixes.`      \
    | sed -E 's/^"//'                              `# Strip leading...`         \
    | sed -E 's/"$//'                              `# ...and trailing quotes.`  \
    | sed -E 's/"+/|/'                             `# Regard "" as seperator.`  \
    | sed -E 's/ +/ /g'                            `# Merge consecutive spaces.`
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
  local artist=$(extract "$meta" artist);
  local title=$(extract "$meta" title);
  echo "$title - $artist";
}

# Play/Pause toggle:
play_pause() { spotify_signal PlayPause; }

# Next/Prev
next() { spotify_signal Next; }
prev() { spotify_signal Previous; }

case "$1" in
  start) spotify_launch ;;
  play_pause|pp) play_pause ;;
  next|n) next ;;
  prev|p) prev ;;
  dump_metadata) get_metadata ;;
  get_label) get_label ;;
  get_play_state) get_play_state ;;
  *) echo "Learn how to use shit before you use them" ;;
esac

