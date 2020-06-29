function! Entry#Begin() abort

  call utils#util#UserConfig('init.vim')

  " python host
  if has('nvim')
    let g:python_host_prog = g:_python2_path
    let g:python3_host_prog = g:_python3_path
  endif

  call utils#util#Source_file('config.vim')
  call utils#util#Source_file('alias.vim')
  call utils#util#Source_file('action.vim')

  call plugs#manager#check()
  if g:_vim_plug_installed ==# 1
    call utils#util#Source_file('vim-plug.vim')
  elseif g:_dein_installed ==# 1
    " TODO
  endif

endfunction
