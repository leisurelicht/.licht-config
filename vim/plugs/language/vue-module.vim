scriptencoding utf-8
" Vue
"
" 修改不同类型文件的设置
augroup file_set
  setlocal fileformat=unix
  setlocal tabstop=2
  setlocal softtabstop=2
  setlocal shiftwidth=2
  syntax sync fromstart
augroup end

Plug 'posva/vim-vue', {'for': 'vue'}

let s:fixer_list = []

if g:ale_vue_eslint
  call add(s:fixer_list, 'eslint')
endif

let g:_ale_fixer_map.vue = s:fixer_list

if executable('vls')
  let g:LanguageClient_serverCommands.vue = ['vls']
  call LSP_maps()
endif
