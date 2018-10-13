" Vim
"
call add(g:_backend_list, 'vim')

let s:fixer_list = ['remove_trailing_lines', 'trim_whitespace']

let g:_ale_fixer_map.vim = s:fixer_list

if g:ncm2_framework_enable
  Plug 'ncm2/ncm2-vim', {'for': 'vim'}
endif
Plug 'Shougo/neco-vim', {'for': 'vim'}
