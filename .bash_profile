# Source .bashrc file if present
if [ -f ~/.bashrc ]; then
    . ~/.bashrc
fi

if [ -f ~/.mt-tag ]; then
    echo "TODO: Execute startup scripts from bash"
fi
