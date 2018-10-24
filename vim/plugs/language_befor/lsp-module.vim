scriptencoding utf-8
"LanguageClient-neovim
"
" LanguageServer client for NeoVim.
Plug 'autozimu/LanguageClient-neovim', {
  \ 'branch': 'next',
  \ 'do': 'bash install.sh',
  \ }

let g:LanguageClient_serverCommands = {}

" 允许在有未保存的修改时切换缓冲区，此时的修改由 vim 负责保存
" 为了解决重命名时的bug
set hidden

" Show parameter doc.
" [BUG] can not show parameter
Plug 'Shougo/echodoc.vim'
set noshowmode

let g:LanguageClient_rootMarkers = ['.git',]

let g:LanguageClient_diagnosticsEnable = 0

function LSP_maps()
  if has_key(g:LanguageClient_serverCommands, &filetype)
    nnoremap <F2> :call LanguageClient_contextMenu()<CR>
    nnoremap <buffer> <silent> K :call LanguageClient#textDocument_hover()<cr>
    nnoremap <buffer> <silent> <localleader>g :call LanguageClient#textDocument_definition({'gotoCmd': 'split'})<CR>
    nnoremap <buffer> <silent> <localleader>r :call LanguageClient#textDocument_rename()<CR>
  endif
endfunction
