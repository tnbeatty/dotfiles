
" Theme
" ---------------------------

" Use Solarized 8 Dark theme (as a pack)
" let g:solarized_termcolors=256
let g:solarized_termtrans=1
set background=dark
colorscheme solarized

" Make it work in tmux
set term=screen-256color

" Formatting
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

" Custom leader key
let mapleader = ","

" tell vim to allow you to copy between files, remember your cursor
" position and other little nice things like that
" set viminfo='100,\"2500,:200,%,n~/.viminfo

" Natural split navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

set splitbelow
set splitright

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

" Plugins
" ---------------------------

" Pathogen (runtimepath manager)
execute pathogen#infect()

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Neocomplete
let g:neocomplete#enable_at_startup = 1

" Nerdtree
map <leader>t :NERDTreeToggle<CR>
let NERDTreeShowHidden=1

" Nerdtree (auto-open if vim launch w/o a file)
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Tagbar
let g:tagbar_type_go = {  
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
\ }

" Vim-Go
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_fields = 1
let g:go_highlight_types = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

let g:go_fmt_command = "goimports"

let g:syntastic_go_checkers = ['golint', 'govet', 'errcheck']
let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['go'] }

let g:go_list_type = "quickfix"

