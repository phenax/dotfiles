
# Utility stuff
alias open="xdg-open";
alias clock="tty-clock -t -b -c";
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"';
alias show-mobile-screen="adb shell screenrecord --output-format=h264 - | ffplay -";

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

# List files aliases
alias ls="lsd";
alias l="ls -1";
alias la='ls -a';
alias ll='ls -alF';
alias lt='ls --tree';
alias la='ls -A';
alias lsize='du -h -d1';

lc () { # lf with cd to navigated directory on quit
    tmp="$(mktemp)"
    lf -last-dir-path="$tmp" "$@"
    if [ -f "$tmp" ]; then
        dir="$(cat "$tmp")"
        rm -f "$tmp"
        [ -d "$dir" ] && [ "$dir" != "$(pwd)" ] && cd "$dir"
    fi
}

# Git aliases
alias gaa="git add ."

# Node aliases
alias nr="npm run";
alias ns="npm start";
alias nt="npm test";

# Config editors
alias eorg="sensible-editor ~/.config/vimwiki/index.md";
alias ezsh="cd ~/.config/zshconf && sensible-editor .";
alias edot="sensible-editor ~/scripts/dotfiles.sh";
alias evim="cd ~/.config/nvim && sensible-editor .";
alias ecom="cd ~/scripts/commands && sensible-editor .";

alias edwm="cd ~/.config/suckless/dwm && sensible-editor .";
alias ebar="cd ~/.config/suckless/dwmbar && sensible-editor .";
alias ekey="cd ~/.config/sxhkd && sensible-editor .";

alias ehosts="sudo nvim /etc/hosts";
alias sandbox="sudo ~/scripts/host-file-elb-update.sh";

# Application shortcuts
alias e="sensible-editor";
alias v="nvim";
alias vim="nvim";
alias chrome="google-chrome";
alias chromei="google-chrome --incognito";
alias qute="qutebrowser";
alias qutei="qutebrowser --temp-basedir -s content.private_browsing true";

# Load work aliases
source "$HOME/.work-config/zshconf/aliases.zsh";

# QR file transfer
alias qr-send="qrcp";
alias qr-get="qrcp receive";
qr-str() { curl qrenco.de/$1; }

# Audio download
alias dl-audio="youtube-dl --ignore-errors --output '%(title)s.%(ext)s' --extract-audio";

# Pacman aliases
alias auto-remove="yay -Rcs \$(yay -Qdtq)";
alias update="yay -Syyu";

# Use systemd prompt for sudo
alias su="SUDO_ASKPASS=/usr/bin/systemd-ask-password sudo -A";

# Dictionary
dict() { curl dict://dict.org/d:$1; }

