
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="agnoster"

source $ZSH/oh-my-zsh.sh

prompt_context() {
  prompt_segment black default  "🖕"
}

prompt_dir() {
  prompt_segment blue black '%c'
}

#PROMPT="$PROMPT
#$(prompt_segment black default "🌈 $(prompt_end black)") ";

