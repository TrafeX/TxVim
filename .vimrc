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
:set tags=$HOME/.vim/doc/tags

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

" Extend statusline with current branch from fugitive
set statusline +=%{fugitive#statusline()}

