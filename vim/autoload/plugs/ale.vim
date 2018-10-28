
function! plugs#ale#AutoFix() abort
  if g:ale_fix_on_save
    let g:ale_fix_on_save = 0
    echo 'ALE Fix: OFF'
  else
    let g:ale_fix_on_save = 1
    echo 'ALE Fix: ON'
  endif
endfunction
