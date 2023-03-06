function! extends#load#Plugs(file) abort
  if filereadable(g:_root_dir. '/extends/plugs/' . a:file.'.vim')
    execute 'source '.g:_root_dir.'/extends/plugs/'.a:file.'.vim'
  endif
endfunction

function! extends#load#Language(file) abort
  if filereadable(g:_root_dir.'/extends/language/'.a:file.'.vim')
    execute 'source '.g:_root_dir.'/extends/language/'.a:file.'.vim'
  endif
endfunction
