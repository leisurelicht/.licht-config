scriptencoding=utf-8

" 自动添加头信息
function func#AutoSetFileHead()
  "如果文件类型为.sh文件
  if &filetype ==# 'sh'
    call setline(1, '#! /bin/bash')
  endif
  "如果文件类型为.py
  if &filetype ==# 'python'
    call setline(1, '#! /usr/bin/env python')
    call setline(2, '# _*_  coding: utf-8 _*_')
  endif
  normal G
  normal o
endfunc

" C，C++,python,java,shell编译运行
func! CompileRun()
  exec 'w'
  if &filetype ==# 'c'
    exec '!gcc % -o %<'
    exec '! ./%<'
  elseif &filetype ==# 'cpp'
    exec '!g++ % -o %<'
    exec '! ./%<'
  elseif &filetype ==# 'go'
    exec '!go run %'
  elseif &filetype ==# 'java'
    exec '!javac %'
    exec '!java %<'
  elseif &filetype ==# 'python'
    exec '!python %'
  elseif &filetype ==# 'sh'
    :!./%
  endif
endfunc
