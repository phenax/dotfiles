
BIN_DIR="$SCRIPTS_BINARY_DIR";
SCRIPT="$SCRIPTS_DIR";

_create_runner() {
  local name="$1";
  local filename="${2:-"$1.sh"}";
  local filepath="$SCRIPT/$filename";

  alias $name="$filepath";

  # Create a binary file with symlink to script
  # if [ ! -f "$BIN_DIR/$name" ]; then
    # ln -s "$filepath" "$BIN_DIR/$name";
  # fi;
}

_create_runner "wifi-menu";

_create_runner "image-preview";
_create_runner "brightness";
_create_runner "lockscreen";
_create_runner "open-project";
_create_runner "xres-template" "xres-template.js";

