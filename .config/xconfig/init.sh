#!/usr/bin/env sh

# Xresources (theme)
userresources=$HOME/.config/xconfig/Xresources;
sysresources=/etc/X11/xinit/.Xresources;
[ -f $sysresources ] && xrdb -merge $sysresources;
[ -f $userresources ] && xrdb -merge $userresources;

# Xmodmap (keymapping)
sysmodmap=/etc/X11/xinit/.Xmodmap;
usermodmap=$HOME/.config/xconfig/Xmodmap;
[ -f $sysmodmap ] && xmodmap $sysmodmap;
[ -f $usermodmap ] && xmodmap $usermodmap;

# No screen saver
xset s off;
xset -dpms;
xset s noblank;

# Typing rate
xset r rate 350 30;

# Display settings
~/scripts/commands/:day

# Sound
~/scripts/sound.sh mic-vol full;
~/scripts/sound.sh mute-mic;
~/scripts/sound.sh mute;

