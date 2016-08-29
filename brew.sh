#!/usr/bin/env bash

# Ensure brew is installed

if ! which brew > /dev/null; then
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Install favorite packages using homebrew

# Ensure brew is up to date
brew update

# Upgrade any already-installed formulae
brew upgrade --all

# Install updated versions of mac tools
brew install luajit
brew install vim --override-system-vi --with-luajit
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
brew install ctags
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
