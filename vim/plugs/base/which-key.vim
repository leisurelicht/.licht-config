scriptencoding utf-8
" vim-which-key
"
Plug 'liuchengxu/vim-which-key', { 'on': ['WhichKey', 'WhichKey!'] }

augroup vim_enter
  autocmd User vim-which-key call which_key#register('<Space>', 'g:which_key_map')
  autocmd User vim-which-key call which_key#register(',', 'g:which_key_localmap')
augroup end

nnoremap <silent> <leader>      :<c-u>WhichKey '<Space>'<CR>
nnoremap <silent> <localleader> :<c-u>WhichKey  ','<CR>

let g:which_key_map = {}
let g:which_key_localmap = {}

" ---> Create menus based on existing mappings
"
let g:which_key_map.1 = 'window-1'
let g:which_key_map.2 = 'window-2'
let g:which_key_map.3 = 'window-3'
let g:which_key_map.4 = 'window-4'
let g:which_key_map.5 = 'window-5'
let g:which_key_map.6 = 'window-6'
let g:which_key_map.7 = 'window-7'
let g:which_key_map.8 = 'window-8'
let g:which_key_map.9 = 'window-9'

let g:which_key_map.s = {
      \ 'name': '+System',
      \ 'n': ['setlocal invnumber', 'number'],
      \ 'h': ['setlocal invhlsearch', 'hlsearch'],
      \}

let g:which_key_map.v = {'name': '+VersionControl'}
let g:which_key_map.v.g = {'name': '+GitControl'}

let g:which_key_map.m = {'name': '+BookMarks'}

let g:which_key_map.l = {
      \ 'name': '+Lsp',
      \ 'K': 'hover',
      \ 'R': 'rename',
      \ 'S': 'workspace-symbol',
      \ 's': 'document-symbol',
      \ 'g': {
      \ 'name': '+Goto',
        \ 'd': 'definition',
        \ 't': 'type-definition',
        \ 'i': 'implementation',
        \}
      \}

let g:which_key_map.a = {
      \ 'name': '+ALE',
      \ 'a': 'AutoFixSwitch',
      \}

let g:which_key_map.k = 'InterestingWords'
let g:which_key_map.K = 'UncolorAllWords'

" let g:which_key_map.c = {
"       \ 'name': 'Commentary',
"       \}

let g:which_key_localmap.f = {'name': '+Fzf'}

" --->Create menus not based on existing mappings
"
