# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
ZSH_CUSTOM="$HOME/dotfiles/oh-my-zsh/custom"

ZSH_THEME="typewritten"

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

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
)

source $ZSH/oh-my-zsh.sh

# User configuration

export PATH="$HOME/dotfiles/bin:$PATH"
export PATH="$HOME/bin:$PATH"

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='mvim'
fi

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

if [ -f  ~/.zsh_aliases ]; then
. ~/.zsh_aliases
fi

if [ -f  ~/.zsh_keybindings ]; then
. ~/.zsh_keybindings
fi

export PATH=$PATH:$HOME/.magento-cloud/bin
export PATH="/usr/local:$PATH"

# MAC OS specific (for making dircolors work)
export PATH="/opt/homebrew/opt/coreutils/libexec/gnubin:$PATH"

# changes color and removes green bg for directories on ls
LS_COLORS="ow=01;36;40" && export LS_COLORS

if [[ -f ~/.dircolors ]] ; then
    eval $(dircolors -b ~/.dircolors)     
elif [[ -f /etc/DIR_COLORS ]] ; then
    eval $(dircolors -b /etc/DIR_COLORS)
fi

# prompt_context() {
#  if [[ "$USER" != "$DEFAULT_USER" || -n "$SSH_CLIENT" ]]; then
#    prompt_segment black default "%(!.%{%F{yellow}%}.)$USER"
#  fi
#}

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

function show_node_version {
  local dir="$PWD"
  local light_green="%{$fg[green]%}" # This sets the color to light green
  local reset_color="%{$reset_color%}" # This resets the color back to the default

  while [ "$dir" != "/" ]; do
    if [[ -f "$dir/package.json" ]]; then
      local node_version=$(node -v)
      echo "${light_green}⬢ $node_version${reset_color}"
      return
    fi
    dir="$(dirname "$dir")"
  done
}


export TYPEWRITTEN_RIGHT_PROMPT_PREFIX_FUNCTION=show_node_version

# Run tmux by default
_not_inside_tmux() { [[ -z "$TMUX" ]] }

ensure_tmux_is_running() {
 if _not_inside_tmux; then
  tat
 fi
}

ensure_tmux_is_running
