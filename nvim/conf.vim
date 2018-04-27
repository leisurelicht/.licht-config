" vim原生配置

" ---- Vim 配置 ----
"
" 设置leader键
let mapleader=','
"
" 开启语法高亮
syntax enable
" 允许使用制定高亮替换方案
syntax on
" 为特定文件类型载入相关缩进文件
filetype plugin on
" 关闭自动备份
set noswapfile
" 右下角显示正在输入的命令
set showcmd
" 使用backspace直接删除tab
set smarttab
" 不在单词中间折行
set lbr
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
set colorcolumn=0
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
      \ set colorcolumn=79
au FileType javascript,html,css,vim,dockerfile,yaml
      \ set fileformat=unix |
      \ set tabstop=2 |
      \ set softtabstop=2 |
      \ set shiftwidth=2 |

