#!/usr/bin/env bash

[[ ! -z "$1" ]] && [[ -f "$1.Xresources" ]] && \
  cp -f ./$1.Xresources ~/.Xresources && \
  xrdb -load ~/.Xresources;

