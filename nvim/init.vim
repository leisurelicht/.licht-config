" vim 插件配置文件
source ~/.config_file/nvim/plug.vim

" vim 参数配置文件
source ~/.config_file/nvim/conf.vim

" vim 函数
source ~/.config_file/nvim/func.vim

" 使用brew 安装的python2
let g:python_host_prog = '/usr/local/bin/python'

" ----- 快捷键配置 -----
"
" 强制保存
cmap w!! w !sudo tee > /dev/null %

" 代码折叠快捷键
nnoremap <SPACE> za
" 全部打开 zi
" 全部折叠 zm
" 折叠全部及其嵌套折叠 zM

" 一键大写
inoremap <C-U> <ESC>viwUea

" 用双引号包裹单词
nnoremap <LEADER>" viw<ESC>a"<ESC>hbi"<ESC>lel
nnoremap <LEADER>' viw<ESC>a'<ESC>hbi'<ESC>lel

" 窗口切换组合快捷键
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" 创建新的标签页
nnoremap <C-T>     :tabnew<CR>
inoremap <C-T> <Esc>:tabnew<CR>
" 下一个标签页 gt
" 前一个标签页 gT

" FZF
nnoremap <C-P> :FzfGFiles<CR>
nnoremap <leader><TAB> :FzfCommands<CR>
nnoremap <leader>t :FzfTags<CR>
nnoremap <leader>b :FzfBuffers<CR>
command! -bang -nargs=? -complete=dir FzfGFiles
      \ call fzf#vim#gitfiles(<q-args>, fzf#vim#with_preview(), <bang>0)

" map <F2>
map <F3> :set nu!<CR>
map <F4> :NERDTreeToggle<CR>
map <F5> :TagbarToggle<CR>
map <F6> :UndotreeToggle<CR>
" map <F7>
" map <F8>
" map <F9>
au FileType markdown nmap <silent> <F10> <Plug>MarkdownPreview
au FileType python noremap <buffer> <F10> :Autopep8 <CR>
map <F12> :call CompileRun()<CR>

" python代码跳转 <leader>g
" python代码跳转到声明 <leader>d
" python代码重命名 <leader>r

" 多光标 <C-N>

" 单词高亮 <leader>k
" 取消单词高亮 <leader>K
" 高亮单词间移动 n\N


















" 自动生效
autocmd! BufWritePost .vimrc source %
