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

# Install packages from brew cask
brew cask install \
     dropbox \
     google-drive \
     megasync \
     google-chrome \
     telegram \
     libreoffice \
     filezilla \
     mounty \
     virtualbox \
     android-file-transfer \
     docker \
     iterm2 \
     diffmerge \
     clementine \
     gimp \
     kid3 \
     handbrake \
     vlc \
     keycastr \
     steam \
     origin

# Manual steps
# - Install Emacs from https://emacsformacosx.com
