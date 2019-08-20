" Go
"
" ---> run file
augroup run_file
  autocmd FileType go noremap <buffer> <F12> :call custom#run#Go()<CR>
augroup end

" ---> 修改不同类型文件的设置
augroup file_set
  autocmd FileType go
        \ setlocal fileformat=unix |
        \ setlocal tabstop=4 |
        \ setlocal softtabstop=4 |
        \ setlocal shiftwidth=4 |
augroup end

" ---> vim-go
" Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries', 'for': 'go'}

" ---> ncm2
if g:ncm2_framework_enable ==# 1
  Plug 'ncm2/ncm2-go', {'for': 'go'}

  " ---> neovim lsp
  if executable('gopls')
    let g:LanguageClient_serverCommands.go = ['gopls']
    augroup format
      autocmd BufWritePre *.go :call LanguageClient#textDocument_formatting_sync()
    augroup end
    call LSP_maps()
  endif
endif


" ---> ale fixer
let g:ale_fixers.go = ['goimports', 'gofmt']
