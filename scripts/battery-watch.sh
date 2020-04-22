#!/usr/bin/env bash

battery_component() { cat "/sys/class/power_supply/BAT0/$1"; }

get_level() { battery_component capacity; }
get_state() { battery_component status; }

LOW_BATTERY="30";
CRITICAL_BATTERY="10";

DELAY=1;
LOW_DELAY=120;
CRITICAL_DELAY=30;

# :: Min -> Max -> Number -> Bool
between() { test "$3" -gt "$1" && test "$3" -le "$2"; }

while true; do
  battery_level=$(get_level);
  state=$(get_state);

  if (between $CRITICAL_BATTERY $LOW_BATTERY $battery_level); then
    notify-send "Please charge this shit. Battery is at $battery_level%" -u normal;
    sleep $LOW_DELAY;
  fi

  if (between 0 $CRITICAL_BATTERY $battery_level); then
    notify-send "HOLY SHIT DUDE. I'M DYING. Battery is at $battery_level%" -u critical;
    sleep $CRITICAL_DELAY;
  fi

  sleep $DELAY;
done;

