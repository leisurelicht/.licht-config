scriptencoding utf-8
" Markdown
"
" ---> 修改不同类型文件的设置
augroup file_set
  autocmd FileType markdown
        \ setlocal fileformat=unix |
        \ setlocal tabstop=4 |
        \ setlocal softtabstop=4 |
        \ setlocal shiftwidth=4 |
augroup end

" ---> 自动生成目录
Plug 'mzlogin/vim-markdown-toc'

" ---> ncm2
if g:ncm2_framework_enable
  Plug 'ncm2/ncm2-markdown-subscope', {'for': 'markdown'}
endif

" ---> ale fixer
let s:fixer_list = []

if g:ale_markdown_prettier
  call add(s:fixer_list, 'prettier')
endif

let g:_ale_fixer_map.markdown = s:fixer_list
