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

noremap <F12> :call custom#file#CompileRun()<CR>
