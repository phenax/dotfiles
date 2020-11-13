#!/usr/bin/env bash

# Before this you need
#  - SSH config

# yay -S mtm-git;

# Helpers {{{
  should_skip=0;
  cmd="$1";

  install() { yay -S "$@"; }

  run() {
    if [[ ! -z "$cmd" ]] && [[ "$cmd" == "$1" ]]; then
      "$1" && exit 0 || exit 1;
    fi;

    echo -n "${2:-Continue}? (Ynq) ";
    read x;

    [[ "$x" == "q" ]] && exit 0;

    if [[ "$x" != "n" ]]; then
      "$1";
    fi;
  }

  clone() {
    cd ~/dump && \
    git clone "$1" "$2" && \
    cd "$2";
  }
# }}}

setup() { # {{{
  # Create dump
  [[ ! -d "$HOME/dump" ]] && mkdir ~/dump;

  # Install yay
  clone 'https://aur.archlinux.org/yay.git' yay;
  makepkg -si;

  # Install build deps
  install python make go nodejs;
}

run setup 'Setup and install initial dependencies';
# }}}

x_server() { # {{{
  # Read: https://wiki.archlinux.org/index.php/Xorg

  install xorg-server xorg-apps;
  cd .config/xresources-schemes && ./set-theme.sh reset;
}

run x_server 'Install X server';
# }}}

dotfiles() { # {{{
  # Install yadm
  install yadm-git;

  # Clone dotfiles (with submodules)
  # FIXME: Use yadm submodule update --init
  yadm clone --recurse-submodules --remote-submodules https://github.com/phenax/dotfiles.git;
}

run dotfiles 'Clone dotfiles';
# }}}

update_links() { # {{{
  cd ~/.config/linkedconf;
  ./setup.sh;
}

run update_links 'Update symlinks';
# }}}

fonts() { # {{{
  install cozette-ttf ttf-jetbrains-mono otf-font-awesome;
  install ttf-devicons ttf-nerd-fonts-symbols ttf-symbola;
}

run fonts 'Install fonts';
# }}}

install_wm() { # {{{
  # My forks dwm, st, dmenu, dwmblocks, bslock, shotkey
  suck_fork() { cd ~/.config/suckless/$1 && sudo make install; }
  cd ~/.config/suckless;
  ls | while read d; do suck_fork "$d"; done;

  # Compositor + Notific daemon
  install picom-tryone-git dunst wmctrl xdotool xdo;
}

run install_wm 'Install wm stuff';
# }}}

browser() { # {{{
  install qutebrowser;
  #cd ~/.config/qutebrowser;
  #./setup.sh;
}

run browser 'Install browser';
# }}}

install_shell() { # {{{
  # zsh (+ change shell to zsh)
  install zsh;

  # neovim
  install neovim;

  # Create senisble applications
  ~/.bin/create-sensible-applications;
}

run install_shell 'Install zsh';
# }}}

media() { # {{{
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
  # Syncthing
  # mopidy, mopidy-spotify, mopidy-mpris, ncmpcpp
  # In .config/mopidy run template.sh
}

run media 'Install Media';
# }}}

passwords() { # {{{
  cd ~/.config/password-store;
  #git reset --hard;
  gpg2 --import keyfile;

  yay -S pinentry-dmenu;
  sudo mv $(which pinentry) /usr/bin/pinentry-old;
  sudo ln -s $(which pinentry-dmenu) /usr/bin/pinentry;
}

run passwords 'Reconfigure passwords';
# }}}

bootloader() { # {{{
  echo "Make sure this is correct. Run manually";
  exit 1;
  local uuid=$(blkid -s UUID -o value /dev/nvme0n1p2);
  sudo efibootmgr -d /dev/nvme0n1 -p 1 \
    -c -L "Artix Linux" \
    -l /vmlinuz-linux \
    -u "root=UUID=$uuid rw initrd=\intel-ucode.img initrd=\initramfs-linux.img" \
    --verbose;
}

run bootloader 'Install efistub bootloader';
# }}}

# Verify PATH

# Create SSH key and upload to github, gitlab, aur

# Install old gpg key

