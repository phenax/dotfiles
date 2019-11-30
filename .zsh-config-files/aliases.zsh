
alias open="xdg-open";
alias show-mobile-screen="adb shell screenrecord --output-format=h264 - | ffplay -";

alias on-complete="notify-send 'Command executed successfully' --urgency normal";

alias clock="tty-clock -t -b -c"

set-php-version() {
	sudo update-alternatives --set php "/usr/bin/php$1";
}

set-reminder() {
	echo "notify-send 'Reminder:: $1'" | at $2
}

# Monitor aliases
alias monitor-off="xrandr --output HDMI-1 --off";
monitor-on() { xrandr --output HDMI-1 --auto --${1:-"right-of"} eDP-1; };


# LS aliases 
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'


# Git aliases
alias gunstage="git reset HEAD --"
alias gaa="git add ."

update-dotfiles() {
  yadm add ~/{.zshrc,.bashrc,.vimrc,.vim-config-files,.zsh-config-files};
  yadm commit -m "Updates dotfiles";
  yadm push -u origin master;
}

reset-origin() {
  if [[ -z $(git status -s) ]];
    then
      currentBranch="$(git rev-parse --abbrev-ref HEAD)"
      branch="$1";
      git checkout $branch;
      git reset --hard origin/production;
      git push -u origin $branch -f;
      git checkout $currentBranch;
    else
      echo "Your branch is dirty. Stash or commit changed before proceeding";
  fi
}

