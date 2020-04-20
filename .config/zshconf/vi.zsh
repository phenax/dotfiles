autoload -z edit-command-line; zle -N edit-command-line;

MOD="^X";

bindkey "$MOD^E" edit-command-line;
# bindkey "$MOD$" beginning-of-line
# bindkey "${MOD}0" end-of-line

