#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Start tmux on every shell login
[[ -z "$TMUX" ]] && exec tmux

# Prompt setup
PS1='[\W]\$ '

# Load aliases
. ~/.bash_aliases
