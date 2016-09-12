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

# React-native extras
export REACT_EDITOR=atom
alias rnl="adb logcat | grep ReactNative"
