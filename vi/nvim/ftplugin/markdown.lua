vim.bo.expandtab = true
vim.bo.fileformat = "unix"
vim.bo.tabstop = 2
vim.bo.softtabstop = 2
vim.bo.shiftwidth = 2

vim.opt_local.formatoptions = vim.opt_local.formatoptions - { "c", "r", "o" }

vim.o.list = true
vim.opt.listchars:append("space:·")
vim.opt.listchars:append("eol:↴")

-- new file auto header
local api = require("utils.api")
local sfh = api.augroup("auto_set_file_header", { clear = true })

api.autocmd({"BufNewFile"}, {
    pattern = {"*.md"},
    callback = function()
        vim.cmd([[
            call setline(1, '# ')
            normal! gg
            normal! $

        ]])
    end,
    group = sfh,
})

