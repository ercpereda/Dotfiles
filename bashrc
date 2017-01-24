#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Prompt setup
PS1='[\W]\$ '

# Load aliases
. ~/.bash_aliases

# Create VISUAL eviroment variable
export VISUAL='vim'

# Load RVM
export PATH="$PATH:$HOME/.rvm/bin"
[ -s "$HOME/.rvm/scripts/rvm" ] && \. "$HOME/.rvm/scripts/rvm"

# Load NVM
export NVM_DIR="/usr/local/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

# Add ~/bin folder to PATH
export PATH="$PATH:$HOME/bin"

# git aware prompt
export GITAWAREPROMPT=~/.bash/git-aware-prompt
source  "${GITAWAREPROMPT}/main.sh"
export PS1="\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\] \[$txtcyn\]\$git_branch\[$txtred\]\$git_dirty\[$txtrst\]\$ "

# git completion
. /usr/share/git/completion/git-completion.bash
#. /etc/bash_completion.d/git-completion.bash
