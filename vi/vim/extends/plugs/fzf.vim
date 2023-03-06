scriptencoding utf-8
" 搜索 fzf
"
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

let g:fzf_command_prefix = 'Fzf'
nnoremap <leader>f<Tab> :FzfCommands<CR>
nnoremap <leader>fa :FzfAg<CR>
nnoremap <leader>fb :FzfBuffers<CR>
nnoremap <leader>fw :FzfWindows<CR>
nnoremap <leader>fs :FzfSnippets<CR>
nnoremap <leader>fp :FzfFiles<CR>

nnoremap <leader>fg :FzfGFiles<CR>
nnoremap <leader>fG :FzfGFiles?<CR>

nnoremap <leader>fhh :FzfHistory<CR>
nnoremap <leader>fhc :FzfHistory:<CR>
nnoremap <leader>fhs :FzfHistory/<CR>

nnoremap <leader>ft :FzfTags<CR>
nnoremap <leader>fT :FzfBTags<CR>
nnoremap <leader>fl :FzfLines<CR>
nnoremap <leader>fL :FzfBLines<CR>
nnoremap <leader>fc :FzfCommit<CR>
nnoremap <leader>fC :FzfBCommit<CR>

nnoremap <leader>fH :FzfHelptags<CR>
nnoremap <leader>fF :FzfFiletypes<CR>
nnoremap <leader>fO :FzfColors<CR>
nnoremap <leader>fM :FzfMaps<CR>

command! -bang -nargs=? -complete=dir FzfGFiles
      \ call fzf#vim#gitfiles(<q-args>, fzf#vim#with_preview(), <bang>0)

command! -bang -nargs=? -complete=dir FzfAg
      \ call fzf#vim#ag(<q-args>, fzf#vim#with_preview('right:50%'), <bang>0)

" Always enable preview window on the right with 60% width
let g:fzf_preview_window = 'right:60%'

" [Buffers] Jump to the existing window if possible
let g:fzf_buffers_jump = 1

" [[B]Commits] Customize the options used by 'git log':
let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'

" [Tags] Command to generate tags file
let g:fzf_tags_command = 'ctags -R'

" [Commands] --expect expression for directly executing the command
let g:fzf_commands_expect = 'alt-enter,ctrl-x'

autocmd! FileType fzf set laststatus=0 noshowmode noruler cmdheight=1
  \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler
