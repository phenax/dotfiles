#!/usr/bin/env bash

dir="$1";
workspace="$2";

[[ ! -z "$workspace" ]] && bspc desktop -f "$workspace";

$TERMINAL -d "$dir" -e i3-sensible-editor . &
sleep 0.3;
$TERMINAL -d "$dir" &
$TERMINAL -d "$dir" &

sleep 0.5;

bspc node '@/1.!hidden' -f;

disown;

