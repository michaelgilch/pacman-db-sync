#!/bin/bash
# 
# pacman-db-sync.sh
#
# Updates ArchLinux mirrors and syncs the database.
#
# Only pulls https mirrors in US and ranks them.
#
# Michael Gilchrist (michaelgilch@gmail.com)

curl -s "https://www.archlinux.org/mirrorlist/?country=US&protocol=https" > /tmp/mirrorlist
sed -i 's/^#//' /tmp/mirrorlist
rankmirrors /tmp/mirrorlist > /etc/pacman.d/mirrorlist
rm /tmp/mirrorlist

pacman -Sy

