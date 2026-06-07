export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME=""
source $ZSH/oh-my-zsh.sh

eval "$(starship init zsh)"

# Dotfiles management alias
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles --work-tree=$HOME'

# FZF fuzzy finder
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

alias lg='lazygit'
alias nv='nvim'
export PATH="$HOME/.local/bin:$PATH"

# Local machine-specific shell customizations.
[ -f "$HOME/.zshrc.local" ] && source "$HOME/.zshrc.local"

# Zsh plugins from Homebrew. Keep syntax highlighting last.
if [[ -r "${HOMEBREW_PREFIX:-/opt/homebrew}/share/zsh-autosuggestions/zsh-autosuggestions.zsh" ]]; then
  source "${HOMEBREW_PREFIX:-/opt/homebrew}/share/zsh-autosuggestions/zsh-autosuggestions.zsh"
fi

if [[ -r "${HOMEBREW_PREFIX:-/opt/homebrew}/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" ]]; then
  source "${HOMEBREW_PREFIX:-/opt/homebrew}/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
fi
