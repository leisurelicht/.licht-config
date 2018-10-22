scriptencoding utf-8
" Python
"
call add(g:_backend_list, 'python')
call add(g:_frontend_list, 'htmldjango')

" 自动插入文件头
augroup auto_set_file_head
  autocmd BufNewFile *.py call custom#header#Python()
augroup end

" run file
augroup run_file
  autocmd FileType python noremap <buffer> <F12> :call custom#run#Python()<CR>
augroup end

" 修改不同类型文件的设置
augroup file_set
  autocmd FileType python
setlocal fileformat=unix |
        \ setlocal tabstop=4 |
        \ setlocal softtabstop=4 |
        \ setlocal shiftwidth=4 |
augroup end

" Python代码缩进
Plug 'vim-scripts/indentpython.vim', {'for': 'python'}

" ale fixer
let s:fixer_list = ['add_blank_lines_for_python_control_statements',]

if g:ale_python_isort
  call add(s:fixer_list, 'isort')
endif
if g:ale_python_yapf
  call add(s:fixer_list, 'yapf')
endif
if g:ale_python_autopep8
  call add(s:fixer_list, 'autopep8')
endif

let g:_ale_fixer_map.python = s:fixer_list

if executable('pyls')
  call ncm2#override_source('LanguageClient_python', {'enable': 0})
  let g:LanguageClient_serverCommands.python = ['pyls']
  call LSP_maps()
endif
