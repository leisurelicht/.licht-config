" NerdTree
"
" ---> nerdtree
Plug 'scrooloose/nerdtree'

let g:NERDTreeIgnore=['\.pyc$', '\~$', '^tags$']
let g:NERDTreeShowLineNumbers = 1
let g:NERDTreeStatusline='NERDTree'

noremap <leader>e :NERDTreeToggle<CR>

" ---> show git
Plug 'Xuyuanp/nerdtree-git-plugin'

" ---> highlight
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
let g:NERDTreeFileExtensionHighlightFullName = 1
let g:NERDTreeExactMatchHighlightFullName = 1
let g:NERDTreePatternMatchHighlightFullName = 1
