#!/usr/bin/bash

# **********************************************************************
# This script installs conky with the necessary 3rd party software.
# It also adds a script to run on startup so the monitoring begins on 
# every startup
# **********************************************************************

sudo apt-get install conky-all lm-sensors -y
chmod +x ./.desktop
chmod +x ./conkystart.sh

# Create ~/.conky directory if it is not existing
if [[ -d "$HOME/.conky" ]]; then
	echo "$HOME/.conky Directory exists and is being used as location for conky config"
else
	mkdir "$HOME/.conky"
	echo "Created location $HOME/.conky"
fi

cp ./conkystart.sh "$HOME/.conky/"
cp ./conkyconfig "$HOME/.conky/"

# in ~/.config/autostart are programs listed for automatic start on bootup
cp ./.desktop $HOME/.config/autostart
sh $HOME/.conky/conkystart.sh
