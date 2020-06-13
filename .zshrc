autoload -U colors && colors;
setopt auto_cd;
setopt inc_append_history;

export SAVEHIST=10000
export HISTSIZE=50000
export HISTFILE=~/.config/zsh_history

setopt extended_history       # record timestamp of command in HISTFILE
setopt hist_expire_dups_first # delete duplicates first when HISTFILE size exceeds HISTSIZE
setopt hist_ignore_dups       # ignore duplicated commands history list
setopt hist_ignore_space      # ignore commands that start with space
setopt hist_verify            # show command with history expansion to user before running it
setopt share_history          # share command history data

export ZSH_CUSTOM_CONF_FILES="$HOME/.config/zshconf";

for f in $ZSH_CUSTOM_CONF_FILES/*.zsh; do source $f; done;
source $ZSH_CUSTOM_CONF_FILES/aliases.zsh;

# Plugins
source ~/.config/zshplugins/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh;
source ~/.config/zshplugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh;

