export DOTFILES="$HOME/.dotfiles"

source $DOTFILES/bash/boilerplate.sh
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
alias src="source ~/.bashrc"
alias refresh="cd $PWD > /dev/null"
alias c="clear"
alias cls="clear"
alias e="exit"
alias please="sudo"
alias no="yes n"
