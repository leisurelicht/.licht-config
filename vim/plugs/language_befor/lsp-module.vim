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

let g:LanguageClient_rootMarkers = ['.git',]

let g:LanguageClient_diagnosticsEnable = 0

function LSP_maps()
  if has_key(g:LanguageClient_serverCommands, &filetype)
    let g:lsp_key_register = 1
    nnoremap <F2> :call LanguageClient_contextMenu()<CR>
    nnoremap <leader>lm :call LanguageClient_contextMenu()<CR>
    nnoremap <buffer> <silent> <leader>lR :call LanguageClient#textDocument_rename()<CR>
    nnoremap <buffer> <silent> <leader>lK :call LanguageClient#textDocument_hover()<CR>
    nnoremap <buffer> <silent> <leader>ls :call LanguageClient#textDocument_documentSymbol()<CR>
    nnoremap <buffer> <silent> <leader>lS :call LanguageClient#workspace_symbol()<CR>
    nnoremap <buffer> <silent> <leader>lgdd :call LanguageClient#textDocument_definition({'gotoCmd': 'split'})<CR>
    nnoremap <buffer> <silent> <leader>lgdv :call LanguageClient#textDocument_definition({'gotoCmd': 'vsplit'})<CR>
    nnoremap <buffer> <silent> <leader>lgtt :call LanguageClient#textDocument_typeDefinition({'gotoCmd': 'split'})<CR>
    nnoremap <buffer> <silent> <leader>lgtv :call LanguageClient#textDocument_typeDefinition({'gotoCmd': 'vsplit'})<CR>
    nnoremap <buffer> <silent> <leader>lgii :call LanguageClient#textDocument_implementation({'gotoCmd': 'split'})<CR>
    nnoremap <buffer> <silent> <leader>lgiv :call LanguageClient#textDocument_implementation({'gotoCmd': 'vsplit'})<CR>
  endif
endfunction
