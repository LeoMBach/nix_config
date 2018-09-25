# Add user bin folder
if [[ -d $HOME/.bin && ":$PATH:" != *:"$HOME/.bin":* ]]; then
    PATH=$HOME/.bin:$PATH
fi

# Immediately return if shell session is non-interactive
[ -z "$PS1" ] && return

# Enable bash completion
if [ -f /etc/bach_completion ]; then
    . /etc/bash_completion
fi

###############
# Environment #
###############
export EDITOR=nvim
export TERM=xterm-256color # Needed for tmux

###################
# bash-git-prompt #
###################
GIT_PROMPT_ONLY_IN_REPO=1
. ~/.bash-git-prompt/gitprompt.sh

###########
# Aliases #
###########

alias ls="ls --color=auto"
alias la="ls -a"
alias ll="ls -lh"
alias lla="ls -lha"
alias grep="grep --color"

##########
# Colors #
##########
export bblue="\[\033[0;38;5;12m\]"
export black="\[\033[0;38;5;0m\]"
export blue="\[\033[0;38;5;4m\]"
export coldblue="\[\033[0;38;5;33m\]"
export cyan="\[\033[0;38;5;6m\]"
export green="\[\033[0;38;5;2m\]"
export iceblue="\[\033[0;38;5;45m\]"
export magenta="\[\033[0;38;5;55m\]"
export orange="\[\033[0;38;5;130m\]"
export red="\[\033[0;38;5;1m\]"
export smoothblue="\[\033[0;38;5;111m\]"
export smoothgreen="\[\033[0;38;5;42m\]"
export turqoise="\[\033[0;38;5;50m\]"
export white="\[\033[0;38;5;7m\]"
export yellow="\[\033[0;38;5;3m\]"

###########
# General #
###########

# Make things prettier
force_color_prompt=yes

# Max chars to display in directory string
DIR_STR_WIDTH=20

# Typos, begone!
shopt -s cdspell

# Check windows size after each command and update, if necessary
shopt -s checkwinsize

###########
# History #
###########

# Big ol' history file
HISTSIZE=10000
HISTFILESIZE=200000

# Append to history instead of overwriting
shopt -s histappend

# Ignore useless history commands
HISTIGNORE="ls:exit:reset:clear"

# Ignore duplicates and spaces in history
HISTCONTROL=ignoreboth

#############
# Functions #
#############

function up() {
    for i in `seq 1 $1`;
    do
        cd ../
    done;
}
