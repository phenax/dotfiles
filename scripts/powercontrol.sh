#!/usr/bin/env bash
source "$HOME/scripts/modules/rofi-menu.sh";
source "$HOME/scripts/modules/utils.sh";

optn_poweroff=": off";
optn_reboot=": reboot";
optn_lock=": Lock";
optn_cancel=": cancel";

OPTIONS=$(echo -e "
$optn_poweroff
$optn_reboot
$optn_lock
$optn_cancel
" | trim);

lock() { ~/scripts/lockscreen.sh; }

logout() { bspc quit; }

poweroff() {
  logout;
  systemctl poweroff;
}

reboot() {
  logout;
  systemctl reboot;
}

menu() {
  result=$(echo -e "$OPTIONS" | open-block-menu -p "Power button");
  case "$result" in
    "$optn_lock") lock ;;
    "$optn_poweroff") poweroff ;;
    "$optn_reboot") reboot ;;
  esac
}

case "$1" in
  menu) menu ;;
  lock) lock ;;
  poweroff) poweroff ;;
  reboot) reboot ;;
  *) exit 1 ;;
esac

