#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Start tmux on every shell login
[[ -z "$TMUX" ]] && exec tmux

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '
