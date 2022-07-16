#!/bin/bash

# This script:
# 1. Installs necessary packages
# 2. Clones projects from github and moves them to desired location

if [ "$EUID" -ne 0 ]
	then echo "Root is required."
	exit
fi

# 1.
sudo apt install -y gnome-session micro gnome-shell-extensions

# 2.

# Firefox GNOME theme
curl -s -o- https://raw.githubusercontent.com/rafaelmardojai/firefox-gnome-theme/master/scripts/install-by-curl.sh | bash

# adw-gtk3
ADWGTKVERDOT=$(curl -s https://api.github.com/repos/lassekongo83/adw-gtk3/releases/latest | grep "tag_name" | awk '{print substr($2,2,length($2)-3)}')
ADWGTKVER="${ADWGTKVERDOT/"."/"-"}"
wget https://github.com/lassekongo83/adw-gtk3/releases/download/"$ADWGTKVERDOT"/adw-gtk3"$ADWGTKVER".tar.xz