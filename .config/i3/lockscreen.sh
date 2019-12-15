#!/bin/bash

SCREENSHOT=/tmp/screenshot.png;

scrot $SCREENSHOT;
convert $SCREENSHOT \
  -spread 5 \
  -modulate 100,60,100 \
  -fill black -colorize 30% \
  $SCREENSHOT;

i3lock \
  --image=$SCREENSHOT \
  --tiling \
  --ignore-empty-password \
  --show-failed-attempts \
  --clock \
\
  --pass-media-keys \
  --pass-screen-keys \
  --pass-power-keys \
\
  --timecolor=ffffffff \
  --timestr="%H:%M" \
  --datecolor=ffffffff \
  --datestr="%a, %d %b %Y" \
\
  --wrongtext="Wrong" \
  --noinputtext="Empty" \
  --insidewrongcolor=d6303155 \
  --ringwrongcolor=d63031ff \
  --wrongcolor=ffffffff \
\
  --veriftext="..." \
  --verifcolor=ffffffff \
  --insidevercolor=0984e355 \
  --ringvercolor=0984e3ff \
\
  --linecolor=00000000 \
  --insidecolor=00000000 \
  --ringcolor=34495eff \
  --separatorcolor=aaaaaaff \
  --keyhlcolor=55efc4ff \
  --bshlcolor=ff7675ff \
\
  --greetercolor=ffffffaa \
  --greetertext="Stay the fuck away" \
  --greetersize=20 \
;

rm $SCREENSHOT;

