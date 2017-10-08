# If not running interactively, don't do anything
case $- in
  *i*) ;;
  *) return;;
esac

# Export some variables
export ANDROID_HOME=/opt/android-sdk
export EDITOR=/bin/nano
export TIMEFMT=$'\nreal\t%E\nuser\t%U\nsys\t%S'
export DOTFILES=~/.dotfiles

# Extend path
export PATH=${PATH}:${ANDROID_HOME}/tools
export PATH=${PATH}:${ANDROID_HOME}/platform-tools
export PATH=${PATH}:/opt/genymobile/genymotion
export PATH=${PATH}:${HOME}/.bin

# bash aliases
alias refresh="cd $PWD > /dev/null"
alias c="clear"
alias e="exit"
alias no="yes n"
alias open="xdg-open"
alias browse "xdg-open ."

# colourify things!
alias ls='ls --color=auto'
alias grep='grep --color=auto'

alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# don't put duplicate lines or lines starting with space in the history.
HISTCONTROL=ignoreboth
