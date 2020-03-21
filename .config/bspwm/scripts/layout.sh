#!/bin/bash

ROOT="$HOME/.config/bspwm";
LAYOUTS="$ROOT/layouts";

layout=$1;

echo "$LAYOUTS/$layout.sh";

# Check if layout exists
[[ ! -f "$LAYOUTS/$layout.sh" ]] && echo "Layout does not exisit" && exit 1;


