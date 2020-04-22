#!/usr/bin/env bash

dir="$1";
workspace="$2";

[[ ! -z "$workspace" ]] && bspc desktop -f "$workspace";

sensible-terminal -d "$dir" -e sensible-editor . &
sleep 0.3;
sensible-terminal -d "$dir" &
sensible-terminal -d "$dir" &

sleep 0.5;

bspc node '@/1.!hidden' -f;

disown;

