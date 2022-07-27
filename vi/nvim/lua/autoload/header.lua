-- =================
-- header.lua --- code header
-- Author: MuCheng
-- =================
--
local api = require("utils.api")
local sfh = api.augroup("auto_set_file_header", { clear = true })

api.autocmd({"BufNewFile"}, {
    pattern = {"*.py"},
    callback = function()
        vim.cmd([[
            call setline(1, '#!/usr/bin/env python')
            call setline(2, '# -*-coding: utf-8-*-')
            normal! G
            normal! o
            normal! o
        ]])
    end,
    group = sfh,
})

api.autocmd({"BufNewFile"}, {
    pattern = {"*.sh"},
    callback = function()
        vim.cmd([[
            call setline(1, '#!/bin/bash')
            normal! G
            normal! o
            normal! o
        ]])
    end,
    group = sfh,
})

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
            " normal! a
        ]])
    end,
    group = sfh,
})
