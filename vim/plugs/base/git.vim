scriptencoding utf-8
" Git
"
" ---> 文件变动
Plug 'mhinz/vim-signify'

" ---> Git命令
Plug 'tpope/vim-fugitive'
nnoremap <leader>vgg :Git<CR>
nnoremap <leader>vgs :Gstatus<CR>
nnoremap <leader>vgc :Gcommit %<CR>
nnoremap <leader>vgh :Gpush<CR>
nnoremap <leader>vgl :Gpull<CR>
nnoremap <leader>vgb :Gblame<CR>
nnoremap <leader>vge :Gbedit<CR>
nnoremap <leader>vgr :Gread<CR>
nnoremap <leader>vgf :Gdiff<CR>
nnoremap <leader>vgd :Gdelete<CR>

" ---> Commit browser
Plug 'junegunn/gv.vim'

nnoremap <leader>vgv :Gv<CR>
