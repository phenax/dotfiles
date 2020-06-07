#!/bin/bash

add() { yadm add "$@"; }
add-public-config() {
  # Work config
  add ~/README.md;
  add ~/.work-config;

  # X and DM
  add ~/.config/i3;
  add ~/.config/xmonad;
  add ~/.config/{bspwm,sxhkd,polybar}
  add ~/.Xresources ~/.xinitrc ~/.config/compton.conf;
  add ~/.config/xresources-schemes;
  add ~/.config/dunst;
  add ~/.config/autostart.sh;

  # Other config
  add ~/.config/{gtk-3.0,fontconfig,mimeapps.list};

  # Terminal and shell
  add ~/.bashrc ~/.profile;
  add ~/.zshrc ~/.config/zshconf;
  add ~/.oh-my-zsh/custom;
  add ~/.config/kitty;

  # Dev
  add ~/scripts ~/.bin;
  add ~/.config/nvim ~/.config/coc;
  add ~/.yarnrc ~/.npmrc;

  # Applications
  add ~/.config/suckless;
  add ~/.config/qutebrowser;
  add ~/.config/{lf,mpv,sxiv,zathura,netctl-gui.conf,ncmpcpp,mopidy};
  add ~/.config/spotifyd/spotifyd.conf;
  add ~/.config/transmission-daemon/settings.json;
  add ~/.config/transmission-remote-cli;
  add ~/.config/{calcurse,pet,shell-macros};

  # Wallpapers
  add ~/.fehbg;
  add ~/wallpapers;
}

commit-push-all() {
  local oldir=$(pwd);
  cd "$1";
  git add .;
  git commit -m "$2";
  git push;
  cd $oldir;
}

# Sync dotfiles to github (uses yadm)
update-dotfiles() {
  # Passwords push
  echo -e "\n\n##### Pushing passwords";
  pass git push;

  # Vim wiki push
  echo -e "\n\n##### Pushing vimwiki";
  commit-push-all ~/.config/vimwiki "Notes updated";

  # Push private config
  echo -e "\n\n##### Pushing private config";
  commit-push-all ~/.work-config "Updated private config";

  # Dotfiles
  echo -e "\n\n##### Pushing public dotfiles";
  yadm status;
  add-public-config;
  yadm commit -m "Updates dotfiles" && \
  yadm push -u origin master;
}

update-dotfiles;
