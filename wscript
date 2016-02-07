#!/usr/bin/env python3
import json, os, shutil

DIR = os.getcwd()

def update_and_upgrade(ctx):
    os.system('apt-get update -y')
    os.system('apt-get upgrade -y')
    os.system('apt-get dist-upgrade -y')


def apt_install_core(ctx):
    packages = json.load(open(DIR + '/apt/apt-installs-core.json'))
    for package in packages:
        os.system("apt-get install {} -y".format(package))


def add_apt_keys(ctx):
    keys = json.load(open(DIR + '/apt/apt-keys.json'))
    for key in keys:
        os.system("wget -O - {} | apt-key add -".format(key))


def add_apt_sources(ctx):
    os.system('apt/add-apt-sources.sh')


def add_apt_repos(ctx):
    repos = json.load(open(DIR + '/apt/apt-repos.json'))
    for repo in repos:
        os.system("add-apt-repository {} -y".format(repo))


def apt_install_extras(ctx):
    packages = json.load(open(DIR + '/apt/apt-installs-extra.json'))
    for package in packages:
        os.system("apt-get install {} -y".format(package))


def run_custom_installs(ctx):
    os.system('apt/custom-installs.sh')


def install_atom_packages(ctx):
    packages = json.load(open(DIR + '/atom/packages.json'))
    packages = " ".join(packages)
    os.system("apm install {}".format(packages))


def install_configs(ctx):
    shutil.copyfile(DIR + "/config/terminator.conf", "~/.config/terminator/config")


if __name__ == '__main__':
    print("Please run this file using waf, not directly.")
    exit(1)
