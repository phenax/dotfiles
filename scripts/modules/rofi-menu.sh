
ROFI_BLOCK_THEME="$HOME/.config/rofi-themes/phenax-block-theme.rasi"

open-menu() { rofi -matching fuzzy -i -dmenu "$@"; }
open-block-menu() { open-menu -theme "$ROFI_BLOCK_THEME" "$@"; }

