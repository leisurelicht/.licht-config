" bookmarks
"
Plug 'MattesGroeger/vim-bookmarks'

nnoremap <Leader>mm :BookmarkToggle<CR>
nnoremap <Leader>mi :BookmarkAnnotate<Space>
nnoremap <Leader>ma :BookmarkShowAll<CR>
nnoremap <Leader>mn :BookmarkNext<CR>
nnoremap <Leader>mp :BookmarkPrev<CR>
nnoremap <Leader>mc :BookmarkClear<CR>
nnoremap <Leader>mx :BookmarkClearAll<CR>
nnoremap <Leader>mu :BookmarkMoveUp<Space>
nnoremap <Leader>md :BookmarkMoveDown<Space>
nnoremap <Leader>mg :BookmarkMoveToLine<CR>

highlight BookmarkSign ctermbg=black ctermfg=white
highlight BookmarkAnnotationSign ctermbg=black ctermfg=white
highlight BookmarkLine ctermbg=black ctermfg=white
highlight BookmarkAnnotationLine ctermbg=black ctermfg=white
