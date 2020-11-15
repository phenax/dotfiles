# if running bash
if [ -n "$BASH_VERSION" ]; then
  if [ -f "$HOME/.bashrc" ]; then
    source "$HOME/.bashrc"
  fi
fi

source "$HOME/.config/zshconf/config.zsh";

PATH="$HOME/.bin:$PATH"
PATH="$HOME/scripts/commands:$PATH"
PATH="$HOME/.local/bin:$PATH"
source "$HOME/.config/zshconf/paths.zsh"
export PATH

start_x() {
  local conf="$HOME/.config/sx/$1.sxrc";
  [[ -f "$conf" ]] && exec sx "$conf";
}

[[ "$(tty)" == '/dev/tty1' ]] && start_x dwm &> /dev/null
#[[ "$(tty)" == '/dev/tty2' ]] && start_x artemiswm &> /dev/null
#[[ "$(tty)" == '/dev/tty2' ]] && start_x bspwm &> /dev/null
#[[ "$(tty)" == '/dev/tty3' ]] && start_x buzzwm &> /dev/null


export PATH="/home/imsohexy/.config/cargo/bin:$PATH"
