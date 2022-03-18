function! utils#system#OSX()
  return has('macunix')
endfunction

function! utils#system#LINUX()
    return has('unix') && !has('macunix') && !has('win32unix')
endfunction

function! utils#system#WINDOWS()
    return (has('win16') || has('win32') || has('win64'))
endfunction
