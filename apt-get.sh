#!/usr/bin/env bash

# apt-get.sh
#
# Do any managed installation on Ubuntu using apt-get
# 

echo "Installing apt-get packages"

## Install and set up tmux
sudo apt-get install --assume-yes tmux
sudo apt-get install --assume-yes xclip

## Install command line tools
curl -O https://prerelease.keybase.io/keybase_amd64.deb
sudo dpkg -i keybase_amd64.deb
sudo apt-get install -f
rm keybase_amd64.deb


## Install GUI applications

### Spotify
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys BBEBDCB318AD50EC6865090613B00F1FD2C19886 0DF731E45CE24F27EEEB1450EFDC8610341D9410
echo deb http://repository.spotify.com stable non-free | sudo tee /etc/apt/sources.list.d/spotify.list
sudo apt-get update
sudo apt-get install spotify-client

### Chrome
curl -O https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg –I google-chrome-stable_current_amd64.deb
rm google-chrome-stable_current_amd64.deb

### Telegram
sudo add-apt-repository ppa:atareao/telegram -y
sudo apt-get update
sudo apt-get install telegram