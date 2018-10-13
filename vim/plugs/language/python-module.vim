scriptencoding utf-8
" Python
"
call add(g:_backend_list, 'python')
call add(g:_frontend_list, 'htmldjango')

" Python代码缩进
Plug 'vim-scripts/indentpython.vim', {'for': 'python'}

" ale fixer
let s:fixer_list = ['add_blank_lines_for_python_control_statements',]

if g:ale_python_isort
  call add(s:fixer_list, 'isort')
endif
if g:ale_python_yapf
  call add(s:fixer_list, 'yapf')
endif
if g:ale_python_autopep8
  call add(s:fixer_list, 'autopep8')
endif

let g:_ale_fixer_map.python = s:fixer_list

if g:deoplete_framework_enable
  Plug 'zchee/deoplete-jedi', {'for': 'python'}
  let g:deoplete#sources#jedi#statement_length=50
  let g:deoplete#sources#jedi#enable_typeinfo=0
  let g:deoplete#sources#jedi#show_docstring=0
endif

if g:ncm2_framework_enable
  Plug 'ncm2/ncm2-jedi', {'for': 'python'}
endif
