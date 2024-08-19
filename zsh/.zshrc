# modify the default color used for directory in ls command from blue to cyan
export LSCOLORS=gx

source ~/.zprofile
source ~/.zsh_prompt
source ~/.aliases

# enable git tab completion
autoload -Uz compinit && compinit
