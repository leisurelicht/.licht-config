" startify
"
Plug 'mhinz/vim-startify'

augroup vim_enter
  autocmd VimEnter * if !argc() | Startify | NERDTree | wincmd w | endif
augroup end

if has('nvim')
  augroup new_tab_enter
    autocmd TabNew * Startify
  augroup end
else
  augroup new_tab_enter
    autocmd VimEnter * let t:startify_new_tab = 1
    autocmd BufEnter *
          \ if !exists('t:startify_new_tab') && empty(expand('%')) |
          \   let t:startify_new_tab = 1 |
          \   Startify |
          \ endif
  augroup end
endif

let g:startify_custom_indices = map(range(1,100), 'string(v:val)')

" ---> enable vim devicons
let g:webdevicons_enable_startify = 1
