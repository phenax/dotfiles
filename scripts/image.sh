#!/usr/bin/env bash
source "`ueberzug library`";

readonly ID_PREVIEW="preview";

case "$1" in
  "clear") ImageLayer 0< <(
      ImageLayer::remove [identifier]="$ID_PREVIEW"
  ) ;;
  "draw") ImageLayer 0< <(
      ImageLayer::add \
        [identifier]="$ID_PREVIEW" \
        [x]="$3" [y]="$4" \
        [max_width]="$5" [max_height]="$6" \
        [path]="$2";
      read -ern 1;
  ) ;;
  "*") echo "Unknown command: '$1'" ;;
esac

# case "$1" in
  # "clear")
    # declare -p -A cmd=([action]=remove [identifier]="$ID_PREVIEW") \
      # > "$FIFO_UEBERZUG"
    # ;;
  # "draw")
    # declare -p -A cmd=([action]=add [identifier]="$ID_PREVIEW" \
      # [x]="$3" [y]="$4" [max_width]="$5" [max_height]="$6" \
      # [path]="$2") > "$FIFO_UEBERZUG"
    # ;;
  # "*") echo "Unknown command: '$1', '$2'" ;;
# esac
