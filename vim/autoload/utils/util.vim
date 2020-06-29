function! utils#util#Source_file(file) abort
  if filereadable(g:_config_dir. '/' . a:file)
    execute 'source '.g:_config_dir.'/'.a:file
  endif
endfunction

function! utils#util#UserConfig(file) abort
  if filereadable(g:_root_dir. '/custom/' . a:file)
    execute 'source '.g:_root_dir.'/custom/'.a:file
  endif
endfunction

function! utils#util#FileExist(file)
  if !empty(glob(a:file))
    return 1
  endif
  return 0
endfunction
