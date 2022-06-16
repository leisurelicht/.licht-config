" Specify a directory for plugins
" - Avoid using standard Vim directory names like 'plugin'
"
call plug#begin('~/.vim/plugged')

if utils#system#OSX()
  call plugs#load#Base('fcitx-vim-osx')
endif

call plugs#load#Base('themes')
call plugs#load#Base('nerdtree')
call plugs#load#Base('commentary')
call plugs#load#base('which-key')
call plugs#load#base('airline')
call plugs#load#base('auto-pairs')
call plugs#load#base('bookmarks')
call plugs#load#base('interestingwords')
call plugs#load#base('multiple-cursors')
call plugs#load#base('git')
call plugs#load#base('surround')
call plugs#load#base('fzf')
" just use to develop plugin
call plugs#load#base('dev')

call plugs#language#Befor('ale-module')

call plugs#language#Enable('markdown-module')
call plugs#language#Enable('yaml-module')
call plugs#language#Enable('docker-module')
call plugs#language#Enable('sql-module')
call plugs#language#Enable('vim-module')
call plugs#language#Enable('shell-module')
call plugs#language#Enable('python-module')
call plugs#language#Enable('go-module')
call plugs#language#Enable('javascript-module')
call plugs#language#Enable('html-module')
call plugs#language#Enable('raml-module')

call plugs#language#After('indentline-module')

call plug#end()
