#
# ~/.zprofile
#

echo ".zprofile $(tty)" >> $HOME/dump/profilelogss;

source ~/.profile

[[ -f ~/.zshrc ]] && . ~/.zshrc

# eval "$(gh completion -s bash)";

