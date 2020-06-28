#!/usr/bin/env bash

CONF="$HOME/.config/linkedconf";

# Helpers {{{
  link() {
    [[ -f "$2" ]] && sudo rm "$2";
    sudo ln -s "$1" "$2";
  }

  linkf() { link "$CONF/$1" "$2/$1"; }
# }}}

#linkf 'logind.conf' '/etc/systemd';

