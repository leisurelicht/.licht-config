-- =================
-- key.lua --- 函数别名
-- Author: MuCheng
-- =================
--
key = {}

key.map = vim.api.nvim_set_keymap
-- key.gmap = vim.api.nvim_get_keymap
-- key.dmap = vim.api.nvim_del_keymap

-- key.bsmap = vim.api.nvim_buf_set_keymap
-- key.bgmap = vim.api.nvim_buf_get_keymap
-- key.bdmap = vim.api.nvim_buf_del_keymap

key.opt = {noremap = true, silent = true}

return key
