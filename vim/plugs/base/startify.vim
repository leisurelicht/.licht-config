" startify
"
Plug 'mhinz/vim-startify'

augroup vim_enter
  autocmd VimEnter * if !argc() | Startify | NERDTree | wincmd w | endif
augroup end

if has('nvim')
  augroup new_tab_enter
    autocmd TabNewEntered * Startify
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
