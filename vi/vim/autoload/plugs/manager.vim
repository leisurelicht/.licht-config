function! plugs#manager#check() abort
  if g:plugin_manager ==? 'vim-plug'
    let g:_dein_installed = 0
		if filereadable(expand('~/.vim/autoload/plug.vim'))
			let g:_vim_plug_installed = 1
		else
			call plugs#manager#install('vim-plug')
			let g:_vim_plug_installed = 1
		endif
  elseif g:plugin_manager ==? 'dein'
    let g:_vim_plug_installed = 0
    " TODO
    let g:_dein_installed = 1
  endif
endfunction

function! plugs#manager#install(plug) abort
  if executable('curl')
    if a:plug ==? 'vim-plug'
      call plugs#manager#install_vim_plug()
    elseif a:plug ==? 'dein'
      call plugs#manager#install_dein()
    endif
  else
    echohl WarningMsg
    echom 'You need install curl'
    echohl None
  endif
endfunction

function! plugs#manager#install_vim_plug() abort
  execute '!curl -fLo'
        \ . ' ~/.vim/autoload/plug.vim'
				\ . ' --create-dirs'
				\ . ' https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
endfunction

function! plugs#manager#install_dein()
  " TODO
endfunction
