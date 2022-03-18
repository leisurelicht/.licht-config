scriptencoding utf-8
" 专注模式
"
Plug 'junegunn/goyo.vim', {'on': 'Goyo'}
Plug 'junegunn/limelight.vim', {'on': 'Limelight'}

autocmd! User GoyoEnter nested call plugs#goyo#Enter()
autocmd! User GoyoLeave nested call plugs#goyo#Leave()

" nnoremap <silent> <leader>pg :Goyo<CR>
nnoremap <leader>pg :Goyo<CR>
