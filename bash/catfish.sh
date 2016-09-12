
ctp() {
  if [[ $1 == "shell" ]]; then
    command ctf project run manage.py shell
  elif [[ $1 == "build" ]]; then
    command ctf project run build
  elif [ $1 == "test" ] || [ $1 == "t" ]; then
    command ctf project run -- runtests ${@:2}
  elif [[ $1 == "run" ]]; then
    command ctf project run -- ${@:2}
  elif [[ $1 == "manage" ]]; then
    command ctf project run -- manage.py ${@:2}
  elif [[ $1 == "migrate" ]]; then
    command ctf project run -- manage.py migrate ${@:2}
  elif [[ $1 == "makemigrations" ]]; then
    command ctf project run -- manage.py makemigrations ${@:2}
  elif [[ $1 == "route" ]]; then
    command ctf router ${PWD##*/}.ctf.sh --ident ${PWD##*/}:development:web
  else
    command ctf project $@
  fi
}

alias ctfs="cd ~/catfish && ./start && cd - > /dev/null"
