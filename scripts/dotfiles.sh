#!/bin/bash

# X
yadm add ~/.config/{i3,rofi-themes};
yadm add ~/.Xresources ~/.config/{gtk-3.0,fontconfig,mimeapps.list};

# Terminal
yadm add ~/.bashrc ~/.zshrc ~/.config/zshconf ~/.profile;
yadm add ~/.config/{terminator,kitty};

# Dev
yadm add ~/.vimrc ~/scripts ~/.scimrc ~/.xinitrc ~/.tmux.conf ~/.gitconfig ~/.yarnrc ~/.npmrc;

# Applications
yadm add ~/.config/{lf,calcurse,clipit,org,pet,qutebrowser};
yadm add ~/.fehbg;

