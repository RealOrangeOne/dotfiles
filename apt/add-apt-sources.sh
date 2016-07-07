#!/usr/bin/env bash

HCLINE="deb http://downloads.hipchat.com/linux/apt stable main"
HCFILE=/etc/apt/sources.list.d/atlassian-hipchat.list

ILINE="deb http://apt.insynchq.com/ubuntu wily non-free contrib"
IFILE=/etc/apt/sources.list.d/atlassian-hipchat.list

VLINE="deb http://download.virtualbox.org/virtualbox/debian wily contrib"
VFILE=/etc/apt/sources.list.d/virtualbox.list

OCLINE="deb http://download.opensuse.org/repositories/isv:/ownCloud:/desktop/xUbuntu_15.10/ /"
OCFILE=/etc/apt/sources.list.d/owncloud-client.list


echo ">> Removing old files..."
rm -rf $HCFILE $IFILE $VFILE $OCFILE
touch $HCFILE $IFILE $VFILE $OCFILE

echo "Adding new sources..."
echo "$HCLINE" >> "$HCFILE"
echo "$ILINE" >> "$IFILE"
echo "$VLINE" >> "$VFILE"
echo "$OCLINE" >> "$OCFILE"
