# Source .bashrc file if present
if [ -f ~/.bashrc ]; then
    . ~/.bashrc
fi

if [ -f ~/.mt-tag ]; then
    . ~/.scripts/linux/startup/cli
fi
