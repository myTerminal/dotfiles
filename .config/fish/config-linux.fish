# Add generic Linux scripts
add-to-path ~/.scripts/linux

# Add rest of the distro specific scripts
# TODO: (entering-the-void) Implement a branch for Void
if test (command -v pacman)
    add-to-path ~/.scripts/linux/arch
else if test (command -v apt)
    add-to-path ~/.scripts/linux/debian
end

# Set up aliases
alias keymon-start="key-mon --key-timeout=1.5 --no-press-fadeout=2 --old-keys=5"
