" Specify a directory for plugins
" - Avoid using standard Vim directory names like 'plugin'
"
call plug#begin('~/.vim/plugged')

if utils#system#OSX()
  call plugs#load#Base('fcitx-vim-osx')
endif

call plugs#load#Base('airline')
call plugs#load#Base('nerdtree')
call plugs#load#Base('tagbar')
call plugs#load#Base('auto-pairs')
call plugs#load#Base('undotree')
call plugs#load#Base('vim-bookmarks')
call plugs#load#Base('vim-commentary')
call plugs#load#Base('vim-interestingwords')
call plugs#load#Base('vim-multiple-cursors')
call plugs#load#Base('git')
call plugs#load#Base('vim-surround')
call plugs#load#Base('fzf')
call plugs#load#Base('tabular')

call plugs#language#Befor('init-module')

if g:complete_framework ==? 'deoplete'
  let g:deoplete_framework_enable = 1
  let g:ncm2_framework_enable = 0
  call plugs#language#Befor('deoplete-module')
elseif g:complete_framework ==? 'ncm2'
  if has('nvim')
    call plugs#language#Befor('ncm2-module')
    let g:deoplete_framework_enable = 0
    let g:ncm2_framework_enable = 1
  else
    call plugs#language#Befor('deoplete-module')
    let g:deoplete_framework_enable = 1
    let g:ncm2_framework_enable = 0
  endif
endif

call plugs#language#Befor('ultisnips-module')
call plugs#language#Befor('lsp-module')
call plugs#language#Befor('ale-module')

augroup language_load
  call plugs#language#Enable('markdown-module')
  call plugs#language#Enable('yaml-module')
  call plugs#language#Enable('docker-module')
  call plugs#language#Enable('sql-module')
  call plugs#language#Enable('vim-module')
  call plugs#language#Enable('shell-module')
  call plugs#language#Enable('python-module')
  call plugs#language#Enable('go-module')
  call plugs#language#Enable('javascript-module')
  call plugs#language#Enable('vue-module')
  call plugs#language#Enable('html-module')
augroup end

call plugs#language#After('polyglot-module')
call plugs#language#After('indentline-module')

call plug#end()
