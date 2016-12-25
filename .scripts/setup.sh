#!/bin/bash

# Add RPM Fusion repos
sudo dnf install \
     https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-25.noarch.rpm \
     https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-25.noarch.rpm

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
     gstreamer \
     transmission \
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

# Set up group for docker
sudo groupadd docker
sudo gpasswd -a ${USERNAME} docker
sudo service docker restart
