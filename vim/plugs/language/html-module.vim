" HTML and CSS
"
call add(g:_frontend_list, 'html')
call add(g:_frontend_list, 'css')

Plug 'mattn/emmet-vim', {'for': g:_frontend_list}

" html5
Plug 'othree/html5.vim', {'for': 'html'}

if g:ncm2_framework_enable
  Plug 'ncm2/ncm2-cssomni'
  Plug 'ncm2/ncm2-html-subscope'
endif
