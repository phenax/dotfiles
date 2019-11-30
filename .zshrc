plugins=(
  git
)

export ZSH=/home/akshayn/.oh-my-zsh
ZSH_CUSTOM_CONF_FILES="$HOME/.zsh-config-files"

. $ZSH_CUSTOM_CONF_FILES/paths.zsh
. $ZSH_CUSTOM_CONF_FILES/aliases.zsh
. $ZSH_CUSTOM_CONF_FILES/theme.zsh

. ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

export EDITOR='vim'
export VISUAL='vim'

if [ -f `which powerline-daemon` ]; then
    powerline-daemon -q
    POWERLINE_BASH_CONTINUATION=1
    POWERLINE_BASH_SELECT=1
fi


