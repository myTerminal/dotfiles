#!/bin/bash

# Add RPM Fusion repos
sudo dnf install \
     https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm \
     https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

# Update installed packages
sudo dnf update

# Install google-chrome web-browser
sudo dnf install https://dl.google.com/linux/direct/google-chrome-stable_current_x86_64.rpm

# Install i3 and depdendencies
sudo dnf install \
     i3 \
     i3status \
     i3lock \
     feh

# Install essential packages
sudo dnf install \
     terminology \
     fish \
     emacs \
     pcmanfm \
     git \
     npm \
     udisks \
     gparted

# Install network packages
sudo dnf install \
     dropbox \
     filezilla \
     transmission \
     thunderbird \
     youtube-dl

# Install multimedia packages
sudo dnf install \
     gstreamer \
     vlc \
     clementine \
     audacity \
     gimp \
     shotwell \
     kodi \
     openshot \
     easytag

# Install gaming packages
sudo dnf install \
     steam

# Install screencast packages
sudo dnf install \
     vokoscreen \
     key-mon

# Install misc packages
sudo dnf install \
     libreoffice \
     VirtualBox \
     docker \
     goldendict \
     calibre

# Install crossover from URL
sudo dnf install http://crossover.codeweavers.com/redirect/crossover.rpm

# Install fonts
sudo dnf install \
     levien-inconsolata-fonts \
     liberation-mono-fonts \
     google-roboto-mono-fonts \
     google-droid-sans-mono-fonts

# Set up group for docker
sudo groupadd docker
sudo gpasswd -a $USER docker
sudo service docker restart

# Manual steps
# - Install hyper from https://releases.hyper.is/download/rpm
# - Install postman from https://www.getpostman.com/downloads
