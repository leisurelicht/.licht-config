vim.bo.expandtab = true
vim.bo.fileformat = "unix"
vim.bo.tabstop = 4
vim.bo.softtabstop = 4
vim.bo.shiftwidth = 4
vim.wo.colorcolumn = "79"

vim.opt_local.formatoptions = vim.opt_local.formatoptions - { "c", "r", "o" }

-- new file auto header
local api = require("utils.api")
local sfh = api.augroup("auto_set_file_header", { clear = true })

api.autocmd({"BufNewFile"}, {
    pattern = {"*.py"},
    callback = function()
        vim.cmd([[
            call setline(1, '#!/usr/bin/env python')
            call setline(2, '#-*-coding: utf-8-*-')
            normal! G
            normal! o
        ]])
    end,
    group = sfh,
})

