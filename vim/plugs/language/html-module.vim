" HTML and CSS
"
call add(g:_frontend_list, 'html')
call add(g:_frontend_list, 'css')

"run file
augroup run_file
  autocmd FileType html noremap <buffer> <F12> :call custom#run#Html()<CR>
augroup end

" 修改不同类型文件的设置
augroup file_set
  autocmd FileType bash
        \ setlocal fileformat=unix |
        \ setlocal tabstop=2 |
        \ setlocal softtabstop=2 |
        \ setlocal shiftwidth=2 |
augroup end

Plug 'mattn/emmet-vim', {'for': g:_frontend_list}

" html5
Plug 'othree/html5.vim', {'for': 'html'}

if g:ncm2_framework_enable
  Plug 'ncm2/ncm2-cssomni'
  Plug 'ncm2/ncm2-html-subscope'
endif

" ale fixer
let s:fixer_list = []

if g:ale_html_write_good
  call add(s:fixer_list, 'write-good')
endif

let g:_ale_fixer_map.html = s:fixer_list
