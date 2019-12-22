#!/bin/bash

# https://github.com/Corwind/termite-install

sudo apt install \
  yadm \
  vim \
  vim-gtk3 \
  vim-plug \
  nvim \
  lf \
  ranger \
  zathura \
  tmux \
  terminator \
  arandr \
  rofi \
  dunst \
  rofi-emoji \
  i3lock \
  i3 \
  i3-sensible-terminal \
  tty-clock \
  fonts-roboto \
  fonts-powerline \
  fonts-google \
  gparted \
  jq \
  ack \
  inxi \
  zsh \
  pass \
  calcurse \
  zsh-syntax-highlighting;

brew tap nickolasburr/pfa && brew install sc-im;

ln -s ~/.config/calcurse ~/.calcurse;

