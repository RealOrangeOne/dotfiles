#!/usr/bin/env python3
import json, os

os.system('sudo apt-get update -y')
os.system('sudo apt-get upgrade -y')
os.system('sudo apt-get dist-upgrade -y')


packages = " ".join(json.load(open('apt-installs-core.json')))
os.system("sudo apt-get install {} -y".format(packages))

for key in json.load(open('apt-keys.json')):
    os.system("wget -O - {} | sudo apt-key add -".format(key))

os.system('sudo apt/add-apt-sources.sh')

for repo in json.load(open('apt-repos.json')):
    os.system("sudo add-apt-repository {} -y".format(repo))

os.system('sudo apt-get update -y')

packages = " ".join(json.load(open('apt-installs-extra.json')))
os.system("sudo apt-get install {} -y".format(packages))

os.system('apt/custom-installs.sh')
