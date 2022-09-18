#!/usr/bin/bash

# **********************************************************************
# This script installs conky with the necessary 3rd party software.
# It also adds a script to run on startup so the monitoring begins on 
# every startup
# **********************************************************************

sudo apt-get install conky-all lm-sensors -y

# Create ~/.conky directory if it is not existing
if [[ -d "$HOME/.conky" ]]; then
	echo "$HOME/.conky Directory exists and is being used as location for conky config"
else
	mkdir "$HOME/.conky"
	echo "Created location $HOME/.conky"
fi

chmod +x ./conkystart.sh
cp ./conkystart.sh "$HOME/.conky/"
cp ./conkyconfig "$HOME/.conky/"

# Write .desktop File (this is done because we actually need the path for Exec as
# as an absolute path $HOME does not work with autostart programs
echo "#programs which are started on bootup" > conkystarter.desktop
echo "[Desktop Entry]" >> conkystarter.desktop
echo "Type=Application" >> conkystarter.desktop
echo "Exec=sh $HOME/.conky/conkystart.sh" >> conkystarter.desktop
echo "Hidden=false" >> conkystarter.desktop
echo "NoDisplay=false" >> conkystarter.desktop
echo "X-GNOME-Autostart-enabled=true" >> conkystarter.desktop
echo "Name=Conky Autostart" >> conkystarter.desktop

chmod +x ./conkystarter.desktop

# in ~/.config/autostart are programs listed for automatic start on bootup
destDotFileLocation=$HOME/.config/autostart
if [[ -d $destDotFileLocation ]]; then
	echo ""
	echo "Checking $destDotFileLocation... Directory exists"
	cp $gruvboxthemeLocation $colorsLocation -v
else
	echo "$destDotFileLocation is being created..."
	mkdir $destDotFileLocation
fi
cp ./conkystarter.desktop $destDotFileLocation
sh $HOME/.conky/conkystart.sh
