#!/bin/bash

# This script:
# 1. Installs necessary packages
# 2. Clones projects from github and moves them to desired location
# 3. Installs GNOME shell extensions

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
ADWGTKVERDOT=$(curl -s https://api.github.com/repos/lassekongo83/adw-gtk3/releases/latest  \
| grep "tag_name" \
| awk '{print substr($2,2,length($2)-3)}') # EX: `"tag_name": "v3.3",` to `v3.3`
ADWGTKVERDASH="${ADWGTKVERDOT/"."/"-"}" # The releases are titled differently than the downloads, so replace "." with "-"
wget https://github.com/lassekongo83/adw-gtk3/releases/download/"$ADWGTKVERDOT"/adw-gtk3"$ADWGTKVERDASH".tar.xz

tar -xf adw-gtk3"$ADWGTKVER".tar.xz
mkdir -p .local/share/themes
mv adw-gtk3 .local/share/themes
mv adw-gtk3-dark .local/share/themes

# 3.
EXTENSIONS=[
	"Espresso",
	"Just Perfection",
	"Gesture Improvements",
	"Clipboard History"
]
