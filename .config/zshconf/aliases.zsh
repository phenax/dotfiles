

# Utility stuff
alias open="xdg-open";
alias clock="tty-clock -t -b -c"
set-reminder() { echo "notify-send 'Reminder:: $1'" | at $2; }
alias on-complete="notify-send 'Command executed successfully' --urgency normal";
alias show-mobile-screen="adb shell screenrecord --output-format=h264 - | ffplay -";

# Monitor aliases
alias monitor-off="xrandr --output HDMI-1 --off";
monitor-on() { xrandr --output HDMI-1 --auto --${1:-"right-of"} eDP-1; };

# Fuck
eval $(thefuck --alias);

# LS aliases 
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'


# Git aliases
alias gaa="git add ."

# Sync dotfiles to github (uses yadm)
update-dotfiles() {
  yadm status;
  ~/scripts/dotfiles.sh;
  yadm commit -m "Updates dotfiles";
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

# lf with cd to navigated directory on quit
lc () {
    tmp="$(mktemp)"
    lf -last-dir-path="$tmp" "$@"
    if [ -f "$tmp" ]; then
        dir="$(cat "$tmp")"
        rm -f "$tmp"
        [ -d "$dir" ] && [ "$dir" != "$(pwd)" ] && cd "$dir"
    fi
}


# Node aliases
alias nr="npm run";
alias ns="npm start";
alias nt="npm test";

# Config editors
alias ezsh="cd ~/.config/zshconf && vim ~/.zshrc";
alias edot="vim ~/scripts/dotfiles.sh";
alias eorg="vim ~/.config/org";

# Application shortcuts
alias chrome="google-chrome";
alias chromei="google-chrome --incognito";
alias qute="qutebrowser";
alias qutei="qutebrowser --temp-basedir -s content.private_browsing true";

