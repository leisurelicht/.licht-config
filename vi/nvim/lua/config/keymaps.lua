-- Keymaps are automatically loaded on the VeryLazy event
-- Add any additional keymaps here
--
local Util = require("lazyvim.util")

vim.keymap.set("n", "<leader>l", "<nop>", { desc = "" })
vim.keymap.set("n", "<leader>L", "<nop>", { desc = "" })

-- lazy
vim.keymap.set("n", "<leader>pl", "<cmd>Lazy<cr>", { desc = "Lazy" })
-- LazyVim Changelog
vim.keymap.set("n", "<leader>pc", Util.changelog, { desc = "LazyVim Changelog" })
