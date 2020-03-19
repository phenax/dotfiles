#!/bin/sh
lock() {
  ~/scripts/lockscreen.sh
}

case "$1" in
    lock)
        lock
        ;;
    logout)
        i3-msg exit
        ;;
    suspend)
        #lock && systemctl supend
        systemctl supend
        ;;
    hibernate)
        #lock && systemctl hibernate
        systemctl hibernate
        ;;
    reboot)
        bspc quit && systemctl reboot;
        ;;
    shutdown)
        bspc quit && systemctl poweroff;
        ;;
    *)
        echo "Usage: $0 {lock|logout|suspend|hibernate|reboot|shutdown}"
        exit 2
esac

exit 0
