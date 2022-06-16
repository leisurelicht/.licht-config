scriptencoding utf-8
" Git
"
" ---> 文件变动
Plug 'mhinz/vim-signify'

" ---> Git命令
Plug 'tpope/vim-fugitive'

nnoremap <leader>gg :Git<CR>
nnoremap <leader>gs :Gstatus<CR>
nnoremap <leader>gc :Gcommit %<CR>
nnoremap <leader>gh :Gpush<CR>
nnoremap <leader>gl :Gpull<CR>
nnoremap <leader>gb :Gblame<CR>
nnoremap <leader>ge :Gbedit<CR>
nnoremap <leader>gr :Gread<CR>
nnoremap <leader>gf :Gdiff<CR>
nnoremap <leader>gd :Gdelete<CR>

" ---> Git Message
Plug 'rhysd/git-messenger.vim'
