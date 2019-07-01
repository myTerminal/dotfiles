if [ $(uname) = 'Linux' ]; then
    . ~/.shell/fedora/.bash_profile
elif [ $(uname) = 'Darwin' ]; then
    . ~/.shell/mac/.bash_profile
fi
