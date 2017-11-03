
" Theme
" ---------------------------

" Make it work in tmux
" set term=screen-256color


" Colors
" ---------------------------

" Make sure colored syntax mode is on, and make it Just Work with 256-color terminals.
set background=dark
let g:rehash256 = 1 " Something to do with Molokai?
colorscheme molokai
if !has('gui_running')
  if $TERM == "xterm-256color" || $TERM == "screen-256color" || $COLORTERM == "gnome-terminal"
    set t_Co=256
  elseif has("terminfo")
    colorscheme default
    set t_Co=8
    set t_Sf=[3%p1%dm
    set t_Sb=[4%p1%dm
  else
    colorscheme default
    set t_Co=8
    set t_Sf=[3%dm
    set t_Sb=[4%dm
  endif
  " Disable background color erase when within tmux - https://stackoverflow.com/q/6427650/102704
	if $TMUX != ""
    set t_ut=
  endif
endif
syntax on


" window splits & ruler are too bright, so change to white on grey (non-GUI)
highlight StatusLine       cterm=NONE ctermbg=blue ctermfg=white
highlight StatusLineTerm   cterm=NONE ctermbg=blue ctermfg=white
highlight StatusLineNC     cterm=NONE ctermbg=black ctermfg=white
highlight StatusLineTermNC cterm=NONE ctermbg=black ctermfg=white
highlight VertSplit        cterm=NONE ctermbg=black ctermfg=white

" taglist.vim's filenames is linked to LineNr by default, which is too dark
highlight def link MyTagListFileName Statement
highlight def link MyTagListTagName Question

" Turn off horrible coloring for CDATA in XML
highlight def link xmlCdata NONE

" Some custom spell-checking colors
highlight SpellBad     term=underline cterm=underline ctermbg=NONE ctermfg=205
highlight SpellCap     term=underline cterm=underline ctermbg=NONE ctermfg=33
highlight SpellRare    term=underline cterm=underline ctermbg=NONE ctermfg=217
highlight SpellLocal   term=underline cterm=underline ctermbg=NONE ctermfg=72

" The Ignore color should be... ignorable
silent! highlight Ignore cterm=bold ctermfg=black ctermbg=bg
highlight clear FoldColumn
highlight def link FoldColumn Ignore
highlight clear Folded
highlight link Folded Ignore
highlight clear LineNr
highlight! def link LineNr Ignore

" Custom search colors
highlight clear Search
highlight Search term=NONE cterm=NONE ctermfg=white ctermbg=black

" Make hilighted matching parents less annoying
highlight clear MatchParen
highlight link MatchParen Search

" Custom colors for NERDTree
highlight def link NERDTreeRO NERDTreeFile

" Make trailing spaces very visible
highlight SpecialKey ctermbg=Yellow guibg=Yellow

" Make menu selections visible
highlight PmenuSel ctermfg=black ctermbg=magenta

" The sign column slows down remote terminals
highlight clear SignColumn
highlight link SignColumn Ignore

" Markdown could be more fruit salady
highlight link markdownH1 PreProc
highlight link markdownH2 PreProc
highlight link markdownLink Character
highlight link markdownBold String
highlight link markdownItalic Statement
highlight link markdownCode Delimiter
highlight link markdownCodeBlock Delimiter
highlight link markdownListMarker Todo



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

" Trim spaces at EOL and retab. I run `:CLEAN` a lot to clean up files.
command! TEOL %s/\s\+$//
command! CLEAN retab | TEOL

" Close all buffers except this one
command! BufCloseOthers %bd|e#


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

