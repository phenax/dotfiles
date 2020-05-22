#!/usr/bin/env bash

XRES_PATH="$HOME/.Xresources";

if [[ ! -z "$1" ]] && [[ -f "$1.Xresources" ]]; then
  cat ./_base ./$1.Xresources > $XRES_PATH;
  xrdb -load $XRES_PATH;
fi;
