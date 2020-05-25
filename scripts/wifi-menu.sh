#!/bin/bash

source $HOME/scripts/modules/utils.sh;
source $HOME/scripts/modules/rofi-menu.sh;

ACTIVE="[X]"
INACTIVE="[ ]"

# :: (on|off) -> string -> string -> string
ifOnElse() { [[ "$1" == "on" ]] && echo "$2" || echo "$3"; }
# :: (on|off) -> (on|off)
inverse() { ifOnElse "$1" "off" "on"; }

get_options() {
  local state="$1";

  echo "
$(ifOnElse "$state" $ACTIVE $INACTIVE)  Turn wifi $(inverse $state)
$([[ $1 == "on" ]] && echo "☰  Select wifi network")
" | trim;
}

# :: string -> Bool
is_known_connection() {
  local ssid=$1;
  local match=$(nmcli -t connection show | awk -F: '$1 == ssid {print $0}' ssid="$ssid");
  [[ "$match" != "" ]];
}

# :: () -> (on|off)
get_wifi_status() {
  nmcli -f wifi general status | tail -n 1 | sed 's/enabled/on/; s/disabled/off/;';
}
# :: (on|off) -> ()
set_wifi_status() { nmcli radio wifi $1; }

get_wifi_networks() {
  nmcli -f active,ssid,rate,bars,security dev wifi | tail -n +2 |
    awk '{sub(/^yes/,   ACTIVE " "  )}1' ACTIVE="$ACTIVE" |
    awk '{sub(/^no/,    INACTIVE    )}1' INACTIVE="$INACTIVE";
}

# :: string -> string
get_ssid() { awk '{ print $2 }'; }
get_security_type() { awk '{ print $6 }'; }


show_wifi_networks_menu() {
  local wifi_config=$(get_wifi_networks | open-menu -p "Wifi Networks");
  local wifi_ssid=$(echo "$wifi_config" | get_ssid);
  [[ -z "$wifi_ssid" ]] && return 1;
  local wifi_security=$(echo "$wifi_config" | get_security_type);

  echo "$wifi_ssid $wifi_config";

  if $(is_known_connection "$wifi_ssid"); then
    nmcli con up "$wifi_ssid";
  else
    if [[ "$wifi_security" == "--" ]]; then
      nmcli dev wifi con "$wifi_ssid";
    else
      local password=$(echo "" | open-menu -p "Enter password");
      nmcli dev wifi con "$wifi_ssid" password $password;
    fi
  fi;
}

show_menu() {
  local state=$(get_wifi_status);
  local options=$(get_options $state);
  local action=$(echo "$options" | open-menu -p "Wifi Menu");

  [[ -z "$action" ]] && return 1;

  case "$action" in
    *Turn\ wifi*)    set_wifi_status $(inverse $state) ;;
    *Select\ wifi*)  show_wifi_networks_menu ;;
    *) ;;
  esac
}

case $1 in
  menu) show_menu ;;
  list) show_wifi_networks_menu ;;
  show_networks) get_wifi_networks ;;
  on) set_wifi_status on ;;
  off) set_wifi_status off ;;
  *) echo "Usage:: wifi-menu (menu|list|show_networks|on|off)" ;;
esac
