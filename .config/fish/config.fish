# Run startup script(s), for a login shell
status is-login
and test -f ~/.mt-tag
and . ~/.scripts/linux/startup/cli

# Update PATH for custom shell scripts
add-to-path ~/.scripts

# Update PATH for cargo(rust)
add-to-path ~/.cargo/bin
add-to-path ~/.cargo/env

# Set custom environment variables
set -x MT_PATH_STORE ~/_store
set -x MT_PATH_WORKSPACE ~/_workspace
set -x MT_PATH_WORKSPACE_GITHUB ~/_workspace/github

# Set a few variables for fish
set fish_greeting ""

# Load private keys, if they exist
if test -e "$MT_PATH_STORE/Documents/.private-keys"
   . "$MT_PATH_STORE/Documents/.private-keys"
end

# Set up common aliases
alias cl="clear"
alias gt="clear; git"
alias mt-sync-github="mt-sync-projects $MT_PATH_WORKSPACE_GITHUB"
alias lo="exa -la --group-directories-first"
alias po="bat"

# Load configs for the current OS
if test (uname) = "Linux"
    . ~/.config/fish/config-linux.fish
else if test (uname) = "Darwin"
    . ~/.config/fish/config-mac.fish
end

# Start a tmux session if appropriate
if not contains $TERM "screen" "screen-256color" "eterm-color" "dumb"
   tmux
end
