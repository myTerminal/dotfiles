# Update PATH for custom shell scripts
add-to-path ~/.scripts

# Set custom environment variables
set -x MT_WORKSPACE_GITHUB ~/_github

# Set a few variables for fish
set fish_greeting "Hi myTerminal, the fish is here!"

# Load private keys, if they exist
if test -e ~/Storage/myTerminal/.private-keys
   . ~/Storage/myTerminal/.private-keys
end

# Set up common aliases
alias cl="clear"
alias gt="clear; git"
alias mt-sync-github="mt-sync-projects $MT_WORKSPACE_GITHUB"

# Load configs for the current OS
if test (uname) = "Linux"
    . ~/.config/fish/config-linux.fish
else if test (uname) = "Darwin"
    . ~/.config/fish/config-mac.fish
end

