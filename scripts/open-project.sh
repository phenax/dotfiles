#!/bin/bash

PROJECTS=$(ls -t $PROJECTS_DIR);

PROJECT=$(echo "$PROJECTS" | rofi -dmenu -p "Project name");

if [ -z "$PROJECT" ]; then
  exit 1;
else
  kitty \
    -d "$PROJECTS_DIR/$PROJECT" \
    --session ~/scripts/kitty-sessions/ns \
  ;
fi;

