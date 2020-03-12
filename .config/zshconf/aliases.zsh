
# Utility stuff
alias open="xdg-open";
alias clock="tty-clock -t -b -c";
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"';
alias show-mobile-screen="adb shell screenrecord --output-format=h264 - | ffplay -";

# Sync dotfiles to github (uses yadm)
update-dotfiles() {
  yadm status;
  ~/scripts/dotfiles.sh;
  yadm commit -m "Updates dotfiles" && \
  yadm push -u origin master;
}

# reset-origin a2_develop
reset-origin() {
  if [[ -z $(git status -s) ]];
    then
      currentBranch="$(git rev-parse --abbrev-ref HEAD)"
      branch="$1";
      git checkout $branch &&
      git pull &&
      git reset --hard origin/production &&
      git push -u origin $branch -f &&
      git checkout $currentBranch;
    else
      echo "Your branch is dirty. Stash or commit changed before proceeding";
  fi
}

# Trash
alias trash="ls \$TRASH_TMP_DIR";

# LS aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
lc () { # lf with cd to navigated directory on quit
    tmp="$(mktemp)"
    lf -last-dir-path="$tmp" "$@"
    if [ -f "$tmp" ]; then
        dir="$(cat "$tmp")"
        rm -f "$tmp"
        [ -d "$dir" ] && [ "$dir" != "$(pwd)" ] && cd "$dir"
    fi
}

# Magic cd
eval "$(zoxide init zsh)";

# Git aliases
alias gaa="git add ."

# Github aliases
alias prls="gh pr list"
alias prco="gh pr checkout"
alias prstat="gh pr status"
alias prnew="gh pr create -b production"
alias prv="gh pr view"

# Node aliases
alias nr="npm run";
alias ns="npm start";
alias nt="npm test";

# Config editors
alias ezsh="cd ~/.config/zshconf && i3-sensible-editor .";
alias edot="i3-sensible-editor ~/scripts/dotfiles.sh";
alias eorg="cd ~/.config/org && i3-sensible-editor .";
alias evim="cd ~/.config/nvim && i3-sensible-editor .";
alias ehosts="sudo i3-sensible-editor /etc/hosts";

alias update-sandbox="sudo ~/scripts/host-file-elb-update.sh";

# Application shortcuts
alias v="nvim";
alias xvim="vi";
alias vim="nvim";
alias chrome="google-chrome";
alias chromei="google-chrome --incognito";
alias qute="qutebrowser";
alias qutei="qutebrowser --temp-basedir -s content.private_browsing true";

alias tmux="tmux -u";

# Load work aliases
source "$HOME/.work-config/zshconf/aliases.zsh";

