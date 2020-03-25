ROOT="$HOME/.config/bspwm";

DESKTOP_STATE="$ROOT/state/desktops";

# -> :: Key -> Value -> ()
append_option() { sed "/^$1:/d"; echo "$1:$2"; }

# :: DesktopName -> ()
get_desktop_options() { cat "$DESKTOP_STATE/$1" 2> /dev/null; }

# :: Key -> Value -> DesktopName -> ()
set_desktop_option() {
  new_options=$(get_desktop_options "$3" | append_option $1 $2);
  mkdir -p "$DESKTOP_STATE";
  echo "$new_options" > "$DESKTOP_STATE/$3";
}

# save_layout() {}

