if [ -f ~/.config/bash/fedora/.bashrc ]; then
    . ~/.config/bash/fedora/.bashrc
fi

PATH=$PATH:$HOME/.local/bin:$HOME/bin
export PATH

. ~/.shell/fedora/aliases.sh