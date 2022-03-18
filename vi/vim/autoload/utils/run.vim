function! utils#run#Python() abort
  execute 'w'
  execute '!python %'
endfunction

function! utils#run#Go() abort
  execute 'w'
  execute '!go run %'
endfunction

function! utils#run#Bash() abort
  execute 'w'
  :!./%
endfunction

function! utils#run#C() abort
    exec 'w'
    exec '!gcc % -o %<'
    exec '! ./%<'
endfunction

function! utils#run#CPlus() abort
  exec 'w'
  exec '!g++ % -o %<'
  exec '! ./%<'
endfunction

function! utils#run#Java() abort
  exec 'w'
  exec '!javac %'
  exec '!java %<'
endfunction

function! utils#run#Html() abort
  exec 'w'
  exec '!open %'
endfunction

function! utils#run#Raml() abort
  exec 'w'
  let s:name = expand('%:t:r').'.html'
  exec '!raml2html % > '.s:name
endfunction
