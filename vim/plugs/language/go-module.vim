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
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries', 'for': 'go'}

" ---> deoplete
if g:deoplete_framework_enable ==# 1
  Plug 'zchee/deoplete-go', { 'do': 'make'}
  let g:deoplete#sources#go#gocode_binary = $GOPATH.'/bin/gocode'
  let g:deoplete#sources#go#sort_class = ['package', 'func', 'type', 'var', 'const']
endif

" ---> ncm2
if g:ncm2_framework_enable ==# 1
  Plug 'ncm2/ncm2-go', {'for': 'go'}
endif

" ---> neovim lsp
if executable('go-langserver')
  let g:LanguageClient_serverCommands.go = ['go-langserver', '-mode', 'stdio']
  call LSP_maps()
endif

" ---> ale fixer
let s:fixer_list = []

if g:ale_go_import
  call add(s:fixer_list, 'goimports')
endif
if g:ale_go_fmt
  call add(s:fixer_list, 'gofmt')
endif

let g:_ale_fixer_map.go = s:fixer_list
