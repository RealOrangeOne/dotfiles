#!/usr/bin/env bash

echo "deb http://downloads.hipchat.com/linux/apt stable main" > /etc/apt/sources.list.d/atlassian-hipchat.list
echo "deb http://apt.insynchq.com/ubuntu wily non-free contrib" > /etc/apt/sources.list.d/insync.list
echo "deb http://download.virtualbox.org/virtualbox/debian wily contrib" > /etc/apt/sources.list.d/virtualbox.list
echo 'deb http://download.opensuse.org/repositories/isv:/ownCloud:/desktop/xUbuntu_15.10/ /' >> /etc/apt/sources.list.d/owncloud-client.list
