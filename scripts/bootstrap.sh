#!/usr/bin/env bash

# Reading material
 ## http://smarden.org/runit/runscripts.html#getty

# Before going make sure
 ## All config files are added to vsc updated
 ## Sync memes, music and videos to phone
 ## Symlink useful stuff outside home and save inside .work-config

# yay -S mtm-git;

# Helpers {{{
  install() { yay -S "$@"; }

  :continue() {
    echo -n "${1:-Continue}? (yn) ";
    read x;
    [[ "$x" == "n" ]] && exit 0;
  }

  clone() {
    cd ~/dump && \
    git clone "$1" "$2" && \
    cd "$2";
  }
# }}}

:continue "Setup and install initial dependencies"
# Initialization {{{
  # Create dump
  [[ ! -d "~/dump" ]] && mkdir ~/dump;

  # Install yay
  clone 'https://aur.archlinux.org/yay.git' yay;
  makepkg -si;

  # Install build deps
  install python make go nodejs;
# }}}

:continue "Install X server";
# Install x server {{{
  # Read: https://wiki.archlinux.org/index.php/Xorg

  install xorg-server xorg-apps;
  cd .config/xresources-schemes && ./set-theme.sh reset;
# }}}

:continue "Clone dotfiles";
# Dotfiles {{{
  # Install yadm
  install yadm-git;

  # Clone dotfiles (with submodules)
  yadm clone --recurse-submodules --remote-submodules https://github.com/phenax/dotfiles.git;
# }}}

:continue "Update symlinks";
# Update symlinks outside home {{{
cd ~/.config/linkedconf;
./setup.sh;
# }}}

:continue "Install fonts"
# Fonts {{{
install cozette-ttf ttf-jetbrains-mono otf-font-awesome;
install ttf-devicons ttf-nerd-fonts-symbols ttf-symbola;
# }}}

:continue "Install wm stuff"
# Desktop {{{
  # My forks dwm, st, dmenu, dwmblocks, bslock, shotkey
  suck_fork() { cd ~/.config/suckless/$1 && sudo make install; }
  cd ~/.config/suckless;
  ls | while read d; do suck_fork "$d"; done;

  # Compositor + Notific daemon
  install picom-tryone-git dunst wmctrl xdotool xdo;
# }}}

:continue "Install browser"
# Browser {{{
  install qutebrowser;
  #cd ~/.config/qutebrowser;
  #./setup.sh;
# }}}

:continue "Install zsh"
# Shell {{{
  # zsh (+ change shell to zsh)
  install zsh;

  # neovim
  install neovim;

  # Create senisble applications
  ~/.bin/create-sensible-applications;
# }}}

:continue "Install Media"
# Media stuff {{{
  # lf, sxiv, mpv, mpc
  install feh sxiv mpv mpc;
  go get -u github.com/gokcehan/lf;

  install playerctl youtube-dl;

  # Daemons
  install udiskie clipmenu unclutter;

  # Transmission daemon + stig
  # Zathura
  # Newsboat
  # neofetch
  # mopidy, mopidy-spotify, mopidy-mpris, ncmpcpp
  # In .config/mopidy run template.sh
# }}}


# Verify PATH

# Create SSH key and upload to github, gitlab, aur

# Install old gpg key

