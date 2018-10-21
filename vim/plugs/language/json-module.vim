scriptencoding utf-8
call add(g:_backend_list, 'json')

" 修改不同类型文件的设置
augroup file_set
  autocmd FileType json
        \ setlocal fileformat=unix |
        \ setlocal tabstop=2 |
        \ setlocal softtabstop=2 |
        \ setlocal shiftwidth=2 |
augroup end
