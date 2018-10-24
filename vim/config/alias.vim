scriptencoding utf-8
"
" 强制保存
cmap w!! w !sudo tee > /dev/null %

" 窗口切换组合快捷键
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" 创建新的标签页
nnoremap <C-T> :tabnew<CR>
inoremap <C-T> <Esc> :tabnew<CR>

noremap <silent> <leader>1 :1wincmd w<CR>
noremap <silent> <leader>2 :2wincmd w<CR>
noremap <silent> <leader>3 :3wincmd w<CR>
noremap <silent> <leader>4 :4wincmd w<CR>
noremap <silent> <leader>5 :5wincmd w<CR>
noremap <silent> <leader>6 :6wincmd w<CR>
noremap <silent> <leader>7 :7wincmd w<CR>
noremap <silent> <leader>8 :8wincmd w<CR>
noremap <silent> <leader>9 :9wincmd w<CR>
noremap <silent> <leader>10 :10wincmd w<CR>
noremap <silent> <leader>11 :11wincmd w<CR>
noremap <silent> <leader>12 :12wincmd w<CR>
