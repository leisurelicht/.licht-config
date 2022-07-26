scriptencoding utf-8
" ---> Set Plugin Manager
" default:  <vim-plug>  use vim-plug
"           <dein>      use dein(in plan)
let g:plugin_manager = 'vim-plug'

" --> Supported Languages Module
" Markdown
" YAML
" Docker
" SQL
" Shell
" Vimscript
" Python
" Go
" Javascript
" Vue

" ---> Ale fixer
" default:  <1> enable
"           <0> disable
let g:ale_auto_fix_on_save = 1
