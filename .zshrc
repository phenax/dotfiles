autoload -U colors && colors

plugins=(
  git
)

export ZSH=/home/akshayn/.oh-my-zsh
ZSH_CUSTOM_CONF_FILES="$HOME/.zsh-config-files"

# . $ZSH_CUSTOM_CONF_FILES/vi.zsh
. $ZSH_CUSTOM_CONF_FILES/paths.zsh
. $ZSH_CUSTOM_CONF_FILES/aliases.zsh
. $ZSH_CUSTOM_CONF_FILES/theme.zsh
. $ZSH_CUSTOM_CONF_FILES/config.zsh

. ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
# . /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null

if [ -f `which powerline-daemon` ]; then
    powerline-daemon -q
    POWERLINE_BASH_CONTINUATION=1
    POWERLINE_BASH_SELECT=1
fi


