# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# prevent fork error in spring (ruby)
export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="agnoster" # set by `omz`

plugins=(git kubectl fzf)

FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"

source $ZSH/oh-my-zsh.sh
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# fzf cli integration
source <(fzf --zsh)


# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
alias zshconfig="nvim ~/.zshrc"
alias ohmyzsh="nvim ~/.oh-my-zsh"
alias vimrc="nvim ~/.config/nvim/lua/user/init.lua"
alias vimplugins="nvim ~/.config/nvim/lua/user/plugins/user.lua"
alias reload="source ~/.zshrc"
alias vimf='nvim $(fzf -m --preview="bat --color=always {}")'


### work/job specific configs
source ~/dotfiles/secrets/**


#export PATH="/opt/homebrew/opt/ruby/bin:$PATH"
export PATH="/Users/daniloamoroso/bin:$PATH"
export PATH="/Users/daniloamoroso/workspace/scripts:$PATH"
export PATH="/opt/homebrew/opt/ruby@3.1/bin:$PATH"
export PATH="/Applications/RubyMine.app/Contents/MacOS:$PATH"
export PATH="/Users/daniloamoroso/.cargo/bin:$PATH"

# remove username and host from prompt 
prompt_context() {}

# pnpm
export PNPM_HOME="/Users/daniloamoroso/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

#[ -f "/Users/daniloamoroso/.ghcup/env" ] && source "/Users/daniloamoroso/.ghcup/env" # ghcup-env


# Updates PATH for the Google Cloud SDK.
if [ -f '~/workspace/google-cloud-sdk/path.zsh.inc' ]; then . '~/workspace/google-cloud-sdk/path.zsh.inc'; fi

# Enables shell command completion for gcloud.
if [ -f '~/workspace/google-cloud-sdk/completion.zsh.inc' ]; then . '~/workspace/google-cloud-sdk/completion.zsh.inc'; fi

# direnv hook
eval "$(direnv hook zsh)"

# zoxide
eval "$(zoxide init zsh)"


### HISTORY CONFIGURTIONS
HISTFILE="$HOME/.zsh_history"
# Display timestamps for each command
HIST_STAMPS="yyyy-mm-dd"

HISTSIZE=1000000
SAVEHIST=1000000

# Ignore these commands in history
HISTORY_IGNORE="(ls|pwd|cd)*"

# Write the history file in the ':start:elapsed;command' format.
setopt EXTENDED_HISTORY

# Do not record an event starting with a space.
setopt HIST_IGNORE_SPACE

# Don't store history commands
setopt HIST_NO_STORE

#oh my posh prompt
if [ "$TERM_PROGRAM" != "Apple_Terminal" ]; then
  eval "$(oh-my-posh init zsh --config ~/dotfiles/oh-my-posh.toml)"
fi

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
