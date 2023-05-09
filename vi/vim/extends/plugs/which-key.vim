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
let g:which_key_map.1 = 'window-1'
let g:which_key_map.2 = 'window-2'
let g:which_key_map.3 = 'window-3'
let g:which_key_map.4 = 'window-4'
let g:which_key_map.5 = 'window-5'
let g:which_key_map.6 = 'window-6'
let g:which_key_map.7 = 'window-7'
let g:which_key_map.8 = 'window-8'
let g:which_key_map.9 = 'window-9'

let g:which_key_map.a = 'Fold'

let g:which_key_map.e = 'Explorer'

let g:which_key_map.g = {
      \ 'name': '+Git',
      \ 'b': 'Blame',
      \ 'g': 'Status',
      \ 'm': 'Message',
      \}

let g:which_key_map.l = {
      \ 'name': '+ALE',
      \ 'a': 'AutoFixSwitch',
      \ 'e': 'Enable',
      \ 'd': 'Disable',
      \ 'f': 'Fix',
      \ 'F': 'FixSuggest',
      \ 'n': 'Next',
      \ 'p': 'Previous',
      \}

let g:which_key_map.m = {
      \ 'name': '+Markdown',
      \ 'g': 'Gen GFM Toc',
      \ 'r': 'Gen Redcarpet Toc',
      \ 'd': 'Delete Toc',
      \ 'u': 'Update Toc',
      \}

let g:which_key_map.t = {
      \ 'name': '+Tabs',
      \ 't': 'Tab',
      \ 'a': 'New Tab',
      \ 'c': 'Close Tab',
      \ 'l': 'List Tabs',
      \ 'n': 'Next Tab',
      \ 'p': 'Previous Tab',
      \ 'd': 'Do In Tabs',
      \ 's': 'To New Tab',
      \ 'F': 'First Tab',
      \ 'L': 'Last Tab',
      \ 'o': {
        \ 'name': '+CloseOnly',
        \ 'o': 'TabOnly',
        \ 'a': 'Close All Other Tab',
        \ '1': 'Close All Except 1',
        \ '2': 'Close All Except 2',
        \ '3': 'Close All Except 3',
        \ '4': 'Close All Except 4',
        \ '5': 'Close All Except 5',
        \ '6': 'Close All Except 6',
        \ '7': 'Close All Except 7',
        \ '8': 'Close All Except 8',
        \ '9': 'Close All Except 9',
        \ '$': 'Close All Except Last',
        \},
      \ '1': 'Tab1',
      \ '2': 'Tab2',
      \ '3': 'Tab3',
      \ '4': 'Tab4',
      \ '5': 'Tab5',
      \ '6': 'Tab6',
      \ '7': 'Tab7',
      \ '8': 'Tab8',
      \ '9': 'Tab9',
      \}

let g:which_key_map.f = {
      \ 'name': '+Fzf',
      \ '<Tab>': 'Commands',
      \ 's': 'String',
      \ 'b': 'Buffers',
      \ 'w': 'Windows',
      \ 'n': 'Snippets',
      \ 'f': 'File',
      \ 'H': 'HelpTags',
      \ 'F': 'FileTypes',
      \ 'O': 'Colors',
      \ 'M': 'KeyMap',
      \ 'g': 'Gitfiles',
      \ 'G': 'Gitfiles?',
      \ 't': 'Tags',
      \ 'T': 'BTags',
      \ 'l': 'Lines',
      \ 'L': 'BLines',
      \ 'c': 'Commit',
      \ 'h': {
        \ 'name': 'History',
        \ 'h': 'Files',
        \ 'c': 'Commands',
        \ 's': 'Search',
        \},
      \}

" --->Create menus not based on existing mappings
"
