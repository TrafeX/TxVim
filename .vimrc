" TrafeX' VIM config
" Based on configs from Matthew Weier O'Phinney and Tobias Schlitt

" Turn on filetype detection
:filetype on

" We don't need to be compatible
:set nocompatible

" Always use UTF-8 as default
:set encoding=utf-8

" Correct tab and indent settings, use 4 spaces instead of tabs
:set expandtab
:set tabstop=4
:set softtabstop=4
:set shiftwidth=4
:set smarttab
:set shiftround
:set autoindent
:set smartindent

" Wrap text after 120 chars
:set textwidth=120

" Use rownumbers and syntax highlighting
:set number
:syntax on

" Tagfile for the tag list
:set tags=$HOME/.vim/doc/tags,tags;

" We've a fast TTY :)
:set ttyfast

" Show wich commands I've entered and in what mode we are in the statusline
:set showcmd
:set showmode

" Turn on filetype plugins
:filetype plugin on
:filetype plugin indent on

" Make case-insensitive search the norm
:set ignorecase
:set smartcase

" .inc, phpt, phtml, phps files as PHP
:autocmd BufNewFile,BufRead *.inc set ft=php
:autocmd BufNewFile,BufRead *.phpt set ft=php
:autocmd BufNewFile,BufRead *.phtml set ft=php
:autocmd BufNewFile,BufRead *.phps set ft=php

" Use a menu for autocomplete
:set wildmenu
:set wildmode=list:longest

" Insert <Tab> or complete identifier
" if the cursor is after a keyword character
function MyTabOrComplete()
    let col = col('.')-1
    if !col || getline('.')[col-1] !~ '\k'
        return "\<tab>"
    else
        return "\<C-N>"
    endif
endfunction

inoremap <Tab> <C-R>=MyTabOrComplete()<CR>

" Always show the statusline
set laststatus=2

" Open files on last position if available
if has("autocmd")
    au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g'\"" | endif
endif

" Undo history between sessions
set undodir=~/.vim/undodir
set undofile
set undolevels=1000 "maximum number of changes that can be undone
set undoreload=10000 "maximum number lines to save for undo on a buffer reload

" Repair wired terminal/vim settings
set backspace=start,eol,indent

" Colorscheme
let g:solarized_termcolors=256
set background=dark
set t_Co=256
colorscheme solarized

" === PLUGIN SETTINGS ===

" Load a tag file
" Loads a tag file from ~/.vim/mytags/, based on the argument provided. The
" command "Ltag"" is mapped to this function.
:function! LoadTags(file)
:   let tagspath = $HOME . "/.vim/mytags/" . a:file
:   let tagcommand = 'set tags+=' . tagspath
:   execute tagcommand
:endfunction
:command! -nargs=1 Ltag :call LoadTags("<args>")

" These are tag files I've created; you may want to remove/change these for your
" own usage.
:call LoadTags("zf1")
:call LoadTags("glitch3")

" Set powerline to use unicode symbols
let g:Powerline_symbols="unicode"
