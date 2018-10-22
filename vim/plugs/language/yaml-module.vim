scriptencoding utf-8
" Yaml
"

" 修改不同类型文件的设置
augroup file_set
  setlocal fileformat=unix
  setlocal tabstop=2
  setlocal softtabstop=2
  setlocal shiftwidth=2
augroup end

" ale fixer
let s:fixer_list = []

if g:ale_yaml_prettier
  call add(s:fixer_list, 'prettier')
endif

let g:_ale_fixer_map.yaml = s:fixer_list
