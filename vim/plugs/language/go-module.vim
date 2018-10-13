" Go
"
call add(g:_backend_list, 'go')

" vim-go
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' , 'for': 'go'}

" ale fixer
let s:fixer_list = ['remove_trailing_lines', 'trim_whitespace']

if g:ale_go_import
  call add(s:fixer_list, 'goimports')
endif
if g:ale_go_fmt
  call add(s:fixer_list, 'gofmt')
endif

let g:_ale_fixer_map.go = s:fixer_list

if g:deoplete_framework_enable
  Plug 'zchee/deoplete-go', { 'do': 'make', 'for': 'go'}
  let g:deoplete#sources#go#gocode_binary = $GOPATH.'/bin/gocode'
  let g:deoplete#sources#go#sort_class = ['package', 'func', 'type', 'var', 'const']
endif
if g:ncm2_framework_enable
  Plug 'ncm2/ncm2-go', {'for': 'go'}
endif