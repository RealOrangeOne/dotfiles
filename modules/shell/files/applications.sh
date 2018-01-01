# Load Programs
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && source "$NVM_DIR/nvm.sh"

[ -d "$HOME/.nix-profile" ] && source "$HOME/.nix-profile/etc/profile.d/nix.sh"

eval $(thefuck --alias)

export PATH="$HOME/.pyenv/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

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

git-cleanup() {
    command git checkout master && git branch --merged | grep -v '*' | xargs -n 1 git branch -d
    command git gc --aggressive
}

alias t="tig"
alias ts="tig status"


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

# miscellaneous software aliases
alias serve="/usr/bin/python2 -m SimpleHTTPServer"
alias vi="vim"
alias regen-ssh-conf="assh config build > ~/.ssh/config"
alias yolo="yaourt -Syyau --noconfirm"
alias sc="screenshot --to img"

recreatedb() {
    dropdb $1 && createdb $1
}
