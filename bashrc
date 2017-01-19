#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Prompt setup
PS1='[\W]\$ '

# Load aliases
. ~/.bash_aliases

# Load RVM
export PATH="$PATH:$HOME/.rvm/bin"
[ -s "$HOME/.rvm/scripts/rvm" ] && \. "$HOME/.rvm/scripts/rvm"

# Load NVM
export NVM_DIR="/usr/local/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

# Add ~/bin folder to PATH
export PATH="$PATH:$HOME/bin"
