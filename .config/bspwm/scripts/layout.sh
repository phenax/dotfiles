#!/bin/bash

ROOT="$HOME/.config/bspwm";
source "$ROOT/utils/desktop.sh";
source "$ROOT/utils/state.sh";

echo "$(set_desktop_option hello world 1)"
exit 1;

LAYOUTS="$ROOT/layouts";

layout=$1;
selected_desktop=$2;
layout_file="$LAYOUTS/$layout.sh";

# Check if layout exists
[[ ! -f $layout_file ]] && echo "Layout does not exisit" && exit 1;

# Set selected desktop to currently focused desktop if option is not specified
[[ -z "$selected_desktop" ]] && selected_desktop=$(get_focused_desktop);

recalculate_layout() { "$layout_file"; }

bspc subscribe node_{add,remove} | while read line; do
  desktop_id=$(echo "$line" | awk '{print $3}');
  desktop_name=$(get_desktop_name_from_id "$desktop_id");

  [[ "$desktop_name" = "$selected_desktop" ]] && recalculate_layout;
done;

