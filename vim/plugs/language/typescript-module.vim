" Typescript
"
if executable('typescript-language-server')
  let g:LanguageClient_serverCommands.typescript = ['typescript-language-server', '--stdio']
  call LSP_maps()
endif
