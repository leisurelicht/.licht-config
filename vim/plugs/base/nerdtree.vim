" NerdTree
"
Plug 'scrooloose/nerdtree', {'on': 'NERDTreeToggle'}
Plug 'jistr/vim-nerdtree-tabs', {'on': 'NERDTreeToggle'}
Plug 'Xuyuanp/nerdtree-git-plugin', {'on': 'NERDTreeToggle'}

let g:NERDTreeIgnore=['\.pyc$', '\~$', '^tags$']
let g:NERDTreeShowLineNumbers = 1
let g:NERDTreeShowBookmarks=1

augroup read_pre
  autocmd VimEnter * NERDTree
  autocmd StdinReadPre * let s:std_in=1
  autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
  autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | wincmd p | endif
augroup end

augroup auto_refresh
  autocmd BufWritePost * NERDTreeFocus | execute 'normal R' | wincmd p
augroup end

noremap <F4> :NERDTreeToggle<CR>
noremap <leader>pn :NERDTreeToggle<CR>
