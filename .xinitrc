xrdb -merge ~/.Xresources
xrdb -merge ~/.Xresources_custom

~/.scripts/linux/startup/desktop/run

exec dbus-run-session i3 -c ~/.config/wm/i3
