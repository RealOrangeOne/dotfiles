#!/usr/bin/env python3
import json, os

DIR = os.getcwd()

def apt_install_core(ctx):
    packages = json.load(open(DIR + '/apt/apt-installs-core.json'))
    for package in packages:
        print("apt-get install {} -y".format(package))


def add_apt_keys(ctx):
    keys = json.load(open(DIR + '/apt/apt-keys.json'))
    for key in keys:
        print("wget -O - {} | apt-key add -".format(key))


def add_apt_sources(ctx):
    os.system('apt/add-apt-sources.sh')


def add_apt_repos(ctx):
    repos = json.load(open(DIR + '/apt/apt-repos.json'))
    for repo in repos:
        print("add-apt-repository {} -y".format(repo))


def apt_install_extras(ctx):
    packages = json.load(open(DIR + '/apt/apt-installs-extra.json'))
    for package in packages:
        print("apt-get install {} -y".format(package))


if __name__ == '__main__':
    print("Please run this file using waf, not directly.")
    exit(1)
