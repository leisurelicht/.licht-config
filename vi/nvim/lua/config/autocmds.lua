-- Autocmds are automatically loaded on the VeryLazy event
-- Add any additional autocmds here

local function augroup(name, clear)
  if clear == nil then
    clear = true
  end
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
            call setline(2, '# -*-coding: utf-8-*-')
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

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  group = augroup("filetype", false),
  pattern = { "*.api" },
  callback = function()
    vim.bo.filetype = "go"
  end,
})

-- disable leader and localleader keys for some filetypes
vim.api.nvim_create_autocmd("FileType", {
  group = augroup("unbind_leader_key"),
  pattern = {
    "lazy",
    "noice",
    "mason",
    "notify",
    "lspinfo",
    "toggleterm",
    "null-ls-info",
    "neo-tree-popup",
    "TelescopePrompt",
    "TelescopeResults",
  },
  callback = function(event)
    vim.keymap.set("n", "<leader>", "<nop>", { buffer = event.buf, desc = "" })
    vim.keymap.set("n", "<localleader>", "<nop>", { buffer = event.buf, desc = "" })
  end,
})

local auto_close_filetype = {
  lazy = true,
  mason = true,
  notify = true,
  lspinfo = true,
  lazyterm = true,
  -- TelescopePrompt = true,
  -- TelescopeResults = true,
}

-- auto close window when leaving
vim.api.nvim_create_autocmd("BufLeave", {
  group = augroup("auto_close_win"),
  callback = function(event)
    local buf = event.buf
    local ft = vim.api.nvim_buf_get_option(buf, "filetype")

    if auto_close_filetype[ft] then
      local winids = vim.fn.win_findbuf(buf)
      for _, win in pairs(winids) do
        vim.api.nvim_win_close(win, true)
      end
    end
  end,
})

-- close some filetypes with <esc>
vim.api.nvim_create_autocmd("FileType", {
  group = augroup("close_with_esc"),
  pattern = {
    "lazy",
    "help",
  },
  callback = function(event)
    vim.bo[event.buf].buflisted = false
    vim.keymap.set("n", "<esc>", "<cmd>close<cr>", { buffer = event.buf, silent = true })
  end,
})

vim.api.nvim_create_autocmd({ "FileType" }, {
  group = vim.api.nvim_create_augroup("filetype_which_key", { clear = false }),
  pattern = { "*" },
  callback = function(event)
    if require("utils").unbind_key_buf(vim.bo[event.buf].filetype) then
      return
    end

    require("which-key").register({
      l = { name = "󰿘 Lsp" },
      w = { name = " Window Split" },
    }, { mode = "n", prefix = "<leader>", buffer = event.buf })
  end,
})
