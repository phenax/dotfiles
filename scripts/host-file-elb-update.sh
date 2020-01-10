#!/bin/bash

HOST_FILE="/etc/hosts";
BKUP_HOST_FILE="$HOME/.host-file-backup";

yes | cp -rf $HOST_FILE $BKUP_HOST_FILE;

# grep "# ELBU::" $HOST_FILE -A1;
# grep "# ELBU::" $HOST_FILE -A 1 | grep -v "# ELBU::";

get_ip() { getent hosts $1 | awk '{print $1}'; }

pinger() {
  while read line; do
    if [[ "$(echo $line | grep '# ELBU::')" != "" ]]; then
      elb="$(echo $line | awk '{print $5}')";
      old_ip="$(echo $line | awk '{print $1}')";
      elb_ip="$(get_ip $elb)";

      echo $line | \
        awk '{gsub(old_ip, "", $0); print elb $0}' \
          elb="$elb_ip" \
          old_ip="$old_ip";
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

      echo $line | \
        awk '{gsub(old_ip, "", $0); print new_ip $0}' \
          new_ip="$new_ip" \
          old_ip="$old_ip";
    else
      echo "$line";
    fi;
  done;
}

update-host-file() {
  contents=$(cat $HOST_FILE | pinger);
  echo "$contents" > $HOST_FILE;
}

disable-mappings() {
  contents=$(cat $HOST_FILE | comment-out);
  echo "$contents" > $HOST_FILE;
}

case "$1" in
  update) update-host-file ;;
  diff) diff $HOST_FILE $BKUP_HOST_FILE ;;
  disable) disable-mappings ;;
  *) echo "Wrong command bro" ;;
esac

