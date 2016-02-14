#!/usr/bin/env python3
import json, os, shutil


DIR = os.getcwd()
HOME = os.path.expanduser('~')


def _get_json(path):
    return json.load(open(DIR + path))


def update():
    os.system('sudo apt-get update -y')


def apt_upgrade():
    os.system('sudo apt-get upgrade -y')
    os.system('sudo apt-get dist-upgrade -y')


def apt_install_core():
    packages = " ".join(_get_json('/apt/apt-installs-core.json'))
    os.system("sudo apt-get install {} -y".format(packages))


def add_apt_keys():
    for key in _get_json('/apt/apt-keys.json'):
        os.system("wget -O - {} | sudo apt-key add -".format(key))


def add_apt_sources():
    os.system('sudo apt/add-apt-sources.sh')


def add_apt_repos():
    for repo in _get_json('/apt/apt-repos.json'):
        os.system("sudo add-apt-repository {} -y".format(repo))


def apt_install_extras():
    packages = " ".join(_get_json('/apt/apt-installs-extra.json'))
    os.system("sudo apt-get install {} -y".format(packages))


def run_custom_installs():
    os.system('apt/custom-installs.sh')


def install_atom_packages():
    packages = " ".join(_get_json('/atom/packages.json'))
    os.system("apm install {}".format(packages))


def export_atom_config():
    os.makedirs("~/.atom", exist_ok=True)
    os.system("cp -R atom/* ~/.atom/")


def install_configs():
    os.makedirs("~/.config/terminator/", exist_ok=True)
    shutil.copyfile(os.path.join(DIR, "config/terminator.conf"), os.path.expanduser("~/.config/terminator/config"))
    shutil.copyfile(os.path.join(DIR, "bash/.bash_aliases"), os.path.expanduser("~/.bash_aliases"))


def source():
    os.system(". ~/.bashrc")


if __name__ == '__main__':
    print("Please run this file using the install script, not directly.")
    exit(1)
