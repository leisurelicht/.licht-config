scriptencoding utf-8
" SQL
"
" ---> 修改不同类型文件的设置
augroup file_set
  autocmd FileType sql
        \ setlocal fileformat=unix |
        \ setlocal tabstop=2 |
        \ setlocal softtabstop=2 |
        \ setlocal shiftwidth=2 |
augroup end

" ---> ale fixer
let s:fixer_list = []
if g:ale_sql_sqlint
  call add(s:fixer_list, 'sqlint')
endif

if g:ale_sql_sqlfmt
  call add(s:fixer_list, 'sqlfmt')
endif

let g:_ale_fixer_map.sql = s:fixer_list
