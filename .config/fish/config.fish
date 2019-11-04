# Expose shell scripts as commands
set -gx PATH $PATH ~./shell/scripts

# Set a few variables for fish
set fish_greeting "Hi myTerminal, the fish is here!"

# Load configs for the current OS
if test (uname) = "Linux"
    . ~/.config/fish/config-fedora.fish
else if test (uname) = "Darwin"
    . ~/.config/fish/config-mac.fish
end

# Set up aliases
# TODO: Implement

# Load shell configs
. ~/.shell/config
