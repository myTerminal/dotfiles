# Expose shell scripts as commands
# (Already inherited from bash config)

# Load configs for the current OS
if test (uname) = "Linux"
    . ~/.config/fish/config-fedora.fish
else if test (uname) = "Darwin"
    . ~/.config/fish/config-mac.fish
end

# Load shell configs
. ~/.shell/config

# Set up common shell aliases
. ~/.shell/aliases/common

# Load aliases for the current OS
if test (uname) = "Linux"
    . ~/.shell/aliases/fedora
else if test (uname) = "Darwin"
    . ~/.shell/aliases/mac
end

set fish_greeting "Hi myTerminal, the fish is here!"