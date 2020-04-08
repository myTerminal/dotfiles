alias audio-restart="pulseaudio -k; pulseaudio --start"
alias wifi-connect="nmcli d wifi"

alias keymon-start="key-mon --key-timeout=1.5 --no-press-fadeout=2 --old-keys=5"

if type -q apt
    alias mt-system-update-packages="sudo apt update; sudo apt upgrade"
else if type -q dnf
    alias mt-system-update-packages="sudo dnf update; sudo apt upgrade"
else if type -q pacman
    alias mt-system-update-packages="sudo pacman -Syu"
end

alias mt-power-prevent-sleep="systemctl mask sleep.target suspend.target"
alias mt-power-allow-sleep="systemctl unmask sleep.target suspend.target"
alias mt-power-shutdown="systemctl poweroff"
alias mt-power-reboot="systemctl reboot"
alias mt-power-suspend="systemctl suspend"
alias mt-power-hibernate="systemctl hibernate"