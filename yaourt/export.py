#!/usr/bin/env python3
import os, json

os.system('sudo yaourt -Syau')

packages = " ".join(json.load(open('packages.json')))
print("sudo yaourt -S {} ".format(packages))
