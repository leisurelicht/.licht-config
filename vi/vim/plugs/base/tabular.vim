" tabular
"
Plug 'godlygeek/tabular', {'on': 'Tabularize'}

nnoremap <leader>ft :Tab/
nnoremap <leader>f= :Tabularize /=<CR>
vnoremap <leader>f= :Tabularize /=<CR>
nnoremap <leader>f+ :Tabularize /=\zs<CR>
vnoremap <leader>f+ :Tabularize /=\zs<CR>
nnoremap <leader>f: :Tabularize /:<CR>
vnoremap <leader>f: :Tabularize /:<CR>
nnoremap <leader>f; :Tabularize /:\zs<CR>
vnoremap <leader>f; :Tabularize /:\zs<CR>

inoremap <silent> <Bar>   <Bar><Esc>:call <SID>align()<CR>a

function! s:align()
  let p = '^\s*|\s.*\s|\s*$'
  if exists(':Tabularize') && getline('.') =~# '^\s*|' && (getline(line('.')-1) =~# p || getline(line('.')+1) =~# p)
    let column = strlen(substitute(getline('.')[0:col('.')],'[^|]','','g'))
    let position = strlen(matchstr(getline('.')[0:col('.')],'.*|\s*\zs.*'))
    Tabularize/|/l1
    normal! 0
    call search(repeat('[^|]*|',column).'\s\{-\}'.repeat('.',position),'ce',line('.'))
  endif
endfunction
