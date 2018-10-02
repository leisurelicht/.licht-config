" Vue
"
call add(g:_frontend_list, 'vue')

Plug 'posva/vim-vue', {'for': 'vue'}

let s:fixer_list = []

if g:ale_vue_eslint
  call add(s:fixer_list, 'eslint')
endif

let g:_ale_fixer_map.vue = s:fixer_list
