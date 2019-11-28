plugins=(
  git
)

ZSH_CUSTOM_CONF_FILES="$HOME/.zsh-config-files"

source $ZSH_CUSTOM_CONF_FILES/paths.zsh
source $ZSH_CUSTOM_CONF_FILES/aliases.zsh

source $ZSH/oh-my-zsh.sh
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

source $ZSH_CUSTOM_CONF_FILES/theme.zsh

export EDITOR='vim'

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

if [ -f `which powerline-daemon` ]; then
    powerline-daemon -q
    POWERLINE_BASH_CONTINUATION=1
    POWERLINE_BASH_SELECT=1
fi


