" vim原生配置

" ---- Vim 配置 ----
"
" 设置leader键
let mapleader=','
" 开启语法高亮
syntax enable
" 允许使用制定高亮替换方案
syntax on
" 侦测文件类型
filetype on
" 载入文件类型插件 
filetype indent on
" 为特定文件类型载入相关缩进文件
filetype plugin on

" 修复delete键
set backspace=2
" 默认显示行号
set number
" 文件自动检测外部更改
set autoread
" UTF_8
set encoding=utf-8
" 不启用兼容模式
set nocompatible
" 关闭自动备份
set noswapfile
" 始终显示状态拦
set laststatus=2
" 右下角显示正在输入的命令
set showcmd          
" 使用backspace直接删除tab
set smarttab         
" 不在单词中间折行
set lbr  
" 让鼠标能使用
set mouse=a
" 分隔窗口在当前窗口下边
set splitbelow  
" 分隔窗口在当前窗口下边    	
set splitright    
" 系统剪贴板
set clipboard=unnamed
" 警告时不要闪烁
set novisualbell    
" 输入搜索内容时就显示搜索结果
set incsearch       
" 搜索时高亮显示被找到的文本
set hlsearch        
" 搜索时忽略大小写
set ignorecase      
" 有一个或以上大写字母时仍大小写敏感
set smartcase       
" 代码自动缩进
set autoindent
set smartindent
set ai
"高亮当前行
set cursorline
" 编辑的时候将所有的tab设置为空格
set expandtab
" 将tab换为4个空格
  set tabstop=4
  set softtabstop=4
  set shiftwidth=4

" ----- 快捷键配置 -----
"
" 强制保存
cmap w!! w !sudo tee > /dev/null %

" 代码折叠快捷键
nnoremap <SPACE> za

" 一键大写 
:imap <C-U> <ESC>viwUea

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

" ----自动动作配置----
"
" 打开自动定位到最后编辑的位置, 需要确认 .viminfo 当前用户可写
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" 定义函数AutoSetFileHead，自动插入文件头
au BufNewFile *.sh,*.py call func#AutoSetFileHead()

" 标识不必要的空白字符
hi BadWhitespace guifg=gray guibg=red ctermfg=gray ctermbg=red
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h,*.go,*.html,*.js match BadWhitespace /\s\+$/

" 空格配置
au FileType python
      \ set fileformat=unix |
      \ set colorcolumn=128
au FileType javascript,html,css,vim
      \ set fileformat=unix |
      \ set tabstop=2 |
      \ set softtabstop=2 |
      \ set shiftwidth=2 | 

