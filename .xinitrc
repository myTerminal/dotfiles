xrdb -merge ~/.Xresources
xrdb -merge ~/.Xresources_custom

~/.scripts/linux/startup/desktop/run

case ${2} in
    alternate)
        # TODO: Use for alternate desktop
        echo "Not implemented!"
        ;;

    *)
        exec dbus-run-session i3 -c ~/.config/wm/i3
        ;;
esac
