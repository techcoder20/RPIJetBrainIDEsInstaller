#!/bin/bash

#Defining Variables
downloadlink=https://download-cf.jetbrains.com/webide/PhpStorm-2020.3.1.tar.gz
name=phpstorm

#Installing Dependencies
sudo apt -y install python-pip openjdk-11-jdk

#Removing if PhpStorm-2020.3.1.tar.gz already downloaded
rm $name.tar.gz

#Removing PhpStorm-2020.3.1 if already extracted
sudo rm -r /opt/$name

#Downloading PhpStorm-2020.3.1.tar.gz
wget $downloadlink -O $name.tar.gz

#Extracting PhpStorm-2020.3.1.tar.gz
sudo mkdir /opt/$name
sudo tar xvzf $name.tar.gz -C /opt/$name
sudo mv /opt/$name/*/* /opt/$name/

#Deleting PhpStorm-2020.3.1.tar.gz
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
