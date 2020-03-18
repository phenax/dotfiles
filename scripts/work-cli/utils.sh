# Time utils
t() { echo "$1"; }
sec() { awk '{print $0}'; }
mins() { awk '{print $time "* 60"}' time="$1" | bc; }
hours() { awk '{print $time "* 60 * 60"}' time="$1" | bc; }

# Send notification
say() { notify-send "$@"; }

get_focused_window() {
  id=$(xprop -root | awk '/_NET_ACTIVE_WINDOW\(WINDOW\)/{print $NF}');
  window_info=$(xprop -id $id);
  name=$(echo -e "$window_info" | awk '/_NET_WM_NAME/ {$1=$2="";print}' | cut -d'"' -f2);
  class=$(echo -e "$window_info" | awk '/WM_CLASS/ {$1=$2="";print}' | cut -d'"' -f2);
  echo "$class - $name";
}

echo $(get_focused_window);



