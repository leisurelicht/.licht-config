scriptencoding utf-8
" 语言加载设置
"
let g:language_shell_enable = 1

let g:language_vim_enable = 1

" Python
let g:language_python_enable = 1
" ale 自动fixer
let g:ale_python_isort = 1
let g:ale_python_yapf = 1
let g:ale_python_autopep8 = 1

let g:language_go_enable = 1
" ale 自动fixer
let g:ale_go_import = 1
let g:ale_go_fmt = 1

let g:language_html_enable = 1

let g:language_css_enable = 1

let g:language_javascript_enable = 1
" ale 自动fixer
let g:ale_javascript_eslint = 1
let g:ale_javascript_import_js = 1
let g:ale_javascript_prettier = 1

let g:language_vue_enable = 1
let g:ale_vue_eslint = 1

" set plugin manager
" default use vim-plug
" dein is in plan
let g:plugin_manager = 'vim-plug'

" python2 path
" ex.
" let g:_python2_path = '/path/to/python2'
" let g:_python2_path = '/usr/local/bin/python'
let g:_python2_path = ''

" python3 path
" ex.
" let g:_python3_path = '/path/to/python3'
let g:_python3_path = '/usr/local/bin/python3'
