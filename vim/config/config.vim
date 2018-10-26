scriptencoding utf-8
" vim config
"

" 设置leader键
let g:mapleader="\<Space>"
let g:maplocalleader=','

if has('nvim')
  " 即时预览命令效果
  set inccommand=split
else
  filetype on
  " 为特定文件类型载入相关缩进文件
  filetype indent on
  " 修复delete键
  set backspace=2
  " 文件自动检测外部更改
  set autoread
  " 始终显示状态拦
  set laststatus=2
  " 让鼠标能使用
  set mouse=a
  " 输入搜索内容时就显示搜索结果
  set incsearch
  " 搜索时高亮显示被找到的文本
  set hlsearch
  " 有一个或以上大写字母时仍大小写敏感
  set smartcase
  " 代码自动缩进
  set autoindent
endif

set ttimeoutlen=200
" 显示行号
set number
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

highlight MatchParen ctermfg=0 ctermbg=81 gui=undercurl guisp=Blue
