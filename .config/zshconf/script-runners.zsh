
_create_runner() { alias $1="~/scripts/${2:-"$1.sh"}"; }

_create_runner "image-preview";
_create_runner "brightness";
_create_runner "lockscreen";
_create_runner "xres-template" "xconfig.js";

