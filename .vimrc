" ----------------------------------------
" TrafeX' VIM config
" Based on configs from Matthew Weier O'Phinney, Tobias Schlitt and Jeremy Mack
" ----------------------------------------

" Be iMproved
:set nocompatible

" ----------------------------
" Plugin bundles
" ----------------------------

" Set filetype detection off for Vundle
:filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
Bundle 'gmarik/vundle'

Bundle 'tpope/vim-fugitive'
Bundle 'EvanDotPro/phpcomplete.vim'
Bundle 'tobyS/vip'
Bundle 'Markdown'
Bundle 'mileszs/ack.vim'
Bundle 'Lokaltog/vim-powerline'
Bundle 'altercation/vim-colors-solarized'
Bundle 'taglist.vim'
Bundle 'ervandew/supertab'
Bundle 'scrooloose/nerdtree'
Bundle 'tpope/vim-pastie'
Bundle 'docteurklein/php-getter-setter.vim'
Bundle 'stephpy/vim-php-cs-fixer'
Bundle 'phpcs.vim'
Bundle 'joonty/vdebug.git'

" ----------------------------
" Regular Vim Configuration (No Plugins Needed)
" ----------------------------

" ---------------
" Behaviors
" ---------------

" Turn on filetype detection (after vundle is loaded)
:filetype plugin indent on

" Use rownumbers and syntax highlighting
:set number
:syntax on

" Hidden buffers don't require saving before editing another file.
:set hidden

" Use the mouse in VIM
:set mouse=a

" Yanks go to clipboard
:set clipboard=unnamed

" Use a menu for autocomplete
:set wildmenu
:set wildmode=list:longest

" Repair wired terminal/vim settings
set backspace=start,eol,indent

" We've a fast TTY :)
:set ttyfast

" ---------------
" User Interface
" ---------------

" Show wich commands I've entered and in what mode we are in the statusline
:set showcmd
:set showmode

" Don't try to redraw every scroll action, it's slow
:set lazyredraw

" Always show the statusline
set laststatus=2

" Always use UTF-8 as default
:set encoding=utf-8


" ---------------
" Text Format
" ---------------

" Correct tab and indent settings, use 4 spaces instead of tabs
:set expandtab
:set tabstop=4
:set softtabstop=4
:set shiftwidth=4
:set smarttab
:set shiftround
:set autoindent
:set smartindent

" Don't wrap text
:set nowrap

" Tagfile for the tag list
:set tags=$HOME/.vim/doc/tags,tags;

" ---------------
" Backup
" ---------------

" Don't leave any files after closing VIM
:set nobackup

" Save the swap files here
:set dir=~/.vim/tmp/swapdir

" Undo history between sessions
" Only works in version 7.3 or higher
if v:version >= 703
    set undofile
    set undodir=~/.vim/tmp/undodir
    set undolevels=1000 "maximum number of changes that can be undone
    set undoreload=10000 "maximum number lines to save for undo on a buffer reload
endif

" ---------------
" Searching
" ---------------

" Make case-insensitive search the norm
:set ignorecase
:set smartcase
:set incsearch
:set hlsearch
:set wildignore+=*.o,*.obj,*.exe,*.so,*.dll,*.pyc,.svn,.hg,.bzr,.git,
  \.sass-cache,*.class,*.scssc,*.cssc,sprockets%*,*.lessc

" ---------------
" Sounds
" ---------------
set noerrorbells
set novisualbell
set t_vb=

" ----------------------------
" Plugin configuration
" ----------------------------

" ---------------
" Ack grep
" ---------------
let g:ackprg="ack-grep -H --nocolor --nogroup --column"

" ---------------
" Solarized colorscheme
" ---------------
set background=dark
set t_Co=256
colorscheme solarized

" ---------------
" Powerline
" ---------------
" Set powerline to use unicode symbols
let g:Powerline_symbols="unicode"

" ---------------
" Taglist
" ---------------
let Tlist_Use_Right_Window = 1
let Tlist_Compact_Format = 1
let Tlist_Exit_OnlyWindow = 1
let Tlist_GainFocus_On_ToggleOpen = 1
let Tlist_File_Fild_Auto_Close = 1
let Tlist_Inc_Winwidth = 0
let Tlist_Close_On_Select = 1
let Tlist_Process_File_Always = 1
let Tlist_Display_Prototype = 0
let Tlist_Display_Tag_Scope = 1

" ---------------
" Supertab
" ---------------
let g:SuperTabDefaultCompletionType = "context"

" ---------------
" NERDTree
" ---------------
" load NERDTree on startup if no other files are given as argument
autocmd vimenter * if !argc() | NERDTree | endif

" ---------------
" PHP CS Fixer
" ---------------
let g:php_cs_fixer_path = "~/.vim/resources/php-cs-fixer.phar"

" ---------------
" PHP CodeStyle
" ---------------
let g:phpcs_std_list="PSR2"
" ----------------------------
" Functions
" ----------------------------

" ---------------
" Remove trailing whitespaces on save
" ---------------
autocmd BufWritePre * :%s/\s\+$//e

" ---------------
" Set correct filetypes
" ---------------
" .inc, phpt, phtml, phps files as PHP
:autocmd BufNewFile,BufRead *.inc set ft=php
:autocmd BufNewFile,BufRead *.phpt set ft=php
:autocmd BufNewFile,BufRead *.phtml set ft=php
:autocmd BufNewFile,BufRead *.phps set ft=php
" Vagrantfile, .pp as Ruby
:autocmd BufNewFile,BufRead *Vagrantfile set ft=ruby
:autocmd BufNewFile,BufRead *.pp set ft=ruby

" ---------------
" Tagfile loading
" ---------------
" Loads a tag file from ~/.vim/mytags/, based on the argument provided. The
" command "Ltag"" is mapped to this function.
:function! LoadTags(file)
:   let tagspath = $HOME . "/.vim/mytags/" . a:file
:   let tagcommand = 'set tags+=' . tagspath
:   execute tagcommand
:endfunction
:command! -nargs=1 Ltag :call LoadTags("<args>")

" ---------------
" Generate tagfile and load it
" ---------------
" Generate a tagfile with mkTags and directly load it
:function! GenerateTags()
:   let mktagspath = "!~/.vim/bin/mkTags"
:   execute mktagspath . " `pwd`"
:   let baseName = system('basename `pwd`')
:   execute ":Ltag " baseName
:   echo "Loaded tagfile: " . baseName
:endfunction
:command! -nargs=0 Gentags :call GenerateTags()

" ---------------
" Insert <tab> or use autocomplete
" ---------------
" if the cursor is after a keyword character
function MyTabOrComplete()
    let col = col('.')-1
    if !col || getline('.')[col-1] !~ '\k'
        return "\<tab>"
    else
        return "\<C-N>"
    endif
endfunction

" ---------------
" Open files on last position if available
" ---------------
if has("autocmd")
    au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g'\"" | endif
endif

" ----------------------------
" Bindings
" ----------------------------
"
nnoremap <C-F8> :TlistToggle<CR><CR>
inoremap <Tab> <C-R>=MyTabOrComplete()<CR>
