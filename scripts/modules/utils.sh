
trim() { sed '/^$/ d'; }

clipboard() { xclip -selection clipboard "$@"; }

copy() { clipboard -i; }
read_clipboard() { clipboard -o; }

copy_str() { echo -n "$@" | copy; }
