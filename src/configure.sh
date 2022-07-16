#!/bin/bash

# This script:
# 1. {placeholder}

if [ "$EUID" -ne 0 ]
	then echo "Root is required."
	exit
fi

# Sets gdm to default theme
sudo update-alternatives --config gdm3-theme.gresource