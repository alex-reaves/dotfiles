#!/bin/bash

if [ "$EUID" -ne 0 ]
	then echo "Root is required."
	exit
fi

sudo ./install.sh && sudo ./configure.sh