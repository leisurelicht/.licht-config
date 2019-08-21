scriptencoding utf-8
" Bash
"
" ---> 自动插入文件头
augroup auto_set_file_head
  autocmd BufNewFile *.sh call custom#header#Bash()
augroup end

" ---> run file
augroup run_file
  autocmd FileType sh noremap <buffer> <F12> :call custom#run#Bash()<CR>
augroup end

" ---> 修改不同类型文件的设置
augroup file_set
  autocmd FileType sh
        \ setlocal fileformat=unix |
        \ setlocal tabstop=2 |
        \ setlocal softtabstop=2 |
        \ setlocal shiftwidth=2 |
augroup end

if g:ncm2_framework_enable
  " ---> neovim lsp
  if executable('bash-language-server')
    let g:LanguageClient_serverCommands.sh = ['bash-language-server', 'start']
    augroup lsp_map
      autocmd FileType sh call LSP_maps()
    augroup end
  endif
endif

" ---> ale fixer
let g:ale_fixers.sh = ['shfmt',]
