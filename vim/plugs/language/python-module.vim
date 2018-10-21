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
        \ setlocal fileformat=unix |
        \ setlocal tabstop=4 |
        \ setlocal softtabstop=4 |
        \ setlocal shiftwidth=4 |
  autocmd FileType htmldjango
        \ setlocal fileformat=unix |
        \ setlocal tabstop=2 |
        \ setlocal softtabstop=2 |
        \ setlocal shiftwidth=2 |
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

if g:deoplete_framework_enable
  Plug 'zchee/deoplete-jedi', {'for': 'python'}
  let g:deoplete#sources#jedi#statement_length=50
  let g:deoplete#sources#jedi#enable_typeinfo=0
  let g:deoplete#sources#jedi#show_docstring=0
endif

if executable('pyls')
  let g:LanguageClient_serverCommands.python = ['pyls']

  augroup lsp_map
    autocmd FileType python call LSP_maps()
  augroup end

	if g:ncm2_framework_enable
		augroup close_python_lsp
			autocmd FileType python call ncm2#override_source('LanguageClient_python', {'enable': 0})
		augroup end
	endif
endif

if g:ncm2_framework_enable
  Plug 'ncm2/ncm2-jedi', {'for': 'python'}
endif
