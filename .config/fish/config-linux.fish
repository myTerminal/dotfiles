# Add generic Linux scripts
add-to-path ~/.scripts/linux

# Update PATH
add-to-path $HOME/bin
add-to-path $HOME/.local/bin

# Set up aliases
alias xcopy="xsel --clipboard --input"
alias xpaste="xsel --clipboard --output"
alias keymon-start="key-mon --key-timeout=1.5 --no-press-fadeout=2 --old-keys=5"
