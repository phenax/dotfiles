
##### Helpers {{{
once() {
  local name=$1;
  shift;
  pgrep $name || $@ &
}

run() {
  killall -9 $1;
  sleep 0.05;
  $@ &
}
# }}}


##### Autostart {{{
  # Key Modmap
  xmodmap ~/.config/sxhkd/.Xmodmap &
  # xset r rate 300 50;

  # Key daemon
  run sxhkd -c ~/.config/sxhkd/dwm.sxhkdrc;

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
# }}}


##### Initialized applications {{{
# }}}


disown;
