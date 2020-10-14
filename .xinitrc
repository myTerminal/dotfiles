case "${1}" in
    secondary)
        exec gnome-session
        ;;

    *)
        exec i3
        ;;
esac
