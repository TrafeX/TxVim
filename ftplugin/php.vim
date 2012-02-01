" PHP syntax settings
:let php_sql_query=1
:let PHP_autoformatcomment = 1
:let php_htmlInStrings=1
:let php_folding=0
:let php_parent_error_close=1
:let php_parent_error_open=1

" Do not wrap lines automatically
setlocal nowrap

" Correct indentation after opening a phpdocblock and automatic * on every
" line
setlocal formatoptions=qroct

" Use php syntax check when doing :make
setlocal makeprg=php\ -l\ %

" Use errorformat for parsing PHP error output
setlocal errorformat=%m\ in\ %f\ on\ line\ %l

" Use pman for manual pages
" TODO: Install Pman
"setlocal keywordprg=pman

" The completion dictionary is provided by Rasmus:
" http://lerdorf.com/funclist.txt
setlocal dictionary-=$HOME/.vim/phpfunclist.txt dictionary+=$HOME/.vim/phpfunclist.txt
" Use the dictionary completion
setlocal complete-=k complete+=k
