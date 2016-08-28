#!/usr/bin/env bash

# Install favorite packages using homebrew

# Ensure brew is up to date
brew update

# Upgrade any already-installed formulae
brew upgrade --all

# Install updated versions of mac tools
brew install vim --override-system-vi
brew install homebrew/dupes/grep

# Install languages
brew install go

# Install sublime text
# brew install caskroom/cask/brew-cask
# brew tap caskroom/versions
# brew cask install sublime-text3

# install other useful binaries
brew install ack
brew install ansible
brew install dark-mode
brew install git
brew install git-lfs
brew install imagemagick
brew install keybase
brew install terraform
brew install tmux
brew install tree

# Remove outdated versions
brew cleanup
