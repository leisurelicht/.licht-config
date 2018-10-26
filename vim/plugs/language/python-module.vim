scriptencoding utf-8
" Python
"
" ---> 自动插入文件头
augroup auto_set_file_head
  autocmd BufNewFile *.py call custom#header#Python()
augroup end

" ---> run file
augroup run_file
  autocmd FileType python noremap <buffer> <F12> :call custom#run#Python()<CR>
augroup end

" ---> 修改不同类型文件的设置
augroup file_set
  autocmd FileType python
        \ setlocal fileformat=unix |
        \ setlocal tabstop=4 |
        \ setlocal softtabstop=4 |
        \ setlocal shiftwidth=4 |
        \ setlocal colorcolumn=79 |
  autocmd FileType htmldjango
        \ setlocal fileformat=unix |
        \ setlocal tabstop=2 |
        \ setlocal softtabstop=2 |
        \ setlocal shiftwidth=2 |
augroup end

" ---> Python代码缩进
Plug 'vim-scripts/indentpython.vim', {'for': 'python'}

" ---> deoplete
if g:deoplete_framework_enable
  Plug 'zchee/deoplete-jedi', {'for': 'python'}
  let g:deoplete#sources#jedi#statement_length=50
  let g:deoplete#sources#jedi#enable_typeinfo=0
  let g:deoplete#sources#jedi#show_docstring=0
endif

" ---> ncm2
if g:ncm2_framework_enable
  Plug 'ncm2/ncm2-jedi', {'for': 'python'}
  augroup close_lsp
    autocmd FileType python call ncm2#override_source('LanguageClient_python', {'enable': 0})
  augroup end
endif

" ---> neovim lsp
if executable('pyls')
  let g:LanguageClient_serverCommands.python = ['pyls']
  augroup lsp_map
    autocmd FileType python call LSP_maps()
  augroup end
endif

" ----> ale fixer
let g:ale_fixers.python = ['add_blank_lines_for_python_control_statements', 'isort', 'yapf', 'autopep8',]
