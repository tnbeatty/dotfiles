#!/usr/bin/env bash

# apt-get.sh
#
# Do any managed installation on Ubuntu using apt-get
# 

echo "Installing apt-get packages"

## Install and set up tmux
sudo apt-get install --assume-yes tmux
sudo apt-get install --assume-yes xclip

# Support read and write to exfat mounted drives
sudo apt-get -y install exfat-utils exfat-fuse

# Install common tools
sudo apt-get -y install curl \
				vim tree;
# Install common dependencies
sudo apt-get -y install apt-transport-https \
				ca-certificates \
				software-properties-common;

# Install language support

## TODO Python

## Golang

curl -O https://dl.google.com/go/go1.10.linux-amd64.tar.gz
sudo tar -C /usr/local -xzf go1.10.linux-amd64.tar.gz
rm go1.10.linux-amd64.tar.gz

# Install applications via apt

## Sublime Text 3
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
sudo apt-get update
sudo apt-get -y install sublime-text

echo "Installing other software tools"

# Keybase
curl -O https://prerelease.keybase.io/keybase_amd64.deb
# if you see an error about missing `libappindicator1`
# from the next command, you can ignore it, as the
# subsequent command corrects it
sudo dpkg -i keybase_amd64.deb
sudo apt-get install -f
# clean up
rm keybase_amd64.deb

# Docker
curl -fsSL get.docker.com -o get-docker.sh
sh get-docker.sh
# clean up
rm get-docker.sh
# add yourself to the docker user group
# to prevent having to sudo every docker cmd
sudo usermod -aG docker $USER

# Spotify
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys BBEBDCB318AD50EC6865090613B00F1FD2C19886 0DF731E45CE24F27EEEB1450EFDC8610341D9410
echo deb http://repository.spotify.com stable non-free | sudo tee /etc/apt/sources.list.d/spotify.list
sudo apt-get update
sudo apt-get install spotify-client

# Chrome
curl -O https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg –I google-chrome-stable_current_amd64.deb
rm google-chrome-stable_current_amd64.deb

# Telegram
sudo add-apt-repository ppa:atareao/telegram -y
sudo apt-get update
sudo apt-get install telegram


echo "Installed additional software tools

* Docker
* Spotify
* Chrome
* Telegram

------

You should run the following commands to complete the setup process:

$ run_keybase
$ docker login

"

