#!/bin/bash

# Update installed packages
sudo dnf update

# Install packages
sudo dnf install \
     google-chrome \
     i3 \
     i3status \
     i3lock \
     terminology \
     pcmanfm \
     emacs \
     git \
     npm \
     udisks \
     dropbox \
     gparted \
     libreoffice \
     VirtualBox \
     audacity \
     vlc \
     gimp \
     clementine \
     docker \
     gource \
     feh \
     shotwell \
     openshot \
     kodi \
     goldendict \
     vokoscreen \
     calibre \
     easytag \
     key-mon \
     youtube-dl \
     levien-inconsolata-fonts \
     liberation-mono-fonts \
     google-droid-sans-mono-fonts \
     google-roboto-mono-fonts

# Copy i3status.conf
sudo cp .scripts/resources/i3status.conf /etc/i3status.conf

# Set up group for docker
sudo groupadd docker
sudo gpasswd -a ${USERNAME} docker
sudo service docker restart
