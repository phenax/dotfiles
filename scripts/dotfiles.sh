#!/usr/bin/env bash

add() { yadm add "$@"; }
add-public-config() {
  # Work config
  add ~/README.md;
  add ~/.work-config;
  add ~/.gitmodules;
  add ~/.config/vimwiki;

  # X and DM
  add ~/.config/{bspwm,sxhkd,polybar}
  add ~/.Xresources ~/.xinitrc ~/.config/compton.conf;
  add ~/.config/xresources-schemes;
  add ~/.config/dunst;
  add ~/.config/autostart.sh;

  # Other config
  add ~/.config/{gtk-3.0,fontconfig,mimeapps.list};

  # Terminal and shell
  add ~/.bashrc ~/.profile;
  add ~/.zshrc ~/.config/zshconf ~/.zprofile ~/.config/zsh_history;

  # Dev
  add ~/scripts ~/.bin;
  add ~/.config/nvim ~/.config/coc;
  add ~/.yarnrc ~/.npmrc;

  # Applications
  add ~/.config/suckless;
  add ~/.config/qutebrowser;
  add ~/.config/{lf,mpv,sxiv,zathura,ncmpcpp,mopidy,newsboat,neofetch};
  # add ~/.config/spotifyd/spotifyd.conf;
  add ~/.config/transmission-daemon/settings.json;
  add ~/.config/transmission-remote-cli;
  add ~/.config/{calcurse,pet,shell-macros};

  # Wallpapers
  add ~/.fehbg;
  add ~/Pictures/wallpapers;
}

commit-push-all() {
  local oldir=$(pwd);
  cd "$1";
  git add .;
  git commit -m "$2";
  git push;
  cd $oldir;
}

# Should run a command
should_run() { [[ -z "$2" ]] || [[ "$1" == "$2" ]]; }

# Sync dotfiles to github (uses yadm)
update-dotfiles() {
  # Passwords push
  if (should_run pass "$1"); then
    echo -e "\n\n##### Pushing passwords";
    pass git push;
  fi;

  # Vim wiki push
  if (should_run notes "$1"); then
    echo -e "\n\n##### Pushing vimwiki";
    commit-push-all ~/.config/vimwiki "Notes updated";
  fi;

  # Push private config
  if (should_run work "$1"); then
    echo -e "\n\n##### Pushing private config";
    commit-push-all ~/.work-config "Updated private config";
  fi;

  # Dotfiles
  if (should_run dot "$1"); then
    echo -e "\n\n##### Pushing public dotfiles";
    yadm status;
    add-public-config;
    yadm commit -m "Updates dotfiles" && \
    yadm push -u origin master;
  fi;
}

update-dotfiles "$@";
