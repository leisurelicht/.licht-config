" yaml
"
" ale fixer
let s:fixer_list = []

if g:ale_yaml_prettier
  call add(s:fixer_list, 'prettier')
endif

if g:ale_yaml_yamllint
  call add(s:fixer_list, 'yamllint')
endif

let g:_ale_fixer_map.yaml = s:fixer_list
