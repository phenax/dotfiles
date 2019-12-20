autoload -U colors && colors

plugins=(
  git
)

export ZSH=/home/akshayn/.oh-my-zsh
ZSH_CUSTOM_CONF_FILES="$HOME/.config/zshconf"

for f in $ZSH_CUSTOM_CONF_FILES/*; do source $f; done

. ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
# . ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

if [ -f `which powerline-daemon` ]; then
    powerline-daemon -q
    POWERLINE_BASH_CONTINUATION=1
    POWERLINE_BASH_SELECT=1
fi


