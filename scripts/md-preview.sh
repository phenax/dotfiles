#!/bin/bash

BLOG_NAME="$1";
SOURCE_PATH=./$BLOG_NAME.md;
OUT_DIR=/tmp/blogpost;
OUT_PATH=$OUT_DIR/$BLOG_NAME.pdf;

watch-md() {
  mkdir -p $OUT_DIR;
  touch $OUT_PATH;
  ls . | entr pandoc -s -V fontsize=12pt -o "$OUT_PATH" "$SOURCE_PATH";
}

watch-md &

sleep 1;
zathura $OUT_PATH;

PANDOC_PID=$(pgrep -a entr | awk '/pandoc/ {print $1}');

kill "$PANDOC_PID";
