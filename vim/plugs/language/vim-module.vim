" Vim
"
call add(g:_backend_list, 'vim')

let s:fixer_list = ['remove_trailing_lines', 'trim_whitespace']

let g:_ale_fixer_map.vim = s:fixer_list
