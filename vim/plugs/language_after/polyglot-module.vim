scriptencoding utf-8
" 语法高亮
"
if has('nvim')
  Plug 'sheerun/vim-polyglot'
else
  Plug 'vim-python/python-syntax' , {'for': 'python'}
endif
