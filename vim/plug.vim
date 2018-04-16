" Specify a directory for plugins
" - Avoid using standard Vim directory names like 'plugin'

call plug#begin('~/.vim/plugged')
"
" airline
Plug 'vim-airline/vim-airline'
 Plug 'vim-airline/vim-airline-themes'
  " airline git 显示
 Plug 'tpope/vim-fugitive'

let g:airline_powerline_fonts = 1 
let g:airline_theme = 'bubblegum'
let g:airline#extensions#disable_rtp_load = 1
let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#wordcount#enabled = 0
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#hunks#enabled=0
let g:airline#extensions#default#layout = [
      \ [ 'a', 'b', 'c' ],
      \ [ 'x', 'y', 'z', 'error', ]
      \ ]
let g:airline#extensions#virtualenv#enabled = 1
let g:airline#extensions#tagbar#enabled = 1
let g:airline#extensions#tagbar#flags = 'f'

let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#branch#empty_message = ''
let g:airline#extensions#branch#vcs_priority = ["git",]
let g:airline#extensions#branch#format = 1

" 缩进指示线
Plug 'Yggdroot/indentLine', {'for': ['python', 'html', 'javascript', 'go']}

let g:indentLine_color_term = 239
let g:indentLine_char = '│'

" NerdTree
Plug 'scrooloose/nerdtree', {'on': 'NERDTreeToggle'}
 Plug 'jistr/vim-nerdtree-tabs', {'on': 'NERDTreeToggle'}
 Plug 'Xuyuanp/nerdtree-git-plugin', {'on': 'NERDTreeToggle'}

" NerdTree
let NERDTreeIgnore=['\.pyc$', '\~$']
let g:NERDTreeShowLineNumbers = 1
let NERDTreeShowBookmarks=1
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ "Unknown"   : "?"
    \ }
au StdinReadPre * let s:std_in=1
au vimenter * if !argc() | NERDTree |
au bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | end

" Vim内操作Git
Plug 'tpope/vim-fugitive'

" 时光机
Plug 'mbbill/undotree'

if has("persistent_undo")
  set undodir=~/.undodir/
  set undofile
endif

" 文件结构
Plug 'majutsushi/tagbar'

" 多光标
Plug 'terryma/vim-multiple-cursors'

" 文件变动
Plug 'mhinz/vim-signify'

" 括号、引号自动补全
Plug 'jiangmiao/auto-pairs'

" bookmarks
Plug 'MattesGroeger/vim-bookmarks'

" 注释
Plug 'scrooloose/nerdcommenter'
let g:NERDDefaultAlign = 'left'
let g:NERDTrimTrailingWhitespace = 1
let g:NERDSpaceDelims=1

" markdown
Plug 'iamcco/markdown-preview.vim', {'for': 'markdown'}

" Initialize plugin system
call plug#end()
