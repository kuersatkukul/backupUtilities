#!/usr/bin/bash

if [ "$EUID" -ne 0 ]; then 
	echo "You have to run the script as root user. If not there is no installation of terminator possible!"
	echo "./install_setup_terminator.sh [option] [home Dir Path]"
	echo "Options:"
	echo "-y: no asking for permission to install, straight installing (recommended)"
	echo "Example: ./install_setup_terminator.sh -y /home/kk"
	exit
fi

yFlag=$1
if [ ! -z "$yFlag" ] && [ "$yFlag" == "-y" ]; then
	echo "\n"
	echo "Found flag -y. Script will install terminator without user interaction."
	apt-get install terminator $yFlag
else
	apt-get install terminator
fi

userHomeDir=$2
if [ -z "$userHomeDir" ]
then
	echo "You have to pass home directory as an argument becuase the config file has to be copied to the home directory"
	echo "Example: ./install_setup_terminator.sh -y /home/kk"
	exit
else
	if [ ! -d "$userHomeDir" ]
	then
		echo "$userHomeDir is not valid, it has to be valid to work!"
		exit
	fi
fi

terminatorConfig="$(pwd)/config"
configDest="$userHomeDir/.config/terminator"

if [[ -d $configDest ]]; then
	echo ""
	echo "Checking $configDest... Directory exists"
	echo "copying $terminatorConfig to $configDest/config"
	cp $terminatorConfig $configDest -v
else
	echo ""
	echo "Cant seem to find directory, cant copy terminator config"
	echo "Supposed location of terminator config directory: $configDest"
	echo "Config file location: $terminatorConfig"
fi
