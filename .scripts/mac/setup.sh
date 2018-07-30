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
     alfred \
     iterm2 \
     hyper \
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
     xnviewmp \
     gimp \
     handbrake \
     kid3

# Install gaming packages from brew cask
brew cask install \
     steam \
     origin \
     sony-remoteplay

# Install screencast packages from brew cask
brew cask install \
     licecap \
     keycastr

# Install misc packages from brew cask
brew cask install \
     libreoffice \
     virtualbox \
     crossover \
     fish \
     docker \
     fman \
     diffmerge \
     android-file-transfer

# Install fonts
brew cask install \
     font-inconsolata \
     font-liberation-sans \
     font-roboto-mono \
     caskroom/fonts/font-fira-code

# Manual steps
# - Install pCloud Drive from https://www.pcloud.com
# - Install Audacity from https://www.fosshub.com/Audacity.html/audacity-macos-2.2.0.dmg
# - Install LAME from https://lame.buanzo.org/#lameosxdl
