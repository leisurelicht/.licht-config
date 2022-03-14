-- =================
-- init.lua --- plugins init file
-- Author: MuCheng
-- =================
--

WhichKeyMap = {
  maps = {
    normal = {},
  },
  localMaps = {
    normal = {},
  },
}

require("plugins.packer")
require("plugins.which-key")
require("plugins.nvim-tree")
require("plugins.comment")
require("plugins.nvim-autopairs")
-- require("plugins.bufferline")
-- require("plugins.tabline")
require("plugins.lualine")
require('plugins.symbols-outline')
require('plugins.nvim-treesitter')
require('plugins.telescope')
require('plugins.alpha-nvim')
require('plugins.marks')

-- local path = debug.getinfo(1, 'S').source
-- path = string.sub(path, 2, -1)
-- path = string.match(path, "^.*/")
-- print(vim.fn.glob(path))
-- vim.cmd([[echom "pause"]])
--

-- print(vim.inspect(KeysMap.nopts))
