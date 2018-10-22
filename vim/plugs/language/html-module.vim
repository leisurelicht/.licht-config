scriptencoding utf-8
" HTML and CSS
"
"run file
augroup run_file
  noremap <buffer> <F12> :call custom#run#Html()<CR>
augroup end

" 修改不同类型文件的设置
augroup file_set
  setlocal fileformat=unix
  setlocal tabstop=2
  setlocal softtabstop=2
  setlocal shiftwidth=2
augroup end

echo g:_frontend_list
Plug 'mattn/emmet-vim'

" html5
Plug 'othree/html5.vim'

" ale fixer
let s:fixer_list = []

if g:ale_html_write_good
  call add(s:fixer_list, 'write-good')
endif

let g:_ale_fixer_map.html = s:fixer_list
