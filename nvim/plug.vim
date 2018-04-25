" Specify a directory for plugins
" - Avoid using standard Vim directory names like 'plugin'

call plug#begin('~/.vim/plugged')
"
" airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" Vim内操作Git
Plug 'tpope/vim-fugitive'

let g:airline_powerline_fonts = 1
let g:airline_theme = 'bubblegum'
let g:airline#extensions#disable_rtp_load = 1
let g:airline#extensions#wordcount#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#branch#empty_message = ''
let g:airline#extensions#branch#vcs_priority = ["git",]
let g:airline#extensions#branch#format = 1
let g:airline#extensions#ale#enabled = 1
let g:airline#extensions#hunks#enabled=0
let g:airline#extensions#whitespace#enabled = 1
let g:airline#extensions#default#layout = [
      \ [ 'a', 'b', 'c' ],
      \ [ 'x', 'y', 'z', 'error', ]
      \ ]
let g:airline#extensions#tagbar#enabled = 1
let g:airline#extensions#tagbar#flags = 'f'

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

" 时光机
Plug 'mbbill/undotree', {'on': 'UndotreeToggle'}

if has("persistent_undo")
  set undodir=~/.undodir/
  set undofile
endif

" 文件结构
Plug 'majutsushi/tagbar', {'on': 'TagbarToggle'}

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

" fzf
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'

let g:fzf_command_prefix = 'Fzf'


" 通用语法高亮
Plug 'sheerun/vim-polyglot'
" Python 语法高亮
" Plug 'vim-python/python-syntax' , {'for': 'python'}

" let g:python_highlight_all = 1

" ale
Plug 'w0rp/ale'
Plug 'tell-k/vim-autopep8', {'for': 'python'}

" ale
let g:ale_lint_on_enter = 1
let g:ale_lint_on_text_changed = 'never'
let g:ale_set_quickfix = 1
let g:ale_sign_column_always = 0
let g:ale_sign_error = '>>'
let g:ale_sign_warning = '~~'
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_statusline_format = ['⨉ %d', '⚠ %d', '⬥ OK']
let g:ale_linter = {
      \ 'python': ['autopep8', 'pylint',],
      \ 'Dockerfile':['hadolint'],
      \ 'go': ['gofmt']
      \ }

" pep8
let g:autopep8_disable_show_diff=1
let g:autopep8_max_line_length=79

" 代码补全
Plug 'maralla/completor.vim'

let g:completor_python_binary = '/usr/local/bin/python'
let g:completor_gocode_binary = '/usr/local/opt/go/libexec/go/bin/gocode'
inoremap <expr> <Tab> pumvisible() ? "\<C-N>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-P>" : "\<S-Tab>"
inoremap <expr> <cr> pumvisible() ? "\<C-Y>\<CR>" : "\<CR>"
" inoremap <expr> <Tab> pumvisible() ? "<C-N>" : "<C-R>=completor#do('complete')<CR>"


" 参数提示
Plug 'tenfyzhong/CompleteParameter.vim'

inoremap <silent><expr> ( complete_parameter#pre_complete("()")
smap <c-j> <Plug>(complete_parameter#goto_next_parameter)
imap <c-j> <Plug>(complete_parameter#goto_next_parameter)
smap <c-k> <Plug>(complete_parameter#goto_previous_parameter)
imap <c-k> <Plug>(complete_parameter#goto_previous_parameter))

Plug 'davidhalter/jedi-vim', {'for': 'python'}

" jedi-vim
" jedi需要brew python2的jedi和neovim
let g:jedi#completions_enabled = 0
let g:jedi#goto_command = "<leader>g"
let g:jedi#goto_assignments_command = "<leader>d"
let g:jedi#goto_definitions_command = ""
let g:jedi#rename_command = "<leader>r"
let g:jedi#use_splits_not_buffers = "right"

Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' , 'for': 'go'}

" Python代码缩进
Plug 'vim-scripts/indentpython.vim', {'for': 'python'}

" 代码格式化框架
Plug 'Chiel92/vim-autoformat', {'on': 'Autoformat'}

" 文件保存时自动调用
" 需要单独安装格式化工具
au BufWrite * :Autoformat

" 单词高亮
Plug 'lfv89/vim-interestingwords'

" surround
Plug 'tpope/vim-surround'


" Initialize plugin system
call plug#end()
