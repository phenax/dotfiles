# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

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

start_x_server () {
	pgrep Xorg && echo "X server is already running" || sx;
	exit;
}

[[ "$(tty)" == '/dev/tty1' ]] && start_x_server &> /dev/null

