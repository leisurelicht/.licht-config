" Specify a directory for plugins
" - Avoid using standard Vim directory names like 'plugin'
"
call plug#begin('~/.vim/plugged')

if utils#system#OSX()
  call extends#load#Plugs('fcitx-vim-osx')
endif

call extends#load#Plugs('themes')
call extends#load#Plugs('nerdtree')
call extends#load#Plugs('commentary')
call extends#load#Plugs('which-key')
call extends#load#Plugs('airline')
call extends#load#Plugs('auto-pairs')
call extends#load#Plugs('interestingwords')
call extends#load#Plugs('multiple-cursors')
call extends#load#Plugs('git')
call extends#load#Plugs('surround')
call extends#load#Plugs('fzf')
" just use to develop plugin
call extends#load#Plugs('dev')

call extends#load#Plugs('ale')

call extends#load#Language('markdown-module')
call extends#load#Language('yaml-module')
call extends#load#Language('docker-module')
call extends#load#Language('sql-module')
call extends#load#Language('vim-module')
call extends#load#Language('shell-module')
call extends#load#Language('python-module')
call extends#load#Language('go-module')
call extends#load#Language('javascript-module')
call extends#load#Language('html-module')
call extends#load#Language('raml-module')

call extends#load#Plugs('indentline')

call plug#end()
