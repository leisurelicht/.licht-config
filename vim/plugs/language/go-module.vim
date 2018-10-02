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
  call add(s:fixer_list, 'fmt')
endif

let g:_ale_fixer_map.go = s:fixer_list
