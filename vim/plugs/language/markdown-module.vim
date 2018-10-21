" markdown
"
call add(g:_backend_list, 'markdown')

" 修改不同类型文件的设置
augroup file_set
  autocmd FileType markdown
        \ setlocal fileformat=unix |
        \ setlocal tabstop=4 |
        \ setlocal softtabstop=4 |
        \ setlocal shiftwidth=4 |
augroup end

if g:ncm2_framework_enable
  Plug 'ncm2/ncm2-markdown-subscope'
endif

" ale fixer
let s:fixer_list = []


if g:ale_markdown_prettier
  call add(s:fixer_list, 'prettier')
endif

let g:_ale_fixer_map.markdown = s:fixer_list

Plug 'mzlogin/vim-markdown-toc'
