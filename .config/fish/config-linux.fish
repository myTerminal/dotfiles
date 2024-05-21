# Add generic Linux scripts
add-to-path ~/.bin/linux

# Update PATH
add-to-path $HOME/bin
add-to-path $HOME/.local/bin

# Set up aliases
alias mt-copy="xsel --clipboard --input"
alias mt-paste="xsel --clipboard --output"

# TODO: Implement aliases with wl-clipboard for Wayland