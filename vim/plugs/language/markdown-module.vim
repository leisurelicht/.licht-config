scriptencoding utf-8
" Markdown
"
" ---> run file
augroup run_file
  autocmd FileType markdown noremap <F12> :MarkdownPreview<CR>
  autocmd BufWinLeave *.md call plugs#markdown#PreviewStop()
augroup end

" ---> 修改不同类型文件的设置
augroup file_set
  autocmd FileType markdown
        \ setlocal fileformat=unix |
        \ setlocal tabstop=4 |
        \ setlocal softtabstop=4 |
        \ setlocal shiftwidth=4 |
augroup end

" ---> 自动生成目录
Plug 'mzlogin/vim-markdown-toc'

" ---> 实时预览
Plug 'iamcco/markdown-preview.vim', {'for': 'markdown'}
let g:mkdp_path_to_chrome = "/Applications/Google\\ Chrome.app/Contents/MacOS/Google\\ Chrome"
let g:mkdp_auto_close = 0

" ---> ncm2
if g:ncm2_framework_enable
  Plug 'ncm2/ncm2-markdown-subscope', {'for': 'markdown'}
endif

" ---> ale fixer
let g:ale_fixers.markdown = ['prettier']
