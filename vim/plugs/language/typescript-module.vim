" Typescript
"

if g:ncm2_framework_enable
  " ---> neovim lsp
  if executable('typescript-language-server')
    let g:LanguageClient_serverCommands.typescript = ['typescript-language-server', '--stdio']
    call LSP_maps()
  endif
endif
