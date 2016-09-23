#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE}")";
mkdir -p bundle;
cd "bundle";

echo "Installing directories in:"
pwd

# Fugitive (git defaults)
git clone https://github.com/tpope/vim-fugitive.git

# Neocomplete (syntax autocomplete)
git clone https://github.com/Shougo/neocomplete.vim.git

# Syntastic (syntax checker)
git clone https://github.com/scrooloose/syntastic.git

# Nerdtree (file browser)
git clone https://github.com/scrooloose/nerdtree.git

# Tagbar (go tags)
git clone https://github.com/majutsushi/tagbar.git

# Vim-Go (golang support)
git clone https://github.com/fatih/vim-go.git
