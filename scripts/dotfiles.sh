#!/bin/bash

add_dotfiles() {
  yadm add ~/.vimrc ~/scripts ~/.scimrc ~/.Xresources;
  yadm add ~/.config/{i3,gtk-3.0,fontconfig,mimeapps.list,rofi-themes};
  yadm add ~/.config/{terminator,kitty};
  yadm add ~/.bashrc ~/.zshrc ~/.config/zshconf;
  yadm add ~/.config/{lf,clipit};
}

add_dotfiles;

