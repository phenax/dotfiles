#!/bin/bash

source ~/scripts/modules/utils.sh;
source ~/scripts/modules/rofi-menu.sh;

SNIPPETS_PATH="$HOME/.config/org/snippets"

current_selected() { xsel; }

get_snippet_list() { ls -1 "$SNIPPETS_PATH"; }

open_snippets_menu() {
  opened=$(get_snippet_list | open);
}

case "$1" in
  list) open_snippets_menu ;;
  *) echo "Foobar" ;;
esac

