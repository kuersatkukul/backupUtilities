#!/usr/bin/bash

# **********************************************************************
# This script can be used as a basic installation of LaTeX to use with 
# texmaker. It sets up an installation of LaTeX with every needed 
# dependency and german language packages.
#
# After the installation it sets up a default latex document to the location
# given with argv[1]
# **********************************************************************

# With the very first command many dependencies are automatically installed
# there is the need for bibtex-extra seperately

# Check if given location can be used to install default latex document
saveLocation="$1"
if [[ -d $saveLocation ]]; then
	echo "$saveLocation exists and is being used as Location..."
else
	if mkdir $saveLocation
	then
		echo "Created Location $saveLocation"
	else
		echo "Path invalid. Choose another path. Exiting..."
		exit -1
	fi
fi

# Install LaTeX and TeXMaker
#sudo apt install texmaker texlive-bibtex-extra texlive-lang-german -y


# Copy content to location wanted
if [ ${saveLocation: -1} == "/" ]; then
	mkdir ${saveLocation}defaultLatexSetup 
	cp -r graphics/ ${saveLocation}defaultLatexSetup -v
	cp -r latex/ ${saveLocation}defaultLatexSetup -v
else
	mkdir ${saveLocation}/defaultLatexSetup 
	cp -r latex/ $saveLocation/defaultLatexSetup -v
	cp -r graphics/ $saveLocation/defaultLatexSetup -v
fi
