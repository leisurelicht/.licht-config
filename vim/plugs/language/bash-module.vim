scriptencoding utf-8
" Bash
"
" 自动插入文件头
augroup auto_set_file_head
  autocmd BufNewFile *.sh call custom#header#Bash()
augroup end

" run file
augroup run_file
  noremap <buffer> <F12> :call custom#run#Bash()<CR>
augroup end

" 修改不同类型文件的设置
augroup file_set
  setlocal fileformat=unix
  setlocal tabstop=2
  setlocal softtabstop=2
  setlocal shiftwidth=2
augroup end

" ale fixer
let s:fixer_list = []


if g:ale_bash_shfmt
  call add(s:fixer_list, 'shfmt')
endif

if g:ale_bash_language_server
  call add(s:fixer_list, 'language-server')
endif

let g:_ale_fixer_map.sh = s:fixer_list

if executable('bash-language-server')
  let g:LanguageClient_serverCommands.sh = ['bash-language-server', 'start']
  call LSP_maps()
endif
