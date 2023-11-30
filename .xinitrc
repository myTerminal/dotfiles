xrdb -merge ~/.Xresources
xrdb -merge ~/.Xresources_custom

~/.scripts/linux/startup/desktop/run

case ${2} in
    alternate)
        exec dbus-run-session xfce4-session
        ;;

    *)
        exec dbus-run-session i3
        ;;
esac
