alias ctpr="echo ctf project run --"  # shortcut helper for ctp

ctp() {
  if [[ $1 == "shell" ]]; then
    ctpr manage.py shell
  elif [[ $1 == "build" ]]; then
    ctpr build
  elif [ $1 == "test" ] || [ $1 == "t" ]; then
    ctpr runtests ${@:2}
  elif [[ $1 == "run" ]]; then
    ctpr ${@:2}
  elif [[ $1 == "manage" ]]; then
    ctpr manage.py ${@:2}
  elif [[ $1 == "migrate" ]]; then
    ctpr manage.py migrate ${@:2}
  elif [[ $1 == "makemigrations" ]]; then
    ctpr manage.py makemigrations ${@:2}
  elif [[ $1 == "route" ]]; then
    command ctf router ${PWD##*/}.ctf.sh --ident ${PWD##*/}:development:web
  else
    command ctf project $@
  fi
}

alias ctfs="cd ~/catfish && ./start && cd - > /dev/null"
