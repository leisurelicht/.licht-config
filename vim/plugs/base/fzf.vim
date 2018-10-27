scriptencoding utf-8
" 搜索 fzf
"
if utils#util#exists('/usr/local/opt/fzf')
  Plug '/usr/local/opt/fzf'
else
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
endif

Plug 'junegunn/fzf.vim'

let g:fzf_command_prefix = 'Fzf'
nnoremap <localleader>f<Tab> :FzfCommands<CR>
nnoremap <localleader>fa :FzfAg<CR>
nnoremap <localleader>fb :FzfBuffers<CR>
nnoremap <localleader>fw :FzfWindows<CR>
nnoremap <localleader>fs :FzfSnippets<CR>
nnoremap <localleader>fp :FzfFiles<CR>

nnoremap <localleader>fg :FzfGFiles<CR>
nnoremap <localleader>fG :FzfGFiles?<CR>

nnoremap <localleader>ft :FzfTags<CR>
nnoremap <localleader>fT :FzfBTags<CR>
nnoremap <localleader>fl :FzfLines<CR>
nnoremap <localleader>fL :FzfBLines<CR>
nnoremap <localleader>fc :FzfCommit<CR>
nnoremap <localleader>fC :FzfBCommit<CR>

nnoremap <localleader>fH :FzfHelptags<CR>
nnoremap <localleader>fF :FzfFiletypes<CR>
nnoremap <localleader>fO :FzfColors<CR>
nnoremap <localleader>fM :FzfMaps<CR>

command! -bang -nargs=? -complete=dir FzfGFiles
      \ call fzf#vim#gitfiles(<q-args>, fzf#vim#with_preview(), <bang>0)

command! -bang -nargs=? -complete=dir FzfAg
      \ call fzf#vim#ag(<q-args>, fzf#vim#with_preview('right:50%'), <bang>0)
