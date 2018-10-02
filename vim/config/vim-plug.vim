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


call plugs#language#Befor('init-module')

if g:language_vim_enable ==# 1
  call plugs#language#Enable('vim-module')
endif
if g:language_shell_enable ==# 1
  call plugs#language#Enable('shell-module')
endif
if g:language_python_enable ==# 1
  call plugs#language#Enable('python-module')
endif
if g:language_go_enable ==# 1
  call plugs#language#Enable('go-module')
endif
if g:language_javascript_enable ==# 1
  call plugs#language#Enable('javascript-module')
endif
if g:language_html_enable ==# 1
  call plugs#language#Enable('html-module')
endif
if g:language_vue_enable ==# 1
  call plugs#language#Enable('vue-module')
endif

call plugs#language#After('autoformat-module')
call plugs#language#After('polyglot-module')
call plugs#language#After('indentline-module')
call plugs#language#After('ultisnips-module')
call plugs#language#After('ale-module')
call plugs#language#After('completeparameter-module')


call plug#end()
