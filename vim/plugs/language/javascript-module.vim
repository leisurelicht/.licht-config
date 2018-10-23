scriptencoding utf-8
" Javascript
"
" ---> 修改不同类型文件的设置
augroup file_set
  autocmd FileType javascript, javascrip.jsx
        \ setlocal fileformat=unix |
        \ setlocal tabstop=2 |
        \ setlocal softtabstop=2 |
        \ setlocal shiftwidth=2 |
augroup end

" ---> Makes your javascript files support React jsx correctly.
Plug 'chemzqm/vim-jsx-improve', {'for': 'javascript.jsx'}

" ---> deoplete
if g:deoplete_framework_enable ==# 1
  Plug 'wokalski/autocomplete-flow', {'for': 'javascript'}
endif

" ---> ncm2
if g:ncm2_framework_enable ==# 1
  Plug 'ncm2/ncm2-tern', {'do': 'npm install', 'for': 'javascript'}
endif

" ---> neovim lsp
if executable('javascript-typescript-stdio')
  let g:LanguageClient_serverCommands.javascript = ['javascript-typescript-stdio']
  augroup lsp_map
    autocmd FileType javascript call LSP_maps()
  augroup end
endif

" ---> ale fixer
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
