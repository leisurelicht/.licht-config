scriptencoding utf-8
"
" 强制保存
cmap w!! w !sudo tee > /dev/null %

" 一键大写
inoremap <C-U> <ESC>viwUea
inoremap <C-L> <ESC>viwuea

" 窗口切换组合快捷键
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" 创建新的标签页
nnoremap <leader>tp gT
nnoremap <leader>tn gt
nnoremap <leader>tt :tab
nnoremap <leader>ta :tabnew<CR>
nnoremap <leader>tc :tabclose<CR>
nnoremap <leader>tl :tabs<CR>
nnoremap <leader>td :tabdo
nnoremap <leader>tF :tabfirst<CR>
nnoremap <leader>tL :tablast<CR>
nnoremap <leader>ts :tab split<CR>

nnoremap <leader>too :tabonly
nnoremap <leader>toa :tabonly<CR>
nnoremap <leader>to1 :tabonly 1<CR>
nnoremap <leader>to2 :tabonly 2<CR>
nnoremap <leader>to3 :tabonly 3<CR>
nnoremap <leader>to4 :tabonly 4<CR>
nnoremap <leader>to5 :tabonly 5<CR>
nnoremap <leader>to6 :tabonly 6<CR>
nnoremap <leader>to7 :tabonly 7<CR>
nnoremap <leader>to8 :tabonly 8<CR>
nnoremap <leader>to9 :tabonly 9<CR>
nnoremap <leader>to$ :tabonly $<CR>

noremap <silent> <leader>t1 1gt
noremap <silent> <leader>t2 2gt
noremap <silent> <leader>t3 3gt
noremap <silent> <leader>t4 4gt
noremap <silent> <leader>t5 5gt
noremap <silent> <leader>t6 6gt
noremap <silent> <leader>t7 7gt
noremap <silent> <leader>t8 8gt
noremap <silent> <leader>t9 9gt

noremap <silent> <leader>1 :1wincmd w<CR>
noremap <silent> <leader>2 :2wincmd w<CR>
noremap <silent> <leader>3 :3wincmd w<CR>
noremap <silent> <leader>4 :4wincmd w<CR>
noremap <silent> <leader>5 :5wincmd w<CR>
noremap <silent> <leader>6 :6wincmd w<CR>
noremap <silent> <leader>7 :7wincmd w<CR>
noremap <silent> <leader>8 :8wincmd w<CR>
noremap <silent> <leader>9 :9wincmd w<CR>

noremap <silent> <leader>a za<CR>

vnoremap <silent> < <gv
vnoremap <silent> > >gv
