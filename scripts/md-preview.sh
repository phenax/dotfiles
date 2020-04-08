#!/bin/bash

BLOG_NAME="$1";
SOURCE_PATH=./$BLOG_NAME.md;
OUT_DIR=$(mktemp -d "/tmp/blogpost.XXXXXX");
OUT_PATH=$OUT_DIR/$BLOG_NAME.pdf;

touch $OUT_PATH;

watch-md() {
  ls . | entr pandoc -s -V fontsize=12pt -o "$OUT_PATH" "$SOURCE_PATH";
}

watch-md &
PID=$!;
disown;

sleep 1;
zathura $OUT_PATH;

kill "$PID";
