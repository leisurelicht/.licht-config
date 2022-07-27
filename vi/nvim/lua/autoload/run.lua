-- =================
-- run.lua --- code runner
-- Author: MuCheng
-- =================
--
vim.cmd([[
    function! RunRaml() abort
    exec 'w'
    let s:name = expand('%:t:r').'.html'
    exec '!raml2html % > '.s:name
    endfunction

    augroup Run_file
    autocmd FileType raml noremap <buffer> <leader>r :call RunRaml()<CR>
    augroup end
]])

vim.cmd([[
    function! RunPython() abort
    execute 'w'
    execute '!python %'
    endfunction

    augroup Run_file
    autocmd FileType python noremap <buffer> <leader>r :call RunPython()<CR>
    augroup end
]])

vim.cmd([[
    function! RunGo() abort
    execute 'w'
    execute '!go run %'
    endfunction

    augroup Run_file
    autocmd FileType go noremap <buffer> <leader>r :call RunGo()<CR>
    augroup end
]])

vim.cmd([[
    function! RunHtml() abort
    exec 'w'
    exec '!open %'
    endfunction

    augroup Run_file
    autocmd FileType html noremap <buffer> <leader>r :call RunHtml()<CR>
    augroup end  
]])

vim.cmd([[
    function! RunC() abort
        exec 'w'
        exec '!gcc % -o %<'
        exec '! ./%<'
    endfunction

    augroup Run_file
    autocmd FileType c noremap <buffer> <leader>r :call RunC()<CR>
    augroup end
]])
