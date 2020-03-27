#!/usr/bin/env bash

ROOT="$HOME/scripts/corona";

IMG_FILE="/tmp/coronaimg/graph";
SVG_FILE="$IMG_FILE.svg";
PNG_FILE="$IMG_FILE.png";

mkdir -p "$IMG_FILE";

echo "Downloading..."

node "$ROOT/fetch-graph.js" "$@" > $SVG_FILE;

convert \
  -trim \
  +antialias \
  "$SVG_FILE" "$PNG_FILE";

echo "Done";

~/scripts/image.sh draw "$PNG_FILE" 3 3 100 100;
