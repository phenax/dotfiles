#!/usr/bin/env bash
source "$HOME/scripts/modules/rofi-menu.sh";
source "$HOME/scripts/modules/utils.sh";

optn_poweroff="[] off";
optn_reboot="[] reboot";
optn_suspend="[] suspend";
optn_lock="[] lock";
optn_cancel="[] cancel";

OPTIONS=$(echo -e "
$optn_poweroff
$optn_reboot
$optn_suspend
$optn_lock
$optn_cancel
" | trim);

lock() { ~/scripts/lockscreen.sh; }
poweroff_() { poweroff; }
reboot_() { reboot; }
suspend_() { lock & disown; systemctl suspend; }

menu() {
  result=$(echo -e "$OPTIONS" | open-menu -l 0 -p "Power button");
  case "$result" in
    "$optn_lock")      lock ;;
    "$optn_poweroff")  poweroff_ ;;
    "$optn_reboot")    reboot_ ;;
    "$optn_suspend")   suspend_ ;;
  esac
}

case "$1" in
  menu) menu ;;
  lock) lock ;;
  poweroff) poweroff_ ;;
  reboot) reboot_ ;;
  *) exit 1 ;;
esac

