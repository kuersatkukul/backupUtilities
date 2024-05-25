#!/usr/bin/bash
# Use this script to install vim(athena)
# The script automatically handles most common features needed
# Use sudo command to run script so installation can take place
# If you dont want to be asked for installation permissions pass
# flag -y to script

if [ "$EUID" -ne 0 ]; then 
	echo "You have to run the script as root user. If not there is no installation of vim possible!"
	echo "./install_setup_vim.sh [option]"
	echo "Options:"
	echo "-y: no asking for permission to install, straight installing vim (recommended)"
	exit
fi

yFlag=$1
if [ ! -z "$yFlag" ] && [ "$yFlag" == "-y" ]; then
	echo ""
	echo "Found flag -y. Script will install vim without user interaction."
	apt-get install vim $yFlag
else
	apt-get install vim
fi

# To this location we'll copy the gruvbox theme
colorsLocation="/usr/share/vim/vim91/colors"
gruvboxthemeLocation="$(pwd)/colors/gruvbox.vim"

# To this location we want to copy/override the vimrc file
vimrcLocation="/etc/vim"
vimrcFile="$(pwd)/vimrc"

if [[ -d $colorsLocation ]]; then
	echo ""
	echo "Checking $colorsLocation... Directory exists"
	echo "copying $gruvboxthemeLocation to $colorsLocation/gruvbox.vim"
	cp $gruvboxthemeLocation $colorsLocation -v
else
	echo ""
	echo "Cant seem to find colors directory, cant copy gruvbox"
	echo "Supposed location of color directory: $colorsLocation"
	echo "Gruvbox theme location: $gruvboxthemeLocation"
fi

if [[ -d $vimrcLocation ]]; then
	echo ""
	echo "Cheking $vimrcLocation... Directory exists"
	echo "copying $vimrcFile to $vimrcLocaiton/vimrc"
	cp $vimrcFile $vimrcLocation -v
else
	echo ""
	echo "Cant seem to find path $vimrcLocation, cant copy vimrc file"
	echo "Supposed location to copy vimrc file to $vimrcLocation/vimrc"
fi
