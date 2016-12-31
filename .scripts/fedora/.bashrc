PS1='\u@\h:\w\$ '

alias cl="clear"

alias _start-all="emacs & google-chrome &"
alias telegram="~/Apps/Telegram/Telegram &"

alias gt="git"
alias git-upload="git push origin master"
alias git-download="git pull origin master"
alias git-update-all-repositories="sh ~/.scripts/fedora/update-all-repositories.sh ~/_repositories/"

alias audio-r="pulseaudio -k && pulseaudio --start"

alias net-r="sh ~/.scripts/fedora/network-reconnect.sh"
alias wifi-connect="nmcli d wifi"

alias detach="udisks --detach"
alias detach-sdb="udisks --detach /dev/sdb"

alias start-keymon="key-mon --key-timeout=1.5 --no-press-fadeout=2 --old-keys=5"

alias shutdown="sudo shutdown 0"
alias reboot="sudo reboot 0"
alias suspend="systemctl suspend"
