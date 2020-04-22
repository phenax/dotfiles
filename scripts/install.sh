#!/bin/bash

sudo apt update;

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
  sensible-terminal \
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

sudo apt autoremove;

brew tap nickolasburr/pfa && brew install sc-im;
ln -s ~/.config/calcurse ~/.calcurse;

# yadm clone https://github.com/phenax/dotfiles.git

# Haskell dev setup
sudo apt-get install haskell-platform;
curl -sSL https://get.haskellstack.org/ | sh;




