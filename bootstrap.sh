#!/usr/bin/env bash

# Make all of my favorite directories
mkdir -p ~/Developer/tnbeatty
mkdir -p ~/Developer/irisvr
mkdir -p ~/Developer/go

cd "$(dirname "${BASH_SOURCE}")";

git pull origin master;

function syncIt() {
	rsync --exclude ".git/" \
		--exclude ".DS_Store" \
		--exclude ".osx" \
		--exclude "bootstrap.sh" \
		--exclude "README.md" \
		--exclude "LICENSE.txt" \
		--exclude "archive" \
		-avh --no-perms . ~;
	/bin/bash ~/.vim/install-plugins.sh
}

if [ "$1" == "--force" -o "$1" == "-f" ]; then
	syncIt;
else
	read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1;
	echo "";
	if [[ $REPLY =~ ^[Yy]$ ]]; then
		syncIt;
	fi;
fi;
unset syncIt;


## OSX SPECIFIC

if [ "$OSTYPE" == "linux-gnu" ]; then

	# Linux-Specific Code Here
	echo "Installing linux packages"
	
elif [ "$OSTYPE" == "darwin"* ]; then
	/bin/bash ./brew.sh
fi;