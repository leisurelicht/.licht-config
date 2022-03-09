-- =================
-- nvim-tree.lua --- nvim-tree config file
-- Author: MuCheng
-- =================
--
local tree_cb = require('nvim-tree.config').nvim_tree_callback

-- local function print_node_path(node) {
--   print(node.absolute_path)
-- }

require('nvim-tree').setup {
  auto_close = true,
  open_on_tab = true,
  view = {
    mappings = {
      list = {
        -- { key = "p", action = "print_path", action_cb = print_node_path },
        { key = "s", cb = tree_cb('vsplit') },
      },
    },
  },
}

local keys = require('utils.keys')
keys.map('n', '<F4>', ':NvimTreeToggle<CR>', keys.opt)
keys.map('n', '<leader>pn', ':NvimTreeToggle<CR>', keys.opt)

-- vim.cmd([[
--   augroup vim_enter
--     autocmd StdinReadPre * let s:std_in=1
--     autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NvimTreeOpen' argv()[0] | wincmd p | ene | wincmd p | endif
--   augroup end
-- ]])

-- vim.cmd([[
--   augroup vim_enter
--     autocmd VimEnter * if !argc() | NvimTreeOpen | wincmd w | endif
--   augroup end
-- ]])
