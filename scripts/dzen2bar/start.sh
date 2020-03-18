#!/bin/sh

bar() {
  dzen2 \
    -ta right \
    -y "-1" \
    -x "0" \
    -fn "-*-fixed-medium-*-*-*-13-*-*-*-*-*-*-*" \
    "$@" \
  ;
    # -fn "xft:serif:size=10" \
}

conky -c $HOME/scripts/dzen2bar/conky.conf | bar &
sleep 1;
conky -c $HOME/scripts/dzen2bar/conky-workspaces.conf | bar -w 400 -ta left -p &

