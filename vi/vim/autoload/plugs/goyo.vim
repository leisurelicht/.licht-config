
function! plugs#goyo#Enter()
  exec 'NERDTreeClose'
  set scrolloff=999
  Limelight
endfunction

function! plugs#goyo#Leave()
  exec 'NERDTreeTabsOpen'
  set scrolloff=5
  Limelight!
endfunction
