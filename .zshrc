export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME=""
source $ZSH/oh-my-zsh.sh

eval "$(starship init zsh)"

# Dotfiles management alias
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles --work-tree=$HOME'

# FZF fuzzy finder
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# bun completions
[ -s "/Users/carlosherrera/.bun/_bun" ] && source "/Users/carlosherrera/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
export LINEAR_API_KEY="lin_api_your_key_here"
alias lg='lazygit'
alias nv='nvim'
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"

# Zsh plugins from Homebrew. Keep syntax highlighting last.
if [[ -r "${HOMEBREW_PREFIX:-/opt/homebrew}/share/zsh-autosuggestions/zsh-autosuggestions.zsh" ]]; then
  source "${HOMEBREW_PREFIX:-/opt/homebrew}/share/zsh-autosuggestions/zsh-autosuggestions.zsh"
fi

if [[ -r "${HOMEBREW_PREFIX:-/opt/homebrew}/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" ]]; then
  source "${HOMEBREW_PREFIX:-/opt/homebrew}/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
fi
