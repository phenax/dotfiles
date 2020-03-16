#!/usr/bin/env bash

MACROS_PATH="$HOME/.config/shell-macros";

source "$MACROS_PATH/default_config.sh";
source "$MACROS_PATH/config.sh";

HELP_TEXT="Usage: pkger-macro [command] <args>

Commands:
  start <package name>      - Start installer session
  install <package name>    - Install a saved package
  install-all               - Install all packages
  ls                        - List all available packages
  delete <package name>     - Delete a package
  help                      - This dialog
";

get_package_path() { echo "package::$1"; }

guard() { if [[ -z "$2" ]]; then echo "$1"; exit 1; fi; }
guard_macro_name() { guard "You need to specify the name of the package" "$1"; }

start() {
  guard_macro_name "$1";
  macros start "$(get_package_path "$1")";
}

delete() {
  guard_macro_name "$1";
  guard "$1" "Missing name of the package";
  macros delete "$(get_package_path "$1")";
}

install() {
  guard_macro_name "$1";
  macros run "$(get_package_path "$1")";
}

list() { macros ls | grep '^package::'; }

install_all() { echo "fuck"; }

case "$1" in
  start)       start "$2" ;;
  install)     install "$2" ;;
  install-all) install_all ;;
  ls)          list ;;
  delete)      delete "$2" ;;
  *)           echo -e "$HELP_TEXT" ;;
esac

