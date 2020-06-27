#!/usr/bin/env bash

XRES_PATH="$HOME/.Xresources";
CURRENT=current;

theme="$1";

if [[ "$1" == "reset" ]]; then
  theme=$(cat $CURRENT);
fi;

if [[ ! -z "$theme" ]] && [[ -f "$theme.Xresources" ]]; then
  cat ./_base $theme.Xresources > $XRES_PATH;
  echo "$theme" > $CURRENT;
  xrdb -load $XRES_PATH;
else
  echo "No $theme";
  exit 1;
fi;
