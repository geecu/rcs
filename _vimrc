set nowrap      " nowrap
syntax on       " syntax higlht
set ai          " auto indent
filetype on
filetype plugin on
set nocompatible

set nohls       " NO hilght search
set tabstop=4
set et
set sw=4
set smarttab
set ruler
set fenc=utf-8
set encoding=utf-8

"colorscheme darktango
"set keywordprg=~/php_doc 
		"#!/bin/sh 
		"links http://www.php.net/$1
"nmap <F5> :set hls!<bar>set hls?<CR>
inoremap ) )<left><c-o>%<c-o>:sleep 100m<CR><c-o>%<c-o>a
inoremap } }<left><c-o>%<c-o>:sleep 100m<CR><c-o>%<c-o>a
let php_folding=1
let php_sql_query=1
let javaScript_fold=1

"nnoremap <silent> <F8> :Tlist<CR>
"let Tlist_Ctags_Cmd="/home/.sites/85/site23/.users/54/nica/ctags/bin/ctags"

set foldmethod=manual
set cpt=.,k/usr/share/vim/vim63/syntax/php.vim,k~mpreda/web/inc/n_database_functions.inc.php

"custom syntax for php
"let my_php_syntaxfile = "~/.vim/my_php_syntax.vim"
"au BufRead,BufNewFile *.php set filetype=newlang
"au! Syntax php source ~/.vim/my_php_syntax.vim

function InsertTabWrapper()
      let col = col('.') - 1
      if !col || getline('.')[col - 1] !~ '\k'
          return "\<tab>"
      else
          return "\<c-p>"
      endif
endfunction
inoremap <tab> <c-r>=InsertTabWrapper()<cr>
nnoremap <C-J> i<cr><esc>k$
"map <Left> : :confirm :bnext<cr>
set backspace=2
set viminfo='10,\"100,:20,%,n~/.viminfo
au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif 
map <c-a> <Esc>
au BufNewFile,BufRead *.php,*.js syn region myCComment start="/\*" end="\*/" fold keepend transparent
au BufNewFile,BufRead *.php,*.js syn region myCComment start="/\**" end="\*/" fold keepend transparent
au BufNewFile,BufRead *.php se ic

function! JavaScriptFold() 
  setl foldmethod=syntax
  setl foldlevelstart=1
  syn region foldBraces start=/{/ end=/}/ transparent fold keepend extend

  function! FoldText()
    return substitute(getline(v:foldstart), '{.*', '{...}', '')
  endfunction

  setl foldtext=FoldText()
endfunction

au FileType javascript call JavaScriptFold()
au FileType javascript setl fen

au BufNewFile,BufRead *.scss set filetype=css

" run file with PHP CLI (CTRL-M)
:autocmd FileType php noremap <C-M> :w!<CR>:!/usr/bin/php %<CR>
" PHP parser check (CTRL-L)
:autocmd FileType php noremap <C-L> :!/usr/bin/php -l %<CR>
:autocmd FileType php set keywordprg=pman

if has("win32") || has("win64")
  set directory=$TMP
else
  set directory=/tmp
end

