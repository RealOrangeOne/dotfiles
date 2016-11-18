# Load Programs
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # load

eval $(thefuck --alias)

if [ -s "$HOME/.pyenv/bin/pyenv" ];
then
  export PATH="$HOME/.pyenv/bin:$PATH"
  eval "$(pyenv init -)"
  eval "$(pyenv virtualenv-init -)"
fi



# git aliases
alias gs="git status"
alias gd="git diff"
gh() {
  if [ $# -eq 1 ]; then
    command git clone git@github.com:RealOrangeOne/${1} && cd ${1}
  else
    command git clone git@github.com:${1}/${2} && cd ${2}
  fi
}


# Gnome
gd-lock() {
  sessionid=`loginctl list-sessions | grep $USER | awk '{print $1}'`
  loginctl lock-session $sessionid
}
gd-unlock() {
  sessionid=`loginctl list-sessions | grep $USER | awk '{print $1}'`
  loginctl unlock-session $sessionid
}
alias gdl="gd-lock"
alias gdu="gd-unlock"

alias y="yoga"
alias ym="yoga mode"


# miscellaneous software aliases
alias serve="python2 -m SimpleHTTPServer"
alias make-dotfiles="cd ~/.dotfiles/ && make && cd - > /dev/null"
alias edit-dotfiles="atom ~/.dotfiles/"
