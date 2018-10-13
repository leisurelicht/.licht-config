" markdown
"
if g:ncm2_framework_enable
  Plug 'ncm2/ncm2-markdown-subscope'
endif

" ale fixer
let s:fixer_list = []


if g:ale_markdown_prettier
  call add(s:fixer_list, 'prettier')
endif

if g:ale_markdown_write_good
  call add(s:fixer_list, 'write-good')
endif

let g:_ale_fixer_map.markdown = s:fixer_list
