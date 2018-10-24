" 状态栏 airline
"
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

let g:airline_powerline_fonts = 1
let g:airline_theme = 'bubblegum'
let g:airline#extensions#disable_rtp_load = 1
let g:airline#extensions#wordcount#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#branch#empty_message = ''
let g:airline#extensions#branch#vcs_priority = ['git',]
let g:airline#extensions#branch#format = 1
let g:airline#extensions#ale#enabled = 1
let g:airline#extensions#hunks#enabled=0
let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#tagbar#enabled = 1
let g:airline#extensions#tagbar#flags = 'f'
let g:airline#extensions#ale#enabled = 1
