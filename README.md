TrafeX' Vim config
==================
Using Vundle

With:

* Taglist
* PHP functionlist from http://lerdorf.com/funclist.txt
* Fugitive for GIT support
* Powerline
* PHP autocomplete
* Good tab/ident settings
* NERDTRee
* Solarized colorscheme
* Mouse support under Ubuntu
* Much more..

Bundles:
* 'gmarik/vundle'
* 'tpope/vim-fugitive'
* 'scrooloose/nerdtree'
* 'EvanDotPro/phpcomplete.vim'
* 'ervandew/supertab'
* 'altercation/vim-colors-solarized'
* 'Lokaltog/vim-powerline'
* 'tobyS/vip'
* 'MarkDown'
* 'tpope/vim-pastie'

Install on Ubuntu
================
For the best VIM experience on Ubuntu follow the following steps:
1. Clone the repository to ~/.vim and make a symlink for the .vimrc
2. Install vim-gnome, this gives a better integration on your terminal and let you use the system clipboard
3. To use the bundles, open `vim` and run `:BundleInstall`
4. Install ack-grep
5. @todo: Setup colors of your terminal for the solarize colorscheme

Tricks
======
Some random vim tricks I like to remember

* `gv` Reverts last visual selection
* `q:` Show :command history
* `:earlier 15m` Lets you go back 15 mins in your undo history
* `di'` Will delete everything within the quotes
* `"+y` Yank to system-clipboard
* `zt` Center current line in the middle of the screen

Bindings
========
* `<tab>` Autocomplete
* `<C-F8>` Taglist toggle
* `<C-p>` Insert PHP-Doc
* `<C-H>` Search phpm for the function
* `<C-a>` Align a function or array
* `<C-c>` (un-)comment
