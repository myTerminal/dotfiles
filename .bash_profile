if [ $(uname) = 'Linux' ]; then
    . ~/.scripts/fedora/.bash_profile
elif [ $(uname) = 'Darwin' ]; then
    . ~/.scripts/mac/.bash_profile
fi
