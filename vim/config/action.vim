scriptencoding utf-8
" ----自动动作配置----
"
" 打开自动定位到最后编辑的位置, 需要确认 .viminfo 当前用户可写
augroup auto_position
  autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
augroup end

" 标识不必要的空白字符
augroup white_space
  hi BadWhitespace guifg=gray guibg=red ctermfg=gray ctermbg=red
  autocmd BufRead,BufNewFile *.py,*.pyw,*.c,*.h,*.go,*.html,*.js match BadWhitespace /\s\+$/
augroup end

" 不同类型文件配置
augroup file_set
  autocmd FileType python
        \ setlocal fileformat=unix |
        \ setlocal colorcolumn=79
  autocmd FileType vim,dockerfile,yaml,bash,vue,html,htmldjango,javascript,javascript.jsx
        \ setlocal fileformat=unix |
        \ setlocal tabstop=2 |
        \ setlocal softtabstop=2 |
        \ setlocal shiftwidth=2 |
  autocmd FileType vue syntax sync fromstart
augroup end
