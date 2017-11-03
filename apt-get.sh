#!/usr/bin/env bash

# apt-get.sh
#
# Do any managed installation on Ubuntu using apt-get
# 

echo "Installing apt-get packages"

# Support read and write to exfat mounted drives

sudo apt-get -y install exfat-utils exfat-fuse

# Install common tools

sudo apt-get -y install curl \
				vim;


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



echo "Installed additional software tools

You should run the following commands to complete the setup process:

$ run_keybase
$ docker login

"
