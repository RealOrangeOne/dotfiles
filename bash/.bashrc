# If not running interactively, don't do anything
case $- in
  *i*) ;;
  *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
HISTCONTROL=ignoreboth
# append to the history file, don't overwrite it
shopt -s histappend
# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary, update the values of LINES and COLUMNS.
shopt -s checkwinsize

[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (debian-based only)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
  debian_chroot=$(cat /etc/debian_chroot)
fi

# Set prompt
PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
  PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
  ;;
*)
  ;;
esac

# enable color support
if [ -x /usr/bin/dircolors ]; then
  test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
  alias ls='ls --color=auto'
  alias dir='dir --color=auto'
  alias vdir='vdir --color=auto'
  alias grep='grep --color=auto'
  alias fgrep='fgrep --color=auto'
  alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# enable programmable completion features (you don't need to enable this, if it's already enabled in /etc/bash.bashrc and /etc/profile sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi



# Load Programs
export NVM_DIR="/home/jake/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # Load on ubuntu

eval $(thefuck --alias)

export PATH="~/.pyenv/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"


# Export some variables
export ANDROID_HOME=/opt/android-sdk

# Extend PATH
export PATH=${PATH}:${ANDROID_HOME}/tools
export PATH=${PATH}:${ANDROID_HOME}/platform-tools
export PATH=${PATH}:/opt/genymobile/genymotion
export PATH=~/.dotfiles/bin:${PATH}

# Export Java home on ubuntu
if [ -f "$(command -v lsb_release)" ]; then
  JAVA_HOME=/usr/local/java/jdk1.8.0_73
  export PATH=${PATH}:$JAVA_HOME/bin
fi


# npm aliases
alias ni="npm install"
alias ns="npm start"
alias nt="npm test"

nb() {
  if [ $# -eq 0 ]; then
    command npm run build
  else
    for arg in "$@"
    do
      command npm run build-${arg}
    done
  fi
}

nr() {
  for arg in "$@"
  do
    command npm run $arg
  done
}

alias nrc="npm run coverage"
alias nrm="npm run mocha"
alias nvmu="nvm use"

# React extras
export REACT_EDITOR=atom
alias rnl="adb logcat | grep ReactNative"


# catfish aliases
ctp() {
  if [[ $1 == "shell" ]]; then
    command ctf project run manage.py shell
  elif [[ $1 == "build" ]]; then
    command ctf project run build
  elif [ $1 == "test" ] || [ $1 == "t" ]; then
    command ctf project run runtests ${@:2}
  elif [[ $1 == "migrate" ]]; then
    command ctf project run manage.py migrate
  elif [[ $1 == "makemigrations" ]]; then
    command ctf project run manage.py makemigrations
  else
    command ctf project $@
  fi
}

alias ctfs="cd ~/catfish && ./start && cd - > /dev/null"


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
alias serve="python -m SimpleHTTPServer"
alias make-dotfiles="cd ~/.dotfiles/ && make && cd - > /dev/null"
alias edit-dotfiles="atom ~/.dotfiles/"
