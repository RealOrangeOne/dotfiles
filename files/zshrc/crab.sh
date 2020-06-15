alias ctpt="NO_MIGRATIONS=true IN_TEST=true FILE_STORAGE='django.core.files.storage.FileSystemStorage' crab manage.py test $@ --keepdb"

export ENV_FILE=etc/environments/development/env,.env
export PROC_FILE=etc/environments/development/procfile
export BIN_DIRS=env/bin
