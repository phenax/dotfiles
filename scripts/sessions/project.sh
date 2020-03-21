#!/usr/bin/env bash

dir="$1";
workspace="$2";

[[ ! -z "$workspace" ]] && bspc desktop -f "$workspace";

$TERMINAL --title "Code Editor" -d "$dir" i3-sensible-editor . &
sleep 0.2;
$TERMINAL -d "$dir" &
$TERMINAL -d "$dir" &
$TERMINAL -d "$dir" &

sleep 0.5;

~/.config/bspwm/layouts/tall.sh;

disown;

