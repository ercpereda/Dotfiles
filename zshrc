# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Fix issue with bash_autocomplete
autoload -U +X bashcompinit && bashcompinit
autoload -U +X compinit && compinit

# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH

# Setup tmux color config
export TERM="xterm-256color"

# Path to your oh-my-zsh installation.
export ZSH="/Users/ecruz/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  docker
  virtualenv
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set alias

## Load external alias file.
source $HOME/scripts/alias.sh

## Define alias
alias vim="/usr/local/Cellar/vim/8.1.2150/bin/vim"
alias vi='vim'
alias psu='ps -x'
alias ll='ls -lart'
alias grep='grep --color -E'
alias magit='vim -c MagitOnly'
alias dc='docker-compose'

# Load utils functions
source $HOME/scripts/functions.sh

# Setup asdf-vm
. $HOME/.asdf/asdf.sh
. $HOME/.asdf/completions/asdf.bash

# Setup python
export PATH=$HOME/Library/Python/3.7/bin:$PATH

# Setup golang
export PATH=/usr/local/go/bin:$PATH


# Setup alaya-dev-cli
export PATH=$HOME/alaya-cli/bin:$PATH

# Alaya profile
if [ -f $HOME/.alaya/.alaya_profile ]; then source $HOME/.alaya/.alaya_profile; fi

# Setup go
export GOPATH=$(go env GOPATH)
export PATH=$GOPATH/bin:$PATH

# Load secret variables
if [ -f $HOME/.secrets ]; then source $HOME/.secrets; fi

# Kubernetes
if command -v kubectl &> /dev/null; then source <(kubectl completion zsh); fi
if command -v minikube &> /dev/null; then source <(minikube completion zsh); fi
if command -v helm &> /dev/null; then source <(helm completion zsh); fi
if command -v flux &> /dev/null; then source <(flux completion zsh); fi
if command -v kind &> /dev/null; then source <(kind completion zsh); fi
source "/usr/local/opt/kube-ps1/share/kube-ps1.sh"
KUBE_PS1_PREFIX=''
KUBE_PS1_SUFFIX=''
KUBE_PS1_SEPARATOR=''
KUBE_PS1_BG_COLOR=''
KUBE_PS1_SYMBOL_COLOR='black'
KUBE_PS1_CTX_COLOR='black'
KUBE_PS1_NS_COLOR='black'

# Fluxcd
export FLUX_FORWARD_NAMESPACE='fluxcd'

# GPG
export GPG_TTY=$(tty)

# GH
if [ /usr/local/bin/gh ]; then source <(gh completion -s zsh); fi
export PATH=$PATH:/Users/ecruz/devops-cli/bin

# Python Virtual Envs
export PYTHON_VENVS_DIR=$HOME/venvs

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
