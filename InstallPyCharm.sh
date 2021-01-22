#!/bin/bash

#Defining Variables
downloadlink=https://download-cf.jetbrains.com/python/pycharm-community-2020.3.2.tar.gz
name=pycharm

#Installing Dependencies
sudo apt -y install python-pip openjdk-11-jdk

#Removing if pycharm-community-2020.3.2.tar.gz already downloaded
rm $name.tar.gz

#Removing pycharm-community-2020.3.2 if already extracted
sudo rm -r /opt/$name

#Downloading pycharm-community-2020.3.2.tar.gz
wget $downloadlink -O $name.tar.gz

#Extracting pycharm-community-2020.3.2.tar.gz
sudo mkdir /opt/$name
sudo tar xvzf $name.tar.gz -C /opt/$name
sudo mv /opt/$name/*/* /opt/$name/

#Deleting pycharm-community-2020.3.2.tar.gz
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
