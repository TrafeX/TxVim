" ----------------------------------------
" TrafeX' VIM config
" Based on configs from Matthew Weier O'Phinney, Tobias Schlitt and Jeremy Mack
" ----------------------------------------

" Be iMproved
set nocompatible

" ----------------------------
" Plugin bundles
" ----------------------------

" Set filetype detection off for Vundle
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
Bundle 'gmarik/vundle'

Bundle 'tpope/vim-fugitive'
Bundle 'Markdown'
Bundle 'mileszs/ack.vim'
Bundle 'altercation/vim-colors-solarized'
Bundle 'taglist.vim'
Bundle 'ervandew/supertab'
Bundle 'scrooloose/nerdtree'
Bundle 'tpope/vim-pastie'
Bundle 'trafex/php-getter-setter.vim'
Bundle 'stephpy/vim-php-cs-fixer'
Bundle 'joonty/vdebug.git'
Bundle 'airblade/vim-gitgutter'
Bundle 'beberlei/vim-php-refactor'
Bundle 'tobyS/vmustache'
Bundle 'tobyS/pdv'
Bundle 'rodjek/vim-puppet'
Bundle 'bling/vim-airline'
Bundle 'xsbeats/vim-blade'
Bundle 'kien/ctrlp.vim'
Bundle 'shawncplus/phpcomplete.vim'
Bundle 'editorconfig/editorconfig-vim'
Bundle 'Rykka/riv.vim'
Bundle 'scrooloose/syntastic.git'
Bundle 'terryma/vim-expand-region'
Bundle 'elzr/vim-json'

" ----------------------------
" Regular Vim Configuration (No Plugins Needed)
" ----------------------------

" ---------------
" Behaviors
" ---------------

" Turn on filetype detection (after vundle is loaded)
filetype plugin indent on

" Use rownumbers and syntax highlighting
set number
syntax on

" Hidden buffers don't require saving before editing another file.
set hidden

" Use the mouse in VIM
set mouse=a

" Show a cursor line
set cursorline

" Yanks go to clipboard
set clipboard=unnamed

" Use a menu for autocomplete
set wildmenu
set wildmode=list:longest

" Repair wired terminal/vim settings
set backspace=start,eol,indent

" We've a fast TTY :)
set ttyfast

" Use blowfish as default encryption for :X
set cm=blowfish

" ---------------
" User Interface
" ---------------

" Show wich commands I've entered and in what mode we are in the statusline
set showcmd
set showmode

" Don't try to redraw every scroll action, it's slow
set lazyredraw

" Always show the statusline
set laststatus=2

" Always use UTF-8 as default
set encoding=utf-8

" ---------------
" Text Format
" ---------------

" Correct tab and indent settings, use 4 spaces instead of tabs
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set smarttab
set shiftround
set autoindent
set smartindent

" Don't wrap text
set nowrap

" Tagfile for the tag list
set tags=$HOME/.vim/doc/tags,tags;

" ---------------
" Backup
" ---------------

" Don't leave any files after closing VIM
set nobackup

" Save the swap files here
set dir=~/.vim/tmp/swapdir

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
set ignorecase
set smartcase
set incsearch
set hlsearch
set wildignore+=*.o,*.obj,*.exe,*.so,*.dll,*.pyc,.svn,.hg,.bzr,.git,
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
let NERDTreeShowHidden=1

" ---------------
" PHP CS Fixer
" ---------------
let g:php_cs_fixer_path = "~/.vim/resources/php-cs-fixer.phar"

" ---------------
" GitGutter
" ---------------
" Fix colorscheme for the sign column
highlight clear SignColumn

" ---------------
" PDV
" ---------------
" Path to templates
let g:pdv_template_dir = $HOME ."/.vim/resources/phpdoctemplates"

" ---------------
" PHP Getter/Setter
" ---------------

let b:phpgetset_getterTemplate =
    \ "    \n" .
    \ "    /**\n" .
    \ "     * Get %varname%.\n" .
    \ "     *\n" .
    \ "     * @return string\n" .
    \ "     */\n" .
    \ "    public function %funcname%()\n" .
    \ "    {\n" .
    \ "        return $this->%varname%;\n" .
    \ "    }"

let b:phpgetset_setterTemplate =
    \ "    \n" .
    \ "    /**\n" .
    \ "     * Set %varname%.\n" .
    \ "     *\n" .
    \ "     * @param $%varname% string\n" .
    \ "     */\n" .
    \ "    public function %funcname%($%varname%)\n" .
    \ "    {\n" .
    \ "        $this->%varname% = $%varname%;\n" .
    \ "    }"

" ---------------
" Airline
" ---------------

let g:airline_symbols = {}
" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇ '
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

" ---------------
" Ctrlp
" ---------------
let g:ctrlp_map = '<c-P>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'

" ---------------
" Syntastic
" ---------------

" Set PSR-2 as default codestyle
let g:syntastic_php_phpcs_args="--report=csv --standard=PSR2"

" ---------------
" vim-json
" ---------------

" Disable concealing of double quotes
let g:vim_json_syntax_conceal = 0

" Functions
" ----------------------------

" ---------------
" Remove trailing whitespaces on save
" ---------------
autocmd BufWritePre * :%s/\s\+$//e

" ---------------
" Tagfile loading
" ---------------
" Loads a tag file from ~/.vim/mytags/, based on the argument provided. The
" command "Ltag"" is mapped to this function.
function! LoadTags(file)
   let tagspath = $HOME . "/.vim/mytags/" . a:file
   let tagcommand = 'set tags+=' . tagspath
   execute tagcommand
endfunction
command! -nargs=1 Ltag :call LoadTags("<args>")

" ---------------
" Generate tagfile and load it
" ---------------
" Generate a tagfile with mkTags and directly load it
function! GenerateTags()
   let mktagspath = "!~/.vim/bin/mkTags"
   execute mktagspath . " `pwd`"
   let baseName = system('basename `pwd`')
   execute ":Ltag " baseName
   echo "Loaded tagfile: " . baseName
endfunction
command! -nargs=0 Gentags :call GenerateTags()

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
nnoremap <Leader>m :silent !markdown-calibre "%" -f "%".html && sensible-browser "%".html && rm -f "%".html<CR>
