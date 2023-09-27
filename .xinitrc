xrdb -merge ~/.Xresources

~/.scripts/linux/startup/desktop/run

case ${2} in
    alternate)
        exec xfce4-session
        ;;

    *)
        exec i3
        ;;
esac
