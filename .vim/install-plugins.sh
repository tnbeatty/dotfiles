#!/usr/bin/env bash

# Usage: ./install-plugins.sh [pattern]

cd "$(dirname "${BASH_SOURCE}")";
mkdir -p bundle;
cd "bundle";

echo "Installing directories in:"
pwd


repos=(
  
  airblade/vim-gitgutter
	alampros/vim-styled-jsx
	altercation/vim-colors-solarized
	scrooloose/nerdtree
	tpope/vim-fugitive
	itchyny/lightline.vim
	tomasr/molokai
	fatih/vim-go

)


set -e
dir=~/.vim/bundle

# if [ -d $dir -a -z "$1" ]; then
#   temp="$(mktemp -d -t bundleXXXXX)"
#   echo "▲ Moving old bundle dir to $temp"
#   mv "$dir" "$temp"
# fi

mkdir -p $dir

for repo in ${repos[@]}; do
  if [ -n "$1" ]; then
    if ! (echo "$repo" | grep -i "$1" &>/dev/null) ; then
      continue
    fi
  fi
  plugin="$(basename $repo | sed -e 's/\.git$//')"
  [ "$plugin" = "vim-styled-jsx" ] && plugin="000-vim-styled-jsx" # https://goo.gl/tJVPja
  dest="$dir/$plugin"
  rm -rf $dest
  (
    git clone --depth=1 -q https://github.com/$repo $dest
    rm -rf $dest/.git
    echo "· Cloned $repo"
  ) &
done
wait

# Fugitive (git defaults)
# git clone https://github.com/tpope/vim-fugitive.git

# Neocomplete (syntax autocomplete)
# git clone https://github.com/Shougo/neocomplete.vim.git

# Syntastic (syntax checker)
# git clone https://github.com/scrooloose/syntastic.git

# Nerdtree (file browser)
# git clone https://github.com/scrooloose/nerdtree.git

# Tagbar (go tags)
# git clone https://github.com/majutsushi/tagbar.git

# Vim-Go (golang support)
# git clone https://github.com/fatih/vim-go.git
