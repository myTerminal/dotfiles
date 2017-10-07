#!/bin/bash

# Add RPM Fusion repos
sudo dnf install \
     https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm \
     https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

# Update installed packages
sudo dnf update

# Install google-chrome web-browser
sudo dnf install https://dl.google.com/linux/direct/google-chrome-stable_current_x86_64.rpm

# Install packages
sudo dnf install \
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
sudo gpasswd -a $USER docker
sudo service docker restart
