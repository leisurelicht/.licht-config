-- =================
-- init.lua --- plugins init file
-- Author: MuCheng
-- =================
--

require("plugins.packer")
require("plugins.which-key")
require("plugins.nvim-tree")
require("plugins.comment")
require("plugins.nvim-autopairs")
require("plugins.bufferline")
-- require("plugins.tabline")
require("plugins.lualine")
-- require('plugins.alpha-nvim')
-- require('plugins.nvim-treesitter')
-- require('plugins.symbols-outline')

-- local path = debug.getinfo(1, 'S').source
-- path = string.sub(path, 2, -1)
-- path = string.match(path, "^.*/")
-- print(vim.fn.glob(path))
-- vim.cmd([[echom "pause"]])
--

-- print(vim.inspect(KeysMap.nopts))
