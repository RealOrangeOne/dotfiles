source $DOTFILES/bash/catfish.sh
source $DOTFILES/bash/javascript.sh
source $DOTFILES/bash/applications.sh

if [ -f "$(command -v lsb_release)" ]; then
  source $DOTFILES/bash/ubuntu.sh  # Ubuntu only stuff
elif [ -f "$(command -v pacman)" ]; then
  source $DOTFILES/bash/arch.sh  # Arch only stuff
fi

# Export some variables
export ANDROID_HOME=/opt/android-sdk
export EDITOR=/bin/nano

# Extend path
export PATH=${PATH}:${ANDROID_HOME}/tools
export PATH=${PATH}:${ANDROID_HOME}/platform-tools
export PATH=${PATH}:/opt/genymobile/genymotion
export PATH=${HOME}/.dotfiles/bin:${PATH}

# bash aliases
alias refresh="cd $PWD > /dev/null"
alias c="clear"
alias cls="clear"
alias e="exit"
alias please="sudo"
alias no="yes n"

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# colourify things!
alias ls='ls --color=auto'
alias dir='dir --color=auto'
alias vdir='vdir --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"
