" Bash
"
if g:deoplete_framework_enable
  Plug 'zchee/deoplete-zsh', {'for': 'bash'}
endif

" ale fixer
let s:fixer_list = []


if g:ale_bash_shfmt
  call add(s:fixer_list, 'shfmt')
endif

if g:ale_bash_language_server
  call add(s:fixer_list, 'language-server')
endif

let g:_ale_fixer_map.yaml = s:fixer_list
