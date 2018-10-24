scriptencoding utf-8
" Git
"
" ---> 文件变动
Plug 'mhinz/vim-signify'

" ---> Git命令
Plug 'tpope/vim-fugitive'
nnoremap <localleader>gs :Gstatus<CR>

" ---> Commit browser
Plug 'junegunn/gv.vim'
