scriptencoding utf-8
" Yaml
"
" ---> 修改不同类型文件的设置
augroup file_set
  autocmd FileType yaml
        \ setlocal fileformat=unix |
        \ setlocal tabstop=2 |
        \ setlocal softtabstop=2 |
        \ setlocal shiftwidth=2 |
augroup end

" ---> ale fixer
let g:ale_fixers.yaml = []
