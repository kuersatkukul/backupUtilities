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
if mkdir $1; then
	echo "Location is suitable for installation"
	rm -rf $1 > /dev/null
else
	echo "Choose another path. Exiting..."
	exit -1
fi

# Install LaTeX and TeXMaker
sudo apt install texmaker texlive-bibtex-extra texlive-lang-german -y

# Copy content to location wanted
cp graphics $1/defaultLatexSetup
cp latex $1/defaultLatexSetup
