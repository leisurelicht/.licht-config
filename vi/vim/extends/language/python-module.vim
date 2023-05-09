scriptencoding utf-8
" Python
"
" ---> 自动插入文件头
augroup auto_set_file_head
  autocmd BufNewFile *.py call custom#header#Python()
augroup end

" ---> run file
augroup run_file
  autocmd FileType python noremap <buffer> <F12> :call custom#run#Python()<CR>
augroup end

" ---> 修改不同类型文件的设置
augroup file_set
  autocmd FileType python
        \ setlocal fileformat=unix |
        \ setlocal tabstop=4 |
        \ setlocal softtabstop=4 |
        \ setlocal shiftwidth=4 |
        \ setlocal colorcolumn=79 |
  autocmd FileType htmldjango
        \ setlocal fileformat=unix |
        \ setlocal tabstop=2 |
        \ setlocal softtabstop=2 |
        \ setlocal shiftwidth=2 |
augroup end

" ---> ale fixer
let g:ale_fixers.python = ['add_blank_lines_for_python_control_statements', 'isort', 'yapf', 'autopep8',]
