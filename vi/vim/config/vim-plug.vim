" Specify a directory for plugins
" - Avoid using standard Vim directory names like 'plugin'
"
call plug#begin('~/.vim/plugged')

" theme"
Plug 'liuchengxu/space-vim-dark'
let g:space_vim_dark_background = 233
hi Normal     ctermbg=NONE guibg=NONE
hi LineNr     ctermbg=NONE guibg=NONE
hi SignColumn ctermbg=NONE guibg=NONE
hi Comment    ctermfg=99 guifg=#5C6370
" 缩进指示线
Plug 'Yggdroot/indentLine'
let g:indentLine_color_term = 239
let g:indentLine_char = '|'
" 括号、引号自动补全
Plug 'jiangmiao/auto-pairs'
" 注释
Plug 'tpope/vim-commentary'
" surround
Plug 'tpope/vim-surround'
" wakatime
Plug 'wakatime/vim-wakatime'
" ---> Python 代码缩进
Plug 'vim-scripts/indentpython.vim', {'for': 'python'}
" ---> Python 语法高亮
Plug 'vim-python/python-syntax' , {'for': 'python'}


call extends#load#Plugs('nerdtree')
call extends#load#Plugs('which-key')
call extends#load#Plugs('airline')
call extends#load#Plugs('git')
call extends#load#Plugs('fzf')

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
call extends#load#Language('lua-module')


call plug#end()
