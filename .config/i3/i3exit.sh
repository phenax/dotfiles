#!/bin/sh
lock() {
  ~/scripts/lockscreen.sh
}

case "$1" in
  lock) lock ;;
  logout) bspc quit; ;;
  suspend) systemctl supend ;;
  hibernate) systemctl hibernate ;;
  reboot)
    bspc quit;
    systemctl reboot;
  ;;
  shutdown)
    bspc quit;
    systemctl poweroff;
  ;;
  *)
    echo "Usage: $0 {lock|logout|suspend|hibernate|reboot|shutdown}"
    exit 2
esac

exit 0
