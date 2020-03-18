#!/usr/bin/env bash

HELPTEXT="Usage: scheduler.sh [command] [...args]
Commands:
  start - Start the scheduler daemon
  break - Start your break
  stop  - Stop the clock. Work is done.

Args:
  -d, --duration - Set the duration for your breaks
  -h, --help - Help menu
"

ROOT="$HOME/scripts/work-cli";
STATE="$ROOT/state";
STATE="$ROOT/logs";

source "$ROOT/config.sh";
source "$ROOT/utils.sh";

run_daemon() {
  local working=true
  while true; do
    if [[ "$working" == true ]]; then
      echo "Time to work";
      sleep "$WORK_DURATION";
      working=false;
    else
      echo "Take a break dude";
      sleep "$BREAK_DURATION";
      working=true;
    fi;
  done;
}

start_work() {
  echo "Started your work";
}

take_a_break() {
  echo "Taking a break for $1";
}

stop_work() {
  echo "Done for the day";
}

case "$1" in
  daemon) run_daemon ;;
  start) start_work ;;
  break) take_a_break ;;
  stop) stop_work ;;
  *) echo -e "$HELPTEXT" ;;
esac

