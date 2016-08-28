
" Theme
" ---------------------------

" Use Solarized 8 Dark theme (as a pack)
" let g:solarized_termcolors=256
let g:solarized_termtrans=1
set background=dark
colorscheme solarized

" Make it work in tmux
set term=screen-256color

" FORMATTING
" ---------------------------

" Highlight Syntax
syntax enable
" Respect modelines
set modeline
set modelines=4
" Tabs should be narrower than default
set tabstop=2
" Enable custom plugin options
filetype indent plugin on

" Customize the GUI
" ---------------------------

" Line numbers
set number
" Column numbers
set ruler
" Show the filename
set title
" Show the current mode (input | normal)
set showmode

" Navigation and input
" ---------------------------

" Make backspace work as expected
set backspace=indent,eol,start

" Custom Commands
" ---------------------------

" Automatic commands
if has("autocmd")
	" Enable file type detection
	filetype on
	" Treat .json files as .js
	autocmd BufNewFile,BufRead *.json setfiletype json syntax=javascript
	" Treat .md files as Markdown
	autocmd BufNewFile,BufRead *.md setlocal filetype=markdown
endif
