
# Pacman aliases
alias auto-remove="yay -Rcs \$(yay -Qdtq)";
alias update="yay -Syyu";

# Use systemd prompt for sudo
alias su="SUDO_ASKPASS=/usr/bin/systemd-ask-password sudo -A";

# Sandbox
alias sandbox="sudo ~/scripts/host-file-elb-update.sh";
