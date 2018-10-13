" sql
"
" ale fixer
let s:fixer_list = []


if g:ale_sql_sqlint
  call add(s:fixer_list, 'sqlint')
endif

if g:ale_sql_sqlfmt
  call add(s:fixer_list, 'sqlfmt')
endif

let g:_ale_fixer_map.sql = s:fixer_list
