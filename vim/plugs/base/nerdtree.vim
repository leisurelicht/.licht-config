" NerdTree
"
" ---> nerdtree
Plug 'scrooloose/nerdtree'

let g:NERDTreeIgnore=['\.pyc$', '\~$', '^tags$']
let g:NERDTreeShowLineNumbers = 1
" let g:NERDTreeShowBookmarks=1
let g:NERDTreeStatusline='NERDTree'

augroup vim_enter
  autocmd StdinReadPre * let s:std_in=1
  autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | wincmd p | endif
augroup end

noremap <F4> :NERDTreeToggle<CR>
noremap <leader>pn :NERDTreeToggle<CR>

" ---> have the nerdtree on erery tab automatically
Plug 'jistr/vim-nerdtree-tabs'
let g:nerdtree_tabs_open_on_console_startup=1

" ---> show git
Plug 'Xuyuanp/nerdtree-git-plugin'

" ---> highlight
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
