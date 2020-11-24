scriptencoding utf-8
" 搜索 fzf
"
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
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

nnoremap <localleader>fhh :FzfHistory<CR>
nnoremap <localleader>fhc :FzfHistory:<CR>
nnoremap <localleader>fhs :FzfHistory/<CR>

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
