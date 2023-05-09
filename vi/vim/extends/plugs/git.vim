scriptencoding utf-8
" Git
"
" ---> 文件变动
Plug 'mhinz/vim-signify'

" ---> Git Message
Plug 'rhysd/git-messenger.vim'

" ---> Git命令
Plug 'tpope/vim-fugitive'

nnoremap <leader>gb :Git blame<CR>
nnoremap <leader>ge :Gbedit<CR>
nnoremap <leader>gf :Git diff<CR>
nnoremap <leader>gg :Git<CR>
nnoremap <leader>gh :Gpush<CR>
nnoremap <leader>gl :Gpull<CR>
nnoremap <leader>gr :Gread<CR>
