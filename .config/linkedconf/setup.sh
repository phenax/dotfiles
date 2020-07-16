#!/usr/bin/env bash

CONF="$HOME/.config/linkedconf";

# Helpers {{{
  link() {
    [[ -f "$2" ]] && sudo rm "$2";
    sudo ln -s "$1" "$2";
  }

  linkf() { link "$CONF/$1" "$2"; }
# }}}

# linkf 'logind.conf' '/etc/systemd/logind.conf';
linkf 'elogind.conf' '/etc/elogind/logind.conf';
linkf 'issue' '/etc/issue';

