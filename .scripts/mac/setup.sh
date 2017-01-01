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
     node

# Install packages from brew cask
brew cask install \
     dropbox \
     google-chrome \
     libreoffice \
     filezilla \
     mounty \
     virtualbox \
     docker \
     iterm2 \
     steam

# Manual steps
# - Install Emacs from https://emacsformacosx.com
