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
  autocmd BufRead,BufNewFile * match BadWhitespace /\s\+$/
augroup end
