" 时光机
"
Plug 'mbbill/undotree', {'on': 'UndotreeToggle'}

if has('persistent_undo')
  set undodir=~/.undodir/
  set undofile
endif

map <F6> :UndotreeToggle<CR>
