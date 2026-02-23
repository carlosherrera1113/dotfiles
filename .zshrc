export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME=""
source $ZSH/oh-my-zsh.sh

eval "$(starship init zsh)"

# Dotfiles management alias
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles --work-tree=$HOME'
