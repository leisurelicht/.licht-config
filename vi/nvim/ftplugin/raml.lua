vim.bo.expandtab = true
vim.bo.fileformat = "unix"
vim.bo.tabstop = 2
vim.bo.softtabstop = 2
vim.bo.shiftwidth = 2

vim.opt_local.formatoptions = vim.opt_local.formatoptions - { "c", "r", "o" }

-- new file auto header
local api = require("utils.api")
local sfh = api.augroup("auto_set_file_header", { clear = true })

api.autocmd({"BufNewFile"}, {
    pattern = {"*.raml"},
    callback = function()
        vim.cmd([[
            call setline(1, '#%RAML 1.0')
            call setline(2, '---')
            call setline(3, 'title: ')
            call setline(4, 'baseUri: ')
            call setline(5, 'version: ')
            normal! gg
            normal! j
            normal! j
            normal! $
        ]])
    end,
    group = sfh,
})

