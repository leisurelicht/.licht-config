" 代码片段补全
"
if g:ncm2_framework_enable
  Plug 'ncm2/ncm2-ultisnips'
  inoremap <silent> <expr> <CR> ncm2_ultisnips#expand_or("\<CR>", 'n')
endif

" Track the engine.
Plug 'SirVer/ultisnips'

" Snippets are separated from the engine. Add this if you want them:
Plug 'honza/vim-snippets'

let g:UltiSnipsExpandTrigger = '<Plug>(ultisnips_expand)'
let g:UltiSnipsJumpForwardTrigger='<C-j>'
let g:UltiSnipsJumpBackwardTrigger='<C-k>'
let g:UltiSnipsRemoveSelectModeMappings = 0
