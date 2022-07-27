-- =================
-- header.lua --- header predefine file
-- Author: MuCheng
-- =================
--

local Header = {}

Header.python = function()
    vim.api.nvim_exec([[
        call setline(1, '#!/usr/bin/env python')
        call setline(2, '# -*-coding: utf-8-*-')
        normal! G
        normal! o
        normal! o
    ]])
end

return Header
