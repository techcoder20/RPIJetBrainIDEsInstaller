#!/bin/bash

#Defining Variables
downloadlink=https://download-cf.jetbrains.com/webstorm/WebStorm-2020.3.1.tar.gz
name=webstorm

#Installing Dependencies
sudo apt -y install python-pip openjdk-11-jdk

#Removing if WebStorm-2020.3.1.tar.gz already downloaded
rm $name.tar.gz

#Removing WebStorm-2020.3.1 if already extracted
sudo rm -r /opt/$name

#Downloading WebStorm-2020.3.1.tar.gz
wget $downloadlink -O $name.tar.gz

#Extracting WebStorm-2020.3.1.tar.gz
sudo mkdir /opt/$name
sudo tar xvzf $name.tar.gz -C /opt/$name
sudo mv /opt/$name/*/* /opt/$name/

#Deleting WebStorm-2020.3.1.tar.gz
rm $name.tar.gz

#Making file executable
sudo chmod +x /opt/$name/bin/$name.sh

echo "[Desktop Entry]
Type=Application
Name=$name
Icon=/opt/$name/bin/$name.svg
Exec=/opt/$name/bin/$name.sh %f
Categories=Development;IDE;
Terminal=false" > ~/.local/share/applications/$name.desktop
