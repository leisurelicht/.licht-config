scriptencoding utf-8
" 语法高亮
"
if has('nvim')
  Plug 'sheerun/vim-polyglot'
  let g:polyglot_disabled = ['markdown']
else
  Plug 'vim-python/python-syntax' , {'for': 'python'}
endif
