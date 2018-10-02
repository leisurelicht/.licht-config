scriptencoding utf-8
" ale
"
Plug 'w0rp/ale'

let g:ale_lint_on_enter = 1
let g:ale_lint_on_text_changed = 'nerver'
let g:ale_sign_column_always = 1
let g:ale_sign_error = '☠'
let g:ale_sign_warning = '★'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_statusline_format = ['⨉ %d', '⚠ %d', '⬥ OK']
let g:ale_fix_on_save = 1
let g:ale_fixers = g:_ale_fixer_map

highlight ALEWarning ctermfg=236 ctermbg=182 guifg=#303030 guibg=#d7afd7
highlight ALEError ctermfg=238 ctermbg=110 guifg=#444444 guibg=#87afd7
highlight ALEStyleError ctermfg=238 ctermbg=110 guifg=#444444 guibg=#87afd7

nnoremap <silent> <C-S> <Plug>(ale_previous_wrap)
nnoremap <silent> <C-D> <Plug>(ale_next_wrap)
