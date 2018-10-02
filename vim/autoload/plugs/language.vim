function! plugs#language#Enable(file) abort
  if filereadable(g:_root_dir.'/plugs/language/'.a:file.'.vim')
    execute 'source '.g:_root_dir.'/plugs/language/'.a:file.'.vim'
  endif
endfunction

function! plugs#language#After(file) abort
  if filereadable(g:_root_dir.'/plugs/language_after/'.a:file.'.vim')
    execute 'source '.g:_root_dir.'/plugs/language_after/'.a:file.'.vim'
  endif
endfunction

function! plugs#language#Befor(file) abort
  if filereadable(g:_root_dir.'/plugs/language_befor/'.a:file.'.vim')
    execute 'source '.g:_root_dir.'/plugs/language_befor/'.a:file.'.vim'
  endif
endfunction
