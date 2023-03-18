-- Autocmds are automatically loaded on the VeryLazy event
-- Add any additional autocmds here

local function augroup(name)
  return vim.api.nvim_create_augroup("custom_" .. name, {clear = true})
end

-- -- new file auto header
vim.api.nvim_create_autocmd(
  {"BufNewFile"},
  {
    group = augroup("set_header", {clear = true}),
    pattern = {"*.go"},
    callback = function()
      vim.cmd([[
            call setline(1, 'package ')
            normal! G
        ]])
    end
  }
)

vim.api.nvim_create_autocmd(
  {"BufNewFile"},
  {
    group = augroup("set_header", {clear = true}),
    pattern = {"*.md"},
    callback = function()
      vim.cmd([[
            call setline(1, '# ')
            normal! gg
            normal! $

        ]])
    end
  }
)

vim.api.nvim_create_autocmd(
  {"BufNewFile"},
  {
    group = augroup("set_header", {clear = true}),
    pattern = {"*.py"},
    callback = function()
      vim.cmd(
        [[
            call setline(1, '#!/usr/bin/env python')
            call setline(2, '#-*-coding: utf-8-*-')
            normal! G
            normal! o
        ]]
      )
    end
  }
)

vim.api.nvim_create_autocmd(
  {"BufNewFile"},
  {
    group = augroup("set_header", {clear = true}),
    pattern = {"*.raml"},
    callback = function()
      vim.cmd(
        [[
            call setline(1, '#%RAML 1.0')
            call setline(2, '---')
            call setline(3, 'title: ')
            call setline(4, 'baseUri: ')
            call setline(5, 'version: ')
            normal! gg
            normal! j
            normal! j
            normal! $
        ]]
      )
    end
  }
)

vim.api.nvim_create_autocmd(
  "BufNewFile",
  {
    group = augroup("set_header", {clear = true}),
    pattern = {"*.sh"},
    once = true,
    callback = function()
      vim.cmd(
        [[
            call setline(1, '#!/bin/bash')
            normal! G
            normal! o
            normal! o
        ]]
      )
    end
  }
)
