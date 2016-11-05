#!/bin/bash

# Install packages
sudo dnf install VirtualBox audacity vlc nodejs npm emacs git udisks youtube-dl gimp clementine libreoffice gparted docker.io i3 i3status i3lock feh pcmanfm shotwell openshot gource xbmc goldendict vokoscreen calibre terminology easytag key-mon levein-inconsolata-fonts liberation-mono-fonts google-droid-sans-mono-fonts google-roboto-mono-fonts

# Copy i3status.conf
sudo mv .scripts/resources/i3status.conf /etc/i3status.conf

# Set up group for docker
sudo groupadd docker
sudo gpasswd -a ${USERNAME} docker
sudo service docker restart

