# use this line if in M-series mac
# eval "$(/opt/homebrew/bin/brew shellenv)"

# use this line if in intel mac
eval "$(/usr/local/bin/brew shellenv)"

# Set up fzf key bindings and fuzzy completion
source <(fzf --zsh)
