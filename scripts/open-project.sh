#!/bin/bash

projects=$(ls -t $PROJECTS_DIR);

project=$(echo "$projects" | rofi -dmenu -p "Project name");

if [ -z "$project" ]; then
  exit 1;
else
  ~/scripts/sessions/project.sh "$PROJECTS_DIR/$project";
fi;

