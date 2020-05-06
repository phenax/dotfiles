#!/bin/bash

add() { yadm add "$@"; }

# Work config
add ~/.work-config;

# X and DM
add ~/.config/i3;
add ~/.config/{bspwm,sxhkd,polybar}
add ~/.Xresources ~/.xinitrc ~/.config/compton.conf;
add ~/.config/{rofi,rofi-pass,rofi-themes};

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
add ~/.config/{lf,sxiv,calcurse,pet,qutebrowser,shell-macros};

# Wallpapers
add ~/.fehbg;
add ~/wallpapers;

