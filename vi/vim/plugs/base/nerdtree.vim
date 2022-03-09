" NerdTree
"
" ---> nerdtree
Plug 'scrooloose/nerdtree'

let g:NERDTreeIgnore=['\.pyc$', '\~$', '^tags$']
let g:NERDTreeShowLineNumbers = 1
" let g:NERDTreeShowBookmarks=1
let g:NERDTreeStatusline='NERDTree'

noremap <F4> :NERDTreeToggle<CR>
noremap <leader>pn :NERDTreeToggle<CR>

" 应该是打开 vim 自动打开NERDTree, 不知道为什么不生效，所以用下面的 vim-nerdtree-tab 插件代替
" augroup vim_enter
"   autocmd StdinReadPre * let s:std_in=1
"   autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | wincmd p | endif
" augroup end

" ---> have the nerdtree on erery tab automatically
" Plug 'jistr/vim-nerdtree-tabs'
" let g:nerdtree_tabs_open_on_console_startup=0

" ---> show git
Plug 'Xuyuanp/nerdtree-git-plugin'

" ---> highlight
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
let g:NERDTreeFileExtensionHighlightFullName = 1
let g:NERDTreeExactMatchHighlightFullName = 1
let g:NERDTreePatternMatchHighlightFullName = 1

" ---> enable vim devicons
let g:webdevicons_enable_nerdtree = 1
let g:webdevicons_conceal_nerdtree_brackets = 1
