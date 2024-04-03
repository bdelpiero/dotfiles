# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
ZSH_CUSTOM="$HOME/dotfiles/oh-my-zsh/custom"

# ZSH_THEME="typewritten"

# Custom plugins may be added to $ZSH_CUSTOM/plugins/
plugins=(
  git
  zsh-syntax-highlighting
  zsh-autosuggestions
  tmux
  web-search
  history
  extract
  docker-compose
  z
  zsh-bat
)

source $ZSH/oh-my-zsh.sh

export PATH="$HOME/dotfiles/bin:$PATH"
export PATH="$HOME/bin:$PATH"

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='mvim'
fi

if [ -f  ~/.zsh_aliases ]; then
. ~/.zsh_aliases
fi

if [ -f  ~/.zsh_keybindings ]; then
. ~/.zsh_keybindings
fi

#TODO: fix this (ls colors, etc)
# MAC OS specific (for making dircolors work)
export PATH="/opt/homebrew/opt/coreutils/libexec/gnubin:$PATH"

# changes color and removes green bg for directories on ls
LS_COLORS="ow=01;36;40" && export LS_COLORS

if [[ -f ~/.dircolors ]] ; then
    eval $(dircolors -b ~/.dircolors)     
elif [[ -f /etc/DIR_COLORS ]] ; then
    eval $(dircolors -b /etc/DIR_COLORS)
fi

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Run tmux by default
_not_inside_tmux() { [[ -z "$TMUX" ]] }

ensure_tmux_is_running() {
 if _not_inside_tmux; then
  tat
 fi
}

ensure_tmux_is_running

source /Users/bruno/.docker/init-zsh.sh || true # Added by Docker Desktop

export STARSHIP_CONFIG=~/dotfiles/config/starship.toml
eval "$(starship init zsh)"
