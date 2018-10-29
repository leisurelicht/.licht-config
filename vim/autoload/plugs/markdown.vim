
function! plugs#markdown#PreviewStop() abort
  if exists(':MarkdownPreviewStop')
    execute 'MarkdownPreviewStop'
  endif
endfunction
