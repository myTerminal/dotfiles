#!/usr/bin/env bash

# Run setup for the current OS
if [ $(uname) = 'Linux' ]; then
    . ~/.system/setup/fedora.sh
elif [ $(uname) = 'Darwin' ]; then
    . ~/.system/setup/mac.sh
fi

# Create Dropbox symlinks
. ~/.system/setup/create-dropbox-symlinks.sh