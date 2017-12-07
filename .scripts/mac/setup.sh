#!/bin/bash

# Enable showing of hidden files in finder
defaults write com.apple.Finder AppleShowAllFiles YES
killall Finder

# Install brew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Install cask
brew tap caskroom/cask

# Install packages from brew
brew install \
     node \
     youtube-dl

# Install essential packages from brew cask
brew cask install \
     emacs \
     google-chrome \
     iterm2 \
     mounty

# Install network packages from brew cask
brew cask install \
     dropbox \
     google-drive \
     megasync \
     filezilla \
     transmission \
     tunnelbear \
     telegram \
     evernote \
     discord \
     spotify

# Install multimedia packages from brew cask
brew cask install \
     vlc \
     clementine \
     gimp \
     handbrake \
     kid3

# Install gaming packages from brew cask
brew cask install \
     steam \
     origin

# Install screencast packages from brew cask
brew cask install \
     keycastr

# Install misc packages from brew cask
brew cask install \
     libreoffice \
     virtualbox \
     fish \
     docker \
     fman \
     diffmerge \
     android-file-transfer

# Manual steps
# - Install pCloud Drive from https://www.pcloud.com
# - Install Audacity from https://www.fosshub.com/Audacity.html/audacity-macos-2.2.0.dmg
