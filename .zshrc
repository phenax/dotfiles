autoload -U colors && colors;
setopt auto_cd;

export SAVEHIST=10
export HISTSIZE=10000
export HISTFILE=~/.config/zsh_history

setopt inc_append_history share_history;

export ZSH_CUSTOM_CONF_FILES="$HOME/.config/zshconf";

for f in $ZSH_CUSTOM_CONF_FILES/*.zsh; do source $f; done;

#source ~/.oh-my-zsh/oh-my-zsh.sh;

# Re source aliases (cant override ls aliases without this)
source $ZSH_CUSTOM_CONF_FILES/aliases.zsh;

# Plugins
source ~/.config/zshplugins/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh;
# source ~/.config/zshplugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh;

