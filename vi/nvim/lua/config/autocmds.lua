-- Autocmds are automatically loaded on the VeryLazy event
-- Add any additional autocmds here

local function augroup(name, clear)
	return vim.api.nvim_create_augroup("custom_" .. name, { clear = clear })
end

-- -- new file auto header
vim.api.nvim_create_autocmd("BufNewFile", {
	group = augroup("set_header", false),
	pattern = { "*.go" },
	callback = function()
		vim.cmd([[
            call setline(1, 'package ')
            normal! G
        ]])
	end,
})

vim.api.nvim_create_autocmd("BufNewFile", {
	group = augroup("set_header", false),
	pattern = { "*.md" },
	callback = function()
		vim.cmd([[
            call setline(1, '# ')
            normal! gg
            normal! $

        ]])
	end,
})

vim.api.nvim_create_autocmd("BufNewFile", {
	group = augroup("set_header", false),
	pattern = { "*.py" },
	callback = function()
		vim.cmd([[
            call setline(1, '#!/usr/bin/env python')
            call setline(2, '#-*-coding: utf-8-*-')
            normal! G
            normal! o
        ]])
	end,
})

vim.api.nvim_create_autocmd("BufNewFile", {
	group = augroup("set_header", false),
	pattern = { "*.raml" },
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
})

-- wood
vim.api.nvim_create_autocmd("BufNewFile", {
	group = augroup("set_header", false),
	pattern = { "*.sh" },
	once = true,
	callback = function()
		vim.cmd([[
            call setline(1, '#!/bin/bash')
            normal! G
            normal! o
            normal! o
        ]])
	end,
})
