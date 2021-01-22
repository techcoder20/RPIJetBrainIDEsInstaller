#!/bin/bash

#Defining Variables
downloadlink=https://download-cf.jetbrains.com/cpp/CLion-2020.3.1.tar.gz
name=clion

#Installing Dependencies
sudo apt -y install python-pip openjdk-11-jdk

#Removing if CLion-2020.3.1.tar.gz already downloaded
rm $name.tar.gz

#Removing CLion-2020.3.1 if already extracted
sudo rm -r /opt/$name

#Downloading CLion-2020.3.1.tar.gz
wget $downloadlink -O $name.tar.gz

#Extracting CLion-2020.3.1.tar.gz
sudo mkdir /opt/$name
sudo tar xvzf $name.tar.gz -C /opt/$name
sudo mv /opt/$name/*/* /opt/$name/

#Deleting CLion-2020.3.1.tar.gz
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
