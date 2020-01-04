
ROFI_BLOCK_THEME="$HOME/.config/rofi-themes/phenax-block-theme.rasi"

open-menu() { rofi -dmenu "$@"; }
open-block-menu() { rofi -dmenu -theme "$ROFI_BLOCK_THEME" "$@"; }

