scriptencoding utf-8
" Bash
"
" ---> 修改不同类型文件的设置
augroup file_set
  autocmd FileType lua
        \ setlocal fileformat=unix |
        \ setlocal tabstop=2 |
        \ setlocal softtabstop=2 |
        \ setlocal shiftwidth=2 |
augroup end

" ---> ale fixer
let g:ale_fixers.lua = ['luafmt']
let g:ale_lua_luafmt_options = "--indent-count 2"
