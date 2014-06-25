TrafeX' Vim config
==================
Using Vundle

With:

* Taglist
* Fugitive for GIT support
* Powerline
* PHP autocomplete
* Good tab/ident settings
* NERDTRee
* Solarized colorscheme
* Mouse support under Ubuntu
* Automatic strip trailling whitespaces
* Xdebug integration
* Easy refactoring using vim-php-refactor
* PHP CodeStyle checks
* GitGutter
* PHPDoc generation
* Much more..

Bundles:

* 'gmarik/vundle'
* 'tpope/vim-fugitive'
* 'Markdown'
* 'mileszs/ack.vim'
* 'altercation/vim-colors-solarized'
* 'taglist.vim'
* 'ervandew/supertab'
* 'scrooloose/nerdtree'
* 'tpope/vim-pastie'
* 'docteurklein/php-getter-setter.vim'
* 'stephpy/vim-php-cs-fixer'
* 'joonty/vdebug.git'
* 'airblade/vim-gitgutter'
* 'beberlei/vim-php-refactor'
* 'tobyS/vmustache'
* 'tobyS/pdv'
* 'rodjek/vim-puppet'
* 'bling/vim-airline'
* 'xsbeats/vim-blade'
* 'kien/ctrlp.vim'
* 'shawncplus/phpcomplete.vim'
* 'editorconfig/editorconfig-vim'
* 'Rykka/riv.vim'
* 'scrooloose/syntastic.git'

Install on Ubuntu
================
For the best VIM experience on Ubuntu follow the following steps:

1. Clone the repository (with --recursive for the submodules) to ~/.vim and make a symlink for the .vimrc
2. Install `vim-gnome`, this gives a better integration on your terminal and let you use the system clipboard
3. To use the bundles, open `vim` and run `:BundleInstall`
4. Install `ack-grep` and `exuberant-ctags`
5. Setup colors of your terminal for the solarize colorscheme (see https://gist.github.com/1280177)

Tricks
======
Some random vim tricks I like to remember

* `gv` Reverts last visual selection
* `q:` Show :command history
* `:earlier 15m` Lets you go back 15 mins in your undo history
* `di'` Will delete everything within the quotes
* `"+y` Yank to system-clipboard
* `zt` Center current line in the middle of the screen
* `*` Find next occurance of the selected property
* `%` Find next matching bracket
* `ctrl + v` Go into column mode, make selection, `shift + i` insert text, `esc` text will be copied to selection
* Pressing `m` in NERDTRee gives the ability to do some basic tools for adding/moving files/folders
* `:mess` Shows the last (error) messages
* `zR` Opens all folds
* `ctrl + o` Open previous opened files
* `ctrl + i` Open newly opened files
* `dt<char>` Delete until <char>
* `ctrl + w, shift + T` Open current window in new tab

Bindings
========
* `<tab>` Autocomplete
* `<C-F8>` Taglist toggle
* `<C-p>` Insert PHP-Doc
* `<C-H>` Search phpm for the function
* `<C-a>` Align a function or array
* `<C-c>` (un-)comment the visual selection
* `<C-^>` Open last closed window
* `<Localleader>p` Generate PHP getters/setters for the property on the current line (default Localleader is \)
* `:Phpcs` Check the file on codestyle
* `:GenTags` Generate tagfile with bin/mkTags and load it
* `:Ltag <name>` Load the tagfile
* `<Localleader>rlv` Rename local variable
* `<Localleader>rcv` Rename class variable
* `<Leader>qa` Show/hide code sniffer and mess detector violations
* `<Leader>qc` Show/hide code coverage markers
