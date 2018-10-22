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
call plugs#load#Base('vim-signify')
call plugs#load#Base('vim-surround')
call plugs#load#Base('fzf')
call plugs#load#Base('tabular')


call plugs#language#Befor('init-module')

if g:complete_framework ==? 'deoplete'
  call plugs#language#Befor('deoplete-module')
elseif g:complete_framework ==? 'ncm2'
  call plugs#language#Befor('ncm2-module')
endif
call plugs#language#Befor('ultisnips-module')

augroup language_load
  call plugs#language#Befor('lsp-module')
  autocmd FileType markdown call plugs#language#Enable('markdown-module')
  autocmd FileType yaml call plugs#language#Enable('yaml-module')
  autocmd FileType dockerfile call plugs#language#Enable('docker-module')
  autocmd FileType sql call plugs#language#Enable('sql-module')
  autocmd FileType vim call plugs#language#Enable('vim-module')
  autocmd FileType sh call plugs#language#Enable('bash-module')
  autocmd FileType python call plugs#language#Enable('python-module')
  autocmd FileType go call plugs#language#Enable('go-module')
  autocmd FileType javascript, javascript.jsx call plugs#language#Enable('javascript-module')
  autocmd FileType vue call plugs#language#Enable('vue-module')
  autocmd FileType html, htmldjango call plugs#language#Enable('html-module')
augroup end

call plugs#language#After('polyglot-module')
call plugs#language#After('indentline-module')
call plugs#language#After('ale-module')




call plug#end()
