function! entry#Begin() abort

  call utils#util#UserConfig('init.vim')

  call utils#util#SystemConfig('config.vim')
  call utils#util#SystemConfig('alias.vim')
  call utils#util#SystemConfig('action.vim')

  call plugs#manager#check()
  if g:_vim_plug_installed == 1
    call utils#util#SystemConfig('vim-plug.vim')
  endif

endfunction
