#!/bin/sh

case "$1" in
  # Archives
	*.tgz|*.tar.gz) tar tzf "$1";;
	*.tar.bz2|*.tbz2) tar tjf "$1";;
	*.tar.txz|*.txz) xz --list "$1";;
	*.tar) tar tf "$1";;
	*.zip|*.jar|*.war|*.ear|*.oxt) unzip -l "$1";;
	*.rar) unrar l "$1";;
	*.7z) 7z l "$1";;
	*.o) nm "$1" | less ;;

	# Docs
  *.md|*.org) glow -s dark "$1" ;;
	*.csv) cat "$1" | sed s/,/\\n/g ;;
	*.pdf) pdftotext "$1" ;;
	*.epub) mediainfo "$1" ;;
	*.[1-8]) man "$1" | col -b ;;

	# Images
	*.bmp|*.jpg|*.jpeg|*.png|*.xpm|*.webp) mediainfo "$1"; ;;

	# Audio
  *.wav|*.mp3|*.flac|*.m4a|*.wma|*.ape|*.ac3|*.og[agx]|*.spx|*.opus|*.as[fx]|*.flac)
    mediainfo "$1"
  ;;

  # Video
  *.avi|*.mp4|*.wmv|*.dat|*.3gp|*.ogv|*.mkv|*.mpg|*.mpeg|*.vob|*.fl[icv]|*.m2v|*.mov|*.webm|*.ts|*.mts|*.m4v|*.r[am]|*.qt|*.divx)
    mediainfo "$1";
  ;;

  # Syntax
	*) highlight --out-format ansi "$1" || cat "$1" ;;
esac
