
trim() { sed '/^$/ d'; }

copy() { xclip -i -selection clipboard; }

copy_str() { echo -n "$@" | copy; }
