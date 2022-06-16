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
call plugs#load#Base('which-key')
call plugs#load#Base('airline')
call plugs#load#Base('auto-pairs')
call plugs#load#Base('bookmarks')
call plugs#load#Base('interestingwords')
call plugs#load#Base('multiple-cursors')
call plugs#load#Base('git')
call plugs#load#Base('surround')
call plugs#load#Base('fzf')
" just use to develop plugin
call plugs#load#Base('dev')

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
