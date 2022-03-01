scriptencoding utf-8
" Raml
"
" ---> 自动插入文件头
augroup auto_set_file_head
  autocmd BufNewFile *.raml call custom#header#Raml()
augroup end

" ---> run file
augroup run_file
  autocmd FileType raml noremap <buffer> <F12> :call custom#run#Raml()<CR>
augroup end

" ---> 修改不同类型文件的设置
augroup file_set
  autocmd FileType raml
        \ setlocal fileformat=unix |
        \ setlocal tabstop=2 |
        \ setlocal softtabstop=2 |
        \ setlocal shiftwidth=2 |
augroup end
