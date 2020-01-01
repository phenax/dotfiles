#!/bin/bash

add_dotfiles() {
  yadm add ~/.vimrc ~/scripts ~/.scimrc ~/.xinitrc;
  yadm add ~/.Xresources ~/.config/{gtk-3.0,fontconfig,mimeapps.list};
  yadm add ~/.config/{i3,rofi-themes};
  yadm add ~/.config/{terminator,kitty};
  yadm add ~/.bashrc ~/.zshrc ~/.config/zshconf;
  yadm add ~/.config/{lf,calcurse,clipit,org,pet,qutebrowser};
}

add_dotfiles;

