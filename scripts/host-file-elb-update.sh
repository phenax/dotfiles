#!/bin/bash

HOST_FILE="/etc/hosts";
BKUP_HOST_FILE="$HOME/.host-file-backup";

DRY_RUN="$2";

yes | cp -rf $HOST_FILE $BKUP_HOST_FILE;

is_dry_run() { [[ "$DRY_RUN" == "--dry-run" ]]; }

get_ip() { getent hosts $1 | awk '{print $1}' | head -n 1; }

write_to_host_file() {
  if $(is_dry_run);
    then echo "$1";
    else echo "$1" > $HOST_FILE;
  fi;
}

pinger() {
  while read line; do
    if [[ "$(echo $line | grep '# ELBU::')" != "" ]]; then
      elb="$(echo $line | awk '{print $5}')";
      old_ip="$(echo $line | awk '{print $1}')";
      elb_ip="$(get_ip $elb)";

      echo $line | sed "s/$old_ip/$elb_ip/g";
    else
      echo "$line";
    fi;
  done;
}

comment-out() {
  while read line; do
    if [[ "$(echo $line | grep '# ELBU::')" != "" ]]; then
      old_ip="$(echo $line | awk '{print $1}')";
      new_ip="#$old_ip";

      echo $line | sed "s/$old_ip/$new_ip/g";
    else
      echo "$line";
    fi;
  done;
}

update-host-file() {
  contents=$(cat $HOST_FILE | pinger);
  write_to_host_file "$contents";
}

disable-mappings() {
  contents=$(cat $HOST_FILE | comment-out);
  write_to_host_file "$contents";
}

case "$1" in
  update) update-host-file ;;
  diff) diff $HOST_FILE $BKUP_HOST_FILE ;;
  disable) disable-mappings ;;
  *) echo "Wrong command bro" ;;
esac

