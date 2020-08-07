
##### Helpers {{{
action="$1";

# Is logout command (Cleanup)
is_kill() { [[ "$action" == "kill" ]]; }

# Focus on a tag/ws
focus_tag() { [[ ! -z "$1" ]] && dwmc view $(($1 - 1)); sleep 0.2; }

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
  echo "[Autostart]: Running daemons";
  # Key Modmap
  xmodmap ~/.config/sxhkd/.Xmodmap &
  xset s off; # No screensaver
  xset r rate 350 30; # [delay] [rate]

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

  # Cron jobs
  run "crond" crond -n -f ~/.config/crontab/crontab;


  # Battery watcher
  run "" ~/scripts/battery-watch.sh start;

  # Disk automount
  once "udiskie" ~/.bin/with_zsh udiskie -a -n -s;

  # Clipboard history
  once "clipmenud" clipmenud;

  # Network manager applet
  once "nm-applet" nm-applet;

  # Torrent daemon
  #once "btpd" btpd -d "$HOME/.config/btpd";
  once "transmission" transmission-daemon --download-dir ~/Downloads/dl;

  # Music daemon
  once "mpd" mpd ~/.config/mpd/mpd.conf --stdout --no-daemon;

  # Hide mouse pointer while typing
  #once "xbanish" xbanish;
# }}}


##### Initialized applications {{{
echo "[Autostart]: Checking applications";
#on_startup sensible-browser;

#applications() {
  #sleep 0.5;

  #focus_tag 9;
  #on_startup :music;
  #on_startup :notes;

  #focus_tag 6;
  #on_startup sensible-browser;

  #focus_tag 1;
#}

#applications &

# }}}


disown;
