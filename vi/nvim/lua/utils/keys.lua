-- =================
-- key.lua --- 函数别名
-- Author: MuCheng
-- =================
--
local keys = {}

keys.map = vim.api.nvim_set_keymap
-- key.gmap = vim.api.nvim_get_keymap
-- key.dmap = vim.api.nvim_del_keymap

-- key.bsmap = vim.api.nvim_buf_set_keymap
-- key.bgmap = vim.api.nvim_buf_get_keymap
-- key.bdmap = vim.api.nvim_buf_del_keymap

keys.opt = {noremap = true, silent = true}

function keys.mapKey(mode, lhs, rhs)
  vim.api.nvim_set_keymap(mode, lhs, rhs, keys.opt)
end

function keys.mapCmd(key, cmd)
  vim.api.nvim_set_keymap('n', key, ':'..cmd..'<cr>', keys.opt)
end

function keys.mapCmdWait(key, cmd)
  vim.api.nvim_set_keymap('n', key, ':'..cmd..' ', keys.opt)
end


function keys.maplua(key, method)
  vim.api.nvim_set_keymap('n', key, ':lua '..method..'<cr>', keys.opt)
end

return keys
