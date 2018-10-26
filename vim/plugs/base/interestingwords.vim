scriptencoding utf-8
" 单词高亮
"
Plug 'lfv89/vim-interestingwords'

nnoremap <silent> <leader>k :call InterestingWords('n')<CR>
nnoremap <silent> <leader>K :call UncolorAllWords()<CR>

nnoremap <silent> n :call WordNavigation('forward')<CR>
nnoremap <silent> N :call WordNavigation('backward')<CR>
