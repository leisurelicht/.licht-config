scriptencoding utf-8
" vim原生配置

" ---- Vim 配置 ----
"
" 设置leader键
let g:mapleader=','

if has('nvim')
  " 即时预览命令效果
  set inccommand=split
else
  filetype on
  " 为特定文件类型载入相关缩进文件
  filetype indent on
  set ttimeoutlen=100
  " 修复delete键
  set backspace=2
  " 文件自动检测外部更改
  set autoread
  " 不启用兼容模式
  set nocompatible
  " 关闭自动备份
  set noswapfile
  " 始终显示状态拦
  set laststatus=2
  " 让鼠标能使用
  set mouse=a
  " 分隔窗口在当前窗口下边
  set splitbelow
  " 分隔窗口在当前窗口下边
  set splitright
  " 系统剪贴板
  set clipboard=unnamed
  " 输入搜索内容时就显示搜索结果
  set incsearch
  " 搜索时高亮显示被找到的文本
  set hlsearch
  " 有一个或以上大写字母时仍大小写敏感
  set smartcase
  " 代码自动缩进
  set autoindent
endif

"高亮当前行
set cursorline
" 开启语法高亮
syntax enable
" 允许使用制定高亮替换方案
syntax on
" 载入文件类型插件
filetype plugin on
" 关闭自动备份
set noswapfile
" 右下角显示正在输入的命令
set showcmd
" 使用backspace直接删除tab
set smarttab
" 不在单词中间折行
set linebreak
" 分隔窗口在当前窗口下边
set splitbelow
" 分隔窗口在当前窗口下边
set splitright
" 系统剪贴板
set clipboard=unnamed
" 警告时不要闪烁
set novisualbell
" 搜索时忽略大小写
set ignorecase
" 有一个或以上大写字母时仍大小写敏感
set smartcase
" 编辑的时候将所有的tab设置为空格
set expandtab
" 将tab换为4个空格
set tabstop=4
set softtabstop=4
set shiftwidth=4
" 代码自动缩进
set smartindent
" 折叠方式
set foldmethod=indent
set foldlevelstart=99
" 这是长度表示线
set colorcolumn=0

" 颜色修改
highlight MatchParen ctermfg=0 ctermbg=81 gui=undercurl guisp=Blue

" ----自动动作配置----
"
" 打开自动定位到最后编辑的位置, 需要确认 .viminfo 当前用户可写
augroup auto_position
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
augroup end

" 定义函数AutoSetFileHead，自动插入文件头
augroup auto_set_file_head
  au BufNewFile *.sh,*.py call func#AutoSetFileHead()
augroup end

" 标识不必要的空白字符
hi BadWhitespace guifg=gray guibg=red ctermfg=gray ctermbg=red
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h,*.go,*.html,*.js match BadWhitespace /\s\+$/

" 空格配置
au FileType python
      \ setlocal fileformat=unix |
      \ setlocal colorcolumn=79
au FileType javascript
      \ setlocal fileformat=unix |
      \ setlocal colorcolumn=80
au FileType vim,dockerfile,yaml,bash,vue,html,htmldjango,javascript.jsx
      \ setlocal fileformat=unix |
      \ setlocal tabstop=2 |
      \ setlocal softtabstop=2 |
      \ setlocal shiftwidth=2 |
autocmd FileType vue syntax sync fromstart
