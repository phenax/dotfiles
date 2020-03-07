#!/bin/bash

add() { yadm add "$@" || true; }

# Work config
add ~/.work-config;

# X and DM
add ~/.config/i3 ~/.Xresources ~/.xinitrc;
add ~/.config/{rofi,rofi-pass,rofi-themes};

# Other config
add ~/.config/{gtk-3.0,fontconfig,mimeapps.list};

# Terminal and shell
add ~/.bashrc ~/.profile;
add ~/.zshrc ~/.config/zshconf;
add ~/.oh-my-zsh/custom;
add ~/.config/kitty ~/.tmux.conf;

# Dev
add ~/.vimrc ~/.config/nvim ~/scripts ~/.bin;
add ~/.yarnrc ~/.npmrc ~/.gitconfig;

# Applications
add ~/.scimrc;
add ~/.config/suckless;
add ~/.config/{lf,calcurse,org,pet,qutebrowser};

# Wallpapers
add ~/.fehbg;
add ~/wallpapers

