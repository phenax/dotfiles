
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
alias gamend="git commit --amend"

update-dotfiles() {
  yadm status;
  yadm add ~/.config/{terminator,i3,gtk-3.0,fontconfig,lf,clipit,rofi-themes,mimeapps.list,zshconf};
  yadm add ~/.zshrc ~/.bashrc ~/.vimrc ~/scripts ~/.scimrc;
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
alias nr="npm run"
alias ns="npm start"

alias ezsh="cd ~/.config/zshconf && vim ~/.zshrc"

