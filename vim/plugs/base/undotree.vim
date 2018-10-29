" 时光机
"
Plug 'mbbill/undotree', {'on': 'UndotreeToggle'}

if has('persistent_undo')
  set undodir=~/.undodir/
  set undofile
endif

noremap <F6> :UndotreeToggle<CR>
noremap <leader>pu :UndotreeToggle<CR>
