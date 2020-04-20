autoload -U colors && colors;

MAGIC_ENTER_GIT_COMMAND='git status';
MAGIC_ENTER_OTHER_COMMAND='ls';

plugins=(
  git
  # git-prompt
  sudo
  zsh-interactive-cd
  magic-enter
);

export ZSH=/home/akshayn/.oh-my-zsh;
ZSH_CUSTOM_CONF_FILES="$HOME/.config/zshconf";

for f in $ZSH_CUSTOM_CONF_FILES/*; do source $f; done;

# Adapters
source $ZSH/oh-my-zsh.sh;
source $HOME/.config/shell-macros/adapters/zsh;

# Re source aliases (cant override ls aliases without this)
source $ZSH_CUSTOM_CONF_FILES/aliases.zsh;

# Plugins
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh;
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh;

