#!/usr/bin/env python3
import json, os

# Update currently installed packages
os.system('sudo apt-get update -y')
os.system('sudo apt-get upgrade -y')
os.system('sudo apt-get dist-upgrade -y')

# Install packages in pre-installed repos
packages = " ".join(json.load(open('apt-installs-core.json')))
os.system("sudo apt-get install {} -y".format(packages))

# Add keys for extra apt repos
for key in json.load(open('apt-keys.json')):
    os.system("wget -O - {} | sudo apt-key add -".format(key))

# Add extra repos by url
os.system('sudo apt/add-apt-sources.sh')

# Add extra urls by PPA
for repo in json.load(open('apt-repos.json')):
    os.system("sudo add-apt-repository {} -y".format(repo))

# Get package info from new repos
os.system('sudo apt-get update -y')

# Install extra packages from new repos
packages = " ".join(json.load(open('apt-installs-extra.json')))
os.system("sudo apt-get install {} -y".format(packages))

# Install packages with non-standard install
os.system('apt/custom-installs.sh')
