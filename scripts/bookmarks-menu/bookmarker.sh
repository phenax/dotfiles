#!/bin/bash

# TODO: Convert bookmarks to json array and use jq

source ~/scripts/modules/rofi-menu.sh;
source ~/scripts/modules/utils.sh;

BOOKMARKER_FILE="$HOME/scripts/bookmarks-menu/bookmarks";

get_column() { awk "BEGIN {FS=\"|\"}; $1"; }

OPEN="⚟ Open";
COPY="⎘ Copy";
TYPE="⌨ Type";
DELETE="✗ Delete";
ADD="add";

options=$(echo "
$OPEN
$COPY
$TYPE
$DELETE
" | trim)

get_options() { echo "$options"; }
get_bookmarks() { cat $BOOKMARKER_FILE | trim; }
add_bookmark() { echo "$1|$2" >> $BOOKMARKER_FILE; }
prepend_bookmark() {
  bookmarks=$(cat $BOOKMARKER_FILE);
  echo -e "$1\n$bookmarks" > $BOOKMARKER_FILE;
}
delete_bookmark() {
  bookmarks=$(cat $BOOKMARKER_FILE);
  echo -e "$bookmarks" | grep -v "$1" > $BOOKMARKER_FILE;
}

get_title() { get_column '{ print $1 }'; }
get_url() { get_column '{ print $2 }'; }
find_by_title() { cat $BOOKMARKER_FILE | sed "/^$1|/!d" | head -n 1; }

display_bookmarks() { get_bookmarks | get_title | open-menu -p "Bookmarks"; }
display_options() { get_options | open-block-menu -p "Action"; }

move_bookmark_up() {
  bookmark=$(find_by_title "$1");
  delete_bookmark "$bookmark";
  prepend_bookmark "$bookmark";
}

menu() {
  selected_title=$(display_bookmarks);
  bookmark_url=$(find_by_title "$selected_title" | get_url);

  [[ -z "$selected_title" ]] && exit 0;

  action="print";

  if [[ -z "$bookmark_url" ]]; then
    action=$ADD;
  else
    action=$(display_options);
  fi

  case "$action" in
    $COPY) echo "$bookmark_url" | copy && move_bookmark_up "$selected_title" ;;
    $OPEN) xdg-open "$bookmark_url" && move_bookmark_up "$selected_title" ;;
    $DELETE) delete_bookmark $(find_by_title "$selected_title") ;;
    $TYPE) xdotool type --delay 30 "$bookmark_url" ;;
    $ADD)
      url=$(open-menu -p "URL for $selected_title");
      [[ -z "$url" ]] && exit 0;
      add_bookmark "$selected_title" "$url";
    ;;
    *) echo "$bookmark_url" ;;
  esac
}

case "$1" in
  menu) menu ;;
  add) add_bookmark "$2" "$3"; echo "Added $2 to bookmarks" ;;
  *) echo "Usage: You stupid dood" ;;
esac

