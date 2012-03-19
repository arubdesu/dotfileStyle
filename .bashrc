#!/bin/bash
# customize bash environment, with tips from @rtomayko and @nigelkersten
# Allister Banks 17 March 2012
# initial git commit

alias status='git status'
alias minish='ssh aru@10.0.111.11'

export PROMPT_COMMAND="history -n; history -a"
export HISTTIMEFORMAT='%F %T '
export HISTCONTROL=erasedups
export HISTSIZE=50000
export HISTIGNORE=”pwd:exit:history:”
shopt -s histappend

alias dev="/Users/318admin/Documents/dev"

complete -cf sudo

function parse_git_branch {
  ref=$(git symbolic-ref HEAD 2> /dev/null) || return
  echo "("${ref#refs/heads/}")"
}

PROMPT_COMMAND='echo -e "\033];$(hostname -s)\007"'

PS1="\T \d \W \u \$(parse_git_branch)\$"

alias status='git status'
alias minish='ssh aru@10.0.111.11'

export PROMPT_COMMAND="history -n; history -a"
export HISTTIMEFORMAT='%F %T '
export HISTCONTROL=erasedups
export HISTSIZE=50000
export HISTIGNORE=”pwd:exit:history:”
shopt -s histappend

alias dev="/Users/318admin/Documents/dev"

complete -cf sudo

function parse_git_branch {
  ref=$(git symbolic-ref HEAD 2> /dev/null) || return
  echo "("${ref#refs/heads/}")"
}

PROMPT_COMMAND='echo -e "\033];$(hostname -s)\007"'

PS1="\W \u \$(parse_git_branch)\$" 


# Does this stuff work?
# lets find the logged in user
: ${LOGNAME=$(id -un)}
# complete hostnames from this file
: ${HOSTFILE=~/.ssh/known_hosts}
# OMG colors
RED="\[\033[0;31m\]"
BROWN="\[\033[0;33m\]"
GREY="\[\033[0;97m\]"
BLUE="\[\033[0;34m\]"
PS_CLEAR="\[\033[0m\]"
SCREEN_ESC="\[\033k\033\134\]"

if [ "$LOGNAME" = "root" ]; then
    COLOR1="${RED}"
    COLOR2="${BROWN}"
    P="#"
#elif hostname | grep -q 'github\.com'; then
#    GITHUB=yep
#    COLOR1="\[\e[0;94m\]"
#    COLOR2="\[\e[0;92m\]"
#    P="\$"
else
    COLOR1="${BLUE}"
    COLOR2="${BROWN}"
    P="\$"
fi
