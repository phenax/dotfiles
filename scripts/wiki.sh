#!/usr/bin/env bash

WIKI_PATH=/usr/share/doc/arch-wiki/html/en;

menu() { dmenu -p "? "; }

wiki-menu() {
  local wiki=$(ls -A $WIKI_PATH | awk '/\.html$/' | sed 's/.html$//g' | menu);
  local wiki_path="file://$WIKI_PATH/$wiki.html";

  if [[ ! -z "$wiki" ]]; then
    sensible-browser $wiki_path &
  fi;
}

wiki-menu;

