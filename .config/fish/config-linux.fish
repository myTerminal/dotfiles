# Add generic Linux scripts
add-to-path ~/.scripts/linux

# Add rest of the distro specific scripts
if test (command -v pacman)
    add-to-path ~/.scripts/linux/arch
else if test (command -v apt)
    add-to-path ~/.scripts/linux/debian
else if test (command -v xbps-query)
    add-to-path ~/.scripts/linux/void
end

# Set up aliases
alias xcopy="xsel --clipboard --input"
alias xpaste="xsel --clipboard --output"
alias keymon-start="key-mon --key-timeout=1.5 --no-press-fadeout=2 --old-keys=5"
