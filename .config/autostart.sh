
##### Helpers {{{
action="$1";

# Is logout command (Cleanup)
is_kill() { [[ "$action" == "kill" ]]; }

# Focus on a tag/ws
focus_tag() { [[ ! -z "$1" ]] && dwmc view $(($1 - 1)); }

# Only run when there are no windows on the screen
on_startup() { is_kill || [[ "$(wmctrl -l | wc -l)" = "0" ]] && $@ & }

# Run only once. If an instance is already running, noop
once() {
  local name=$1; shift;
  if (is_kill); then
    killall "$name";
  else
    pgrep $name || $@ &
  fi;
}

# Kill previous instance and run again
run() {
  local name=$1; shift;
  [[ ! -z "$name" ]] && killall -9 $name && sleep 0.05;
  is_kill || $@ &
}
# }}}


##### Autostart {{{
  # Key Modmap
  xmodmap ~/.config/sxhkd/.Xmodmap &
  xset s off; # No screensaver
  # xset r rate 300 50;

  # Key daemon
  run "shotkey" shotkey;

  # Compositor
  run "picom" picom --experimental-backends --config ~/.config/compton.conf;

  # Notification daemon
  run "dunst" dunst -config ~/.config/dunst/dunstrc;

  # Dwm blocks status text
  run "dwmblocks" dwmblocks;

  # Wallpaper
  run "" ~/.fehbg;


  # Battery watcher
  run "" ~/scripts/battery-watch.sh start;

  # Disk automount
  once "udiskie" ~/.bin/with_zsh udiskie -a -n -s;

  # Clipboard history
  once "clipmenud" clipmenud;

  # Network manager applet
  once "nm-applet" nm-applet;

  # Torrent daemon
  once "transmission" transmission-daemon --download-dir "$HOME/Downloads/dl" &

  # Music daemon
  once "mopidy" mopidy;

  # Unclutter mouse pointer
  once "unclutter" unclutter;
# }}}


##### Initialized applications {{{
#focus_tag 9;
#on_startup :music;
#on_startup :notes;

#focus_tag 6;
#on_startup sensible-browser;

#focus_tag 1;
# }}}


disown;
