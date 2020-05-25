#!/bin/bash

source ~/scripts/modules/utils.sh;
source ~/scripts/modules/rofi-menu.sh;

GH_PROJECTS_FILE="$HOME/scripts/bookmarks-menu/gh-projects";

repo="  repo";
projects="  projects";
issues="  issues";
pull_requests="  pulls";

ACTIONS=$(echo "
$repo
$pull_requests
$projects
$issues
" | trim);

echo "$ACTIONS";

SEPERATOR=" -- ";
get_column() { awk -F"$SEPERATOR" "$@"; }

print_projects_data() { cat "$GH_PROJECTS_FILE" | trim; }

get_actions() { echo "$ACTIONS"; }
get_projects() { print_projects_data | get_column '{ print $1 }'; }
find_by_title() { print_projects_data | get_column "\$1 == \"$1\" { print \$0 }"; }

get_url() { echo $1 | get_column '{ print $2 }'; }

start() {
  local title=$(get_projects | open-menu -p "GH :: ");
  local project=$(find_by_title "$title");

  # TODO: Handle url entered as text instead of title
  [[ -z "$title" ]] || [[ -z "$project" ]] && exit 0;

  local action=$(get_actions | open-menu -l 0 -p "Tab :: ");

  local url="$(get_url "$project")";

  [[ -z "$action" ]] || [[ -z "$url" ]] && exit 0;

  case "$action" in
    $projects) url="$url/projects" ;;
    $issues) url="$url/issues" ;;
    $pull_requests) url="$url/pulls" ;;
    *) ;;
  esac;

  xdg-open "$url";
}

start;
