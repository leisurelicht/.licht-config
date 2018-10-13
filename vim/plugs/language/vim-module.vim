" Vim
"
call add(g:_backend_list, 'vim')

if g:ncm2_framework_enable
  Plug 'ncm2/ncm2-vim', {'for': 'vim'}
endif
Plug 'Shougo/neco-vim', {'for': 'vim'}
