" 搜索 fzf
"
if utils#util#exists("/usr/local/opt/fzf")
  Plug '/usr/local/opt/fzf'
else
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
endif

Plug 'junegunn/fzf.vim'

let g:fzf_command_prefix = 'Fzf'
nnoremap <c-p> :FzfGFiles<cr>
nnoremap <leader><tab> :FzfCommands<cr>
nnoremap <leader>t :FzfTags<cr>
nnoremap <leader>b :FzfBuffers<cr>
nnoremap <leader>a :FzfAg<cr>

command! -bang -nargs=? -complete=dir FzfGFiles
      \ call fzf#vim#gitfiles(<q-args>, fzf#vim#with_preview(), <bang>0)

command! -bang -nargs=? -complete=dir FzfAg
      \ call fzf#vim#ag(<q-args>, fzf#vim#with_preview('up:50%'), <bang>0)
