" 语法高亮
"
if has('nvim')
  Plug 'sheerun/vim-polyglot'
else
  if g:language_python_enable == 1
    Plug 'vim-python/python-syntax' , {'for': 'python'}
  endif
endif
