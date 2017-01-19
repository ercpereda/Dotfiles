#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Prompt setup
PS1='[\W]\$ '

# Load aliases
. ~/.bash_aliases

# Load NVM
export NVM_DIR="/usr/local/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

# Add ~/bin folder to PATH
export PATH="$PATH:$HOME/bin"

# Add RVM to PATH for scripting
export PATH="$PATH:$HOME/.rvm/bin"

### git aware prompt
export GITAWAREPROMPT=~/.bash/git-aware-prompt
source  "${GITAWAREPROMPT}/main.sh"
export PS1="\[\033[01;34m\][\W]\[\033[00m\] \[$txtcyn\]\$git_branch\[$txtred\]\$git_dirty\[$txtrst\]\$ "

### git completion
. /etc/bash_completion.d/git-completion.bash
