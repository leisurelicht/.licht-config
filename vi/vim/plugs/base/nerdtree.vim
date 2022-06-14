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
