# Comment/Uncomment the appropriate section based on whether you are using
# homebrew or macport


#------------------------------------------------------------------------------
# macport (intel)
#------------------------------------------------------------------------------

# set path for macport
export PATH="/opt/local/bin:/opt/local/sbin:$PATH"

# enable fzf keybindings
source /opt/local/share/fzf/shell/key-bindings.zsh

# enable fuzzy auto-completion
source /opt/local/share/fzf/shell/completion.zsh

# enable zsh-syntax-highlighting
source /opt/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh


#------------------------------------------------------------------------------
# homebrew
#------------------------------------------------------------------------------

# use this line if in M-series mac
# eval "$(/opt/homebrew/bin/brew shellenv)"

# use this line if in intel mac
# eval "$(/usr/local/bin/brew shellenv)"

# Set up fzf key bindings and fuzzy completion
# source <(fzf --zsh)

# enable zsh-syntax-highlighting (need to install it)
# use this line if in intel mac
# source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# use this line if in M-seris mac
# source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
