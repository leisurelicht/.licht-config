" startify
"
Plug 'mhinz/vim-startify'

augroup vim_enter
  autocmd VimEnter * if !argc() | Startify | NERDTree | wincmd w | endif
augroup end

if has('nvim')
  autocmd TabNewEntered * Startify
else
  autocmd VimEnter * let t:startify_new_tab = 1
  autocmd BufEnter *
        \ if !exists('t:startify_new_tab') && empty(expand('%')) |
        \   let t:startify_new_tab = 1 |
        \   Startify |
        \ endif
endif
