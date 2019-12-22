
add_dotfiles() {
  yadm add ~/.zshrc ~/.bashrc ~/.vimrc ~/scripts ~/.scimrc ~/.Xresources;
  yadm add ~/.config/{i3,gtk-3.0,fontconfig, mimeapps.list};
  yadm add ~/.config/{terminator,kitty};
  yadm add ~/.bashrc ~/.zshrc ~/.config/{zshconf};
  yadm add ~/.config/{ lf, clipit, rofi-themes, mimeapps.list, dotfiles.sh, kitty};
}

add_dotfiles;

