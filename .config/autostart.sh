
##### Helpers {{{
# Focus on a tag/ws
focus_tag() { [[ ! -z "$1" ]] && dwmc view $(($1 - 1)); }

# Only run when there are no windows on the screen
on_startup() { [[ "$(wmctrl -l | wc -l)" = "0" ]] && $@ & }

# Run only once. If an instance is already running, noop
once() {
  local name=$1;
  shift;
  pgrep $name || $@ &
}

# Kill previous instance and run again
run() {
  killall -9 $1;
  sleep 0.05;
  $@ &
}
# }}}


##### Autostart {{{
  # Key Modmap
  xmodmap ~/.config/sxhkd/.Xmodmap &
  xset s off; # No screensaver
  # xset r rate 300 50;

  # Key daemon
  #run sxhkd -c ~/.config/sxhkd/dwm.sxhkdrc;
  run shotkey;

  # Compositor
  run compton --config ~/.config/compton.conf;

  # Notification daemon
  run dunst -config ~/.config/dunst/dunstrc;

  # Dwm blocks status text
  run dwmblocks &

  # Wallpaper
  ~/.fehbg &


  # Battery watcher
  ~/scripts/battery-watch.sh start;

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
