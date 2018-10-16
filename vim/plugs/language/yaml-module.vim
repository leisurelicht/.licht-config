" yaml
"
call add(g:_backend_list, 'yaml')
" ale fixer
let s:fixer_list = []

if g:ale_yaml_prettier
  call add(s:fixer_list, 'prettier')
endif

let g:_ale_fixer_map.yaml = s:fixer_list
