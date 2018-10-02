function! plugs#load#Base(file) abort
  if filereadable(g:_root_dir. '/plugs/base/' . a:file.'.vim')
    execute 'source '.g:_root_dir.'/plugs/base/'.a:file.'.vim'
  endif
endfunction
