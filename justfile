export PATH := justfile_directory() + "/env/bin:" + env_var("PATH")

@default:
    just --list

setup:
    python -m venv env
    pip install -r dev-requirements.txt
    ansible-galaxy install -r galaxy-requirements.yml

deploy *ARGS:
    time ansible-playbook dotfiles.yml -K {{ ARGS }}

lint:
    yamllint -s .
    ansible-linkt -p
    ansible-playbook dotfiles.yml --syntax-check
