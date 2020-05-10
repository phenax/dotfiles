#!/usr/bin/env bash

WIKI_PATH=/usr/share/doc/arch-wiki/html/en;

menu() {
  rofi -dmenu -i -p "Search";
}

wiki-menu() {
  local wiki=$(ls -A $WIKI_PATH | awk '/\.html$/' | sed 's/.html$//g' | menu);
  local wiki_path=$WIKI_PATH/$wiki;

  [[ ! -z "$wiki" ]] && sensible-browser $wiki_path;
}

wiki-menu;

