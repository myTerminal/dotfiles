# Update PATH for custom shell scripts
add-to-path ~/.scripts

# Update PATH for cargo(rust)
add-to-path ~/.cargo/bin

# Set custom environment variables
set -x MT_PATH_STORE ~/_store
set -x MT_PATH_WORKSPACE ~/_workspace
set -x MT_PATH_WORKSPACE_GITHUB ~/_workspace/github

# Set a few variables for fish
set fish_greeting ""

# Load private keys, if they exist
if test -e ~/_store/myTerminal/.private-keys
   . ~/_store/myTerminal/.private-keys
end

# Set up common aliases
alias cl="clear"
alias gt="clear; git"
alias mt-sync-github="mt-sync-projects $MT_PATH_WORKSPACE_GITHUB"

# Start a tmux session if appropriate
if not contains $TERM "screen" "eterm-color" "dumb"
   tmux
end

# Load configs for the current OS
if test (uname) = "Linux"
    . ~/.config/fish/config-linux.fish
else if test (uname) = "Darwin"
    . ~/.config/fish/config-mac.fish
end
