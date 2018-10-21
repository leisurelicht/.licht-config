" Javascript
"
call add(g:_frontend_list, 'javacript')

" 修改不同类型文件的设置
augroup file_set
  autocmd FileType javascript, javascrip.jsx
        \ setlocal fileformat=unix |
        \ setlocal tabstop=2 |
        \ setlocal softtabstop=2 |
        \ setlocal shiftwidth=2 |
augroup end

" Makes your javascript files support React jsx correctly.
Plug 'chemzqm/vim-jsx-improve', {'for': 'javascript'}

" ale fixer
let s:fixer_list = []

if g:ale_javascript_eslint
  call add(s:fixer_list, 'eslint')
endif
if g:ale_javascript_import_js
  call add(s:fixer_list, 'importjs')
endif
if g:ale_javascript_prettier
  call add(s:fixer_list, 'prettier_eslint')
  call add(s:fixer_list, 'prettier_standard')
endif

let g:_ale_fixer_map.javascript = s:fixer_list

if g:deoplete_framework_enable
  Plug 'wokalski/autocomplete-flow'
endif

if g:ncm2_framework_enable
  Plug 'ncm2/ncm2-tern', {'do': 'npm install', 'for': 'javascript'}
endif

if executable('javascript-typescript-stdio')
  let g:LanguageClient_serverCommands.javascript = ['javascript-typescript-stdio']
  augroup lsp_map
    autocmd FileType javascript call LSP_maps()
  augroup end
endif

if executable('typescript-language-server')
  let g:LanguageClient_serverCommands.typescript = ['typescript-language-server', '--stdio']
  augroup lsp_map
    autocmd FileType typescript call LSP_maps()
  augroup end
endif
