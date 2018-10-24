" NerdTree
"
Plug 'scrooloose/nerdtree', {'on': 'NERDTreeToggle'}
Plug 'jistr/vim-nerdtree-tabs', {'on': 'NERDTreeToggle'}
Plug 'Xuyuanp/nerdtree-git-plugin', {'on': 'NERDTreeToggle'}

let g:NERDTreeIgnore=['\.pyc$', '\~$', '^tags$']
let g:NERDTreeShowLineNumbers = 1
let g:NERDTreeShowBookmarks=1

augroup read_pre
  autocmd StdinReadPre * let s:std_in=1
  autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | end
  autocmd vimenter * if !argc() | NERDTree |
augroup end

noremap <F4> :NERDTreeToggle<CR>
