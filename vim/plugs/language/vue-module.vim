scriptencoding utf-8
" Vue
"
" ---> 修改不同类型文件的设置
augroup file_set
  autocmd FileType vue
        \ setlocal fileformat=unix |
        \ setlocal tabstop=2 |
        \ setlocal softtabstop=2 |
        \ setlocal shiftwidth=2 |
        \syntax sync fromstart
augroup end

" ---> vim vue
Plug 'posva/vim-vue', {'for': 'vue'}

" ---> neovim vim
if executable('vls')
  let g:LanguageClient_serverCommands.vue = ['vls']
  augroup lsp_map
    autocmd FileType sh call LSP_maps()
  augroup end
endif

" ---> ale fixer
let s:fixer_list = []

if g:ale_vue_eslint
  call add(s:fixer_list, 'eslint')
endif

let g:_ale_fixer_map.vue = s:fixer_list
