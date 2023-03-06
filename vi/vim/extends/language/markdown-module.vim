scriptencoding utf-8
" Markdown
"
" ---> 修改不同类型文件的设置
augroup file_set
  autocmd FileType markdown
        \ setlocal fileformat=unix |
        \ setlocal tabstop=4 |
        \ setlocal softtabstop=4 |
        \ setlocal shiftwidth=4 |
augroup end

" ---> 自动生成目录
Plug 'mzlogin/vim-markdown-toc', {'for': 'markdown'}

nnoremap <leader>mg :GenTocGFM<CR>
nnoremap <leader>mr :GentocRedcarpet<CR>
nnoremap <leader>md :RemoveToc<CR>
nnoremap <leader>mu :UpdateToc<CR>


" ---> ale fixer
" let g:ale_fixers.markdown = ['prettier']
