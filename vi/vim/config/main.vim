
if has('vim_starting')
  " set default encoding to utf-8
  set encoding=utf-8
  if &compatible
    set nocompatible
  endif
endif

" Detect root directory of SpaceVim
let g:_config_dir = fnamemodify(expand('<sfile>'), ':p:h')
let g:_root_dir = fnamemodify(g:_config_dir, ':p:h:h')
lockvar g:_config_dir
lockvar g:_root_dir

try
  call entry#Begin()
catch
  let &runtimepath .= ',' . g:_root_dir
  call entry#Begin()
endtry


colorscheme space-vim-dark
