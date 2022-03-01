scriptencoding utf-8
" Vim
"
" ---> 修改不同类型文件的设置
augroup file_set
  autocmd FileType vim
        \ setlocal fileformat=unix |
        \ setlocal tabstop=2 |
        \ setlocal softtabstop=2 |
        \ setlocal shiftwidth=2 |
augroup end

" ---> coc
let g:coc_global_extensions += ['coc-vimlsp']
