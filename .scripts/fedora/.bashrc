. ~/.scripts/common/.bashrc

PS1='\u@\h:\w\$ '

alias _start-all="emacs & google-chrome &"
alias telegram="~/Apps/Telegram/Telegram &"

alias audio-r="pulseaudio -k && pulseaudio --start"

alias net-r="sh ~/.scripts/fedora/network-reconnect.sh"
alias wifi-connect="nmcli d wifi"

alias detach="udisks --detach"
alias detach-sdb="udisks --detach /dev/sdb"

alias start-keymon="key-mon --key-timeout=1.5 --no-press-fadeout=2 --old-keys=5"

alias system-update-packages="sudo dnf update"

alias system-shutdown="sudo shutdown 0"
alias system-reboot="sudo reboot 0"
alias system-suspend="systemctl suspend"
