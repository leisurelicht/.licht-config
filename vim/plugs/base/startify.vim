Plug 'mhinz/vim-startify'

augroup vim_enter
  autocmd VimEnter * if !argc() | Startify | NERDTree | wincmd w | endif
augroup end
