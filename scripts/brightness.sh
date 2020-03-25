#!/bin/bash
# bl_dev=/sys/class/backlight/acpi_video0
# step=1

# case $1 in
  # -) echo $(($(< $bl_dev/brightness) - $step)) >$bl_dev/brightness;;
  # +) echo $(($(< $bl_dev/brightness) + $step)) >$bl_dev/brightness;;
# esac
read_brightness() {
  echo "2";
}

get_brightness() {
  echo $(xrandr --verbose | awk '/Brightness:/ {print $2; exit}');
}

set_brightness() {
  brightness="$(node -p "Math.max(Math.min($1, 1), 0.1).toFixed(1)")";
  xrandr --output ${2:-"eDP-1"} --brightness $brightness;
}

increment() {
  local b="$(get_brightness)";
  local nb="$(echo "$b + 0.1" | bc)";
  set_brightness $nb;
}

decrement() {
  local b="$(get_brightness)";
  local nb="$(echo "$b - 0.1" | bc)";
  set_brightness $nb;
}

case $1 in
  get) echo $(read_brightness) ;;
  set) set_brightness "$2" "$3" ;;
  inc) increment ;;
  dec) decrement ;;
  *) echo "For tools to work, you need to know how to use them" ;;
esac

