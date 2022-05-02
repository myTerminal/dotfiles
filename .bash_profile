# Run startup script(s)
if [ -f ~/.mt-tag ]; then
    . ~/.scripts/linux/startup/cli
fi

# Source .bashrc file if present
if [ -f ~/.bashrc ]; then
    . ~/.bashrc
fi
