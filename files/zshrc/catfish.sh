alias ctpr="ctf project run --"

alias ctfs="cd ~/catfish && ./start && cd - > /dev/null"
alias ctpt="NO_MIGRATIONS=true IN_TEST=true FILE_STORAGE='django.core.files.storage.FileSystemStorage' ctpr manage.py test $@ --keepdb"

export CATFISH_HOSTNAME_OVERRIDE=localhost

# Crab
export ENV_FILE=etc/environments/development/env,.env
export PROC_FILE=etc/environments/development/procfile
export BIN_DIRS=env/bin
