function! custom#run#Python() abort
  execute 'w'
  execute '!python %'
endfunction

function! custom#run#Go() abort
  execute 'w'
  execute '!go run %'
endfunction

function! custom#run#Bash() abort
  execute 'w'
  :!./%
endfunction

function! custom#run#C() abort
    exec 'w'
    exec '!gcc % -o %<'
    exec '! ./%<'
endfunction

function! custom#run#CPlus() abort
  exec 'w'
  exec '!g++ % -o %<'
  exec '! ./%<'
endfunction

function! custom#run#Java() abort
  exec 'w'
  exec '!javac %'
  exec '!java %<'
endfunction

function! custom#run#Html() abort
  exec 'w'
  exec '!open %'
endfunction

function! custom#run#Raml() abort
  exec 'w'
  let s:name = expand('%:t:r').'.html'
  exec '!raml2html % > '.s:name
  exec '!open '.s:name
endfunction
