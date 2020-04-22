
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
  pass git push;
}

# reset-origin a2_develop
reset-origin() {
  if [[ -z $(git status -s) ]];
    then
      currentBranch="$(git rev-parse --abbrev-ref HEAD)";
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

# LS(Deluxe) aliases
alias ls="lsd";
alias l="ls -1";
alias la='ls -a';
alias ll='ls -alF';
alias lt='ls --tree';
alias la='ls -A';

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
# eval "$(zoxide init zsh)";

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
alias eorg="cd ~/.config/org && $EDITOR .";
alias ezsh="cd ~/.config/zshconf && $EDITOR .";
alias edot="$EDITOR ~/scripts/dotfiles.sh";
alias evim="cd ~/.config/nvim && $EDITOR .";
alias ekey="cd ~/.config/sxhkd && $EDITOR .";
alias ebsp="cd ~/.config/bspwm && $EDITOR .";
alias ehosts="sudo nvim /etc/hosts";

alias sandbox="sudo ~/scripts/host-file-elb-update.sh";

# Application shortcuts
alias e="$EDITOR";
alias v="nvim";
alias xvim="/usr/bin/vim";
alias vim="nvim";
alias chrome="google-chrome";
alias chromei="google-chrome --incognito";
alias qute="qutebrowser";
alias qutei="qutebrowser --temp-basedir -s content.private_browsing true";

alias tmux="tmux -u";

# Load work aliases
source "$HOME/.work-config/zshconf/aliases.zsh";

alias qr-send="qrcp";
alias qr-get="qrcp receive";

