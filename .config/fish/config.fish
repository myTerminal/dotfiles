# Add custom shell scripts to PATH
add-to-path ~/.shell/scripts

# Set a few variables for fish
set fish_greeting "Hi myTerminal, the fish is here!"

# Load private keys, if they exist
if test -e ~/.private-keys
   . ~/.private-keys
end

# Set up common aliases
. ~/.config/fish/aliases.fish

# Load configs for the current OS
if test (uname) = "Linux"
    . ~/.config/fish/config-fedora.fish
else if test (uname) = "Darwin"
    . ~/.config/fish/config-mac.fish
end

