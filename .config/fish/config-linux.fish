# Add generic Linux scripts
add-to-path ~/.bin/linux

# Update PATH
add-to-path $HOME/bin
add-to-path $HOME/.local/bin

# Set up aliases
alias mt-copy="xsel --clipboard --input"
alias mt-paste="xsel --clipboard --output"
alias keymon-start="key-mon --key-timeout=1.5 --no-press-fadeout=2 --old-keys=5"

# TODO: Implement aliases with wl-clipboard for Wayland