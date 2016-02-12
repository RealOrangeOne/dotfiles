#!/usr/bin/env bash


if [ -a /etc/apt/sources.list.d/atlassian-hipchat.list ]; then
  echo "deb http://downloads.hipchat.com/linux/apt stable main" >> /etc/apt/sources.list.d/atlassian-hipchat.list
fi


if [ -a /etc/apt/sources.list.d/insync.list ]; then
  echo "deb http://apt.insynchq.com/ubuntu wily non-free contrib" >> /etc/apt/sources.list.d/insync.list
fi


if [ -a /etc/apt/sources.list.d/virtualbox.list ]; then
  echo "deb http://download.virtualbox.org/virtualbox/debian wily contrib" >> /etc/apt/sources.list.d/virtualbox.list
if


if [ -a /etc/apt/sources.list.d/owncloud-client.list ]; then
  echo 'deb http://download.opensuse.org/repositories/isv:/ownCloud:/desktop/xUbuntu_15.10/ /' >> /etc/apt/sources.list.d/owncloud-client.list
fi
