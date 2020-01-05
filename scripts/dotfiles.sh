#!/bin/bash

add() { yadm add "$@" || true; }

# X
add ~/.config/{i3,rofi,rofi-pass,rofi-themes};
add ~/.Xresources ~/.config/{gtk-3.0,fontconfig,mimeapps.list};

# Terminal
add ~/.bashrc ~/.zshrc ~/.config/zshconf ~/.profile;
add ~/.config/{terminator,kitty};

# Dev
add ~/.vimrc ~/scripts ~/.scimrc ~/.xinitrc ~/.tmux.conf ~/.gitconfig ~/.yarnrc ~/.npmrc;

# Applications
add ~/.config/{lf,calcurse,org,pet,qutebrowser,suckless};
add ~/.fehbg;

