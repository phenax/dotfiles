
# Pacman aliases
alias auto-remove="yay -Rcs \$(yay -Qdtq)";
alias update="yay -Syyu";
alias mirrorlist-refresh="sudo reflector --latest 200 --protocol http --protocol https --sort rate --save /etc/pacman.d/mirrorlist"

# Use systemd prompt for sudo
alias su="SUDO_ASKPASS=/usr/bin/systemd-ask-password sudo -A";

# Sandbox
alias sandbox="sudo ~/scripts/host-file-elb-update.sh";

# Network
alias con="connmanctl";
alias wifimenu="sudo connman_dmenu";

