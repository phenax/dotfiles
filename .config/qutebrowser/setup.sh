#!/usr/bin/env bash

mkdir -p /tmp/backupDir;

# Create userscripts symlink
mv ~/.local/share/qutebrowser/userscripts /tmp/backupDir/;
ln -s ~/.config/qutebrowser/userscripts ~/.local/share/qutebrowser/userscripts;

# Create sessions symlink
mv ~/.local/share/qutebrowser/userscripts /tmp/backupDir/;
ln -s ~/.work-config/qutebrowser/sessions ~/.local/share/qutebrowser/sessions;
