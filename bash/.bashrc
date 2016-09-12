export DOTFILES="/home/jake/.dotfiles"

source $DOTFILES/bash/boilerplate.sh
source $DOTFILES/bash/catfish.sh
source $DOTFILES/bash/javascript.sh


# Load Programs
export NVM_DIR="/home/jake/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # Load on ubuntu

eval $(thefuck --alias)

export PATH="/home/jake/.pyenv/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"


# Export some variables
export ANDROID_HOME=/opt/android-sdk

# Extend PATH
export PATH=${PATH}:${ANDROID_HOME}/tools
export PATH=${PATH}:${ANDROID_HOME}/platform-tools
export PATH=${PATH}:/opt/genymobile/genymotion
export PATH=/home/jake/.dotfiles/bin:${PATH}

# Export Java home on ubuntu
if [ -f "$(command -v lsb_release)" ]; then
  JAVA_HOME=/usr/local/java/jdk1.8.0_73
  export PATH=${PATH}:$JAVA_HOME/bin
fi


# bash aliases
alias src="source ~/.bashrc"
alias refresh="cd $PWD > /dev/null"
alias c="clear"
alias yolo="yaourt -Syau"
export EDITOR=/bin/nano

# git aliases
alias gs="git status"
alias gd="git diff"
gh() {
  if [ $# -eq 1 ]; then
    command git clone git@github.com:RealOrangeOne/${1}
  else
    command git clone git@github.com:${1}/${2}
  fi
}


# Gnome
gd-lock() {
  sessionid=`/bin/loginctl list-sessions | grep jake | awk '{print $1}'`
  /bin/loginctl lock-session $sessionid
}
gd-unlock() {
  sessionid=`/bin/loginctl list-sessions | grep jake | awk '{print $1}'`
  /bin/loginctl unlock-session $sessionid
}
alias gdl="gd-lock"
alias gdu="gd-unlock"


# miscellaneous software aliases
alias y="yoga"
alias ym="yoga mode"
alias serve="python2 -m SimpleHTTPServer"
alias make-dotfiles="cd ~/.dotfiles/ && make && cd - > /dev/null"
alias edit-dotfiles="atom ~/.dotfiles/"
alias please="sudo"
