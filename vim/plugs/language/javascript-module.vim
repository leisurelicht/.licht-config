" Javascript
"
call add(g:_frontend_list, 'javacript')

" Makes your javascript files support React jsx correctly.
Plug 'chemzqm/vim-jsx-improve', {'for': 'javascript'}

" ale fixer
let s:fixer_list = ['remove_trailing_lines', 'trim_whitespace']

if g:ale_javascript_eslint
  call add(s:fixer_list, 'eslint')
endif
if g:ale_javascript_import_js
  call add(s:fixer_list, 'importjs')
endif
if g:ale_javascript_prettier
  call add(s:fixer_list, 'prettier_eslint')
  call add(s:fixer_list, 'prettier_standard')
endif

let g:_ale_fixer_map.javascript = s:fixer_list
