eval $(thefuck --alias)
eval "$(pazi init zsh)"

# git aliases
alias gs="git status"
alias gd="git diff"
alias git-root='cd $(git root)'

gh() {
  if [ $# -eq 1 ]; then
    command git clone git@github.com:RealOrangeOne/${1} --recursive && cd ${1}
  else
    command git clone git@github.com:${1}/${2} --recursive && cd ${2}
  fi
}

git-cleanup() {
  command git checkout master
  command git branch --merged | grep -v '*' | xargs -n 1 git branch -D
  command git branch -vv | awk '/: gone]/{print $1}' | xargs git branch -D
  command git remote prune origin
  command git checkout -
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

# miscellaneous software aliases
alias serve="/usr/bin/python3 -m http.server"
alias regen-ssh-conf="assh config build > ~/.ssh/config"
alias clip="xclip -selection clipboard"
alias cl="climate"
alias tmux-cleanup="tmux list-sessions | grep -v attached | cut -d: -f1 |  xargs -t -n1 tmux kill-session -t"
alias lock-screen="xdotool key 'Super_L+l'"
alias mux="tmuxinator start"
