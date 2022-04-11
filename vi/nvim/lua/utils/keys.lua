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

keys.opts = {noremap = true, silent = true}
keys.buf_opts = {noremap = true, expr = true}

function keys.mapKey(mode, lhs, rhs, opts)
  opts = vim.tbl_extend('force', keys.opts, opts or {})
  vim.api.nvim_set_keymap(mode, lhs, rhs, opts)
end

function keys.mapCmd(lhs, rhs, opts)
  opts = vim.tbl_extend('force', keys.opts, opts or {})
  vim.api.nvim_set_keymap('n', lhs, ':'..rhs..'<cr>', opts)
end

function keys.mapCmdWait(lhs, rhs, opts)
  opts = vim.tbl_extend('force', keys.opts, opts or {})
  vim.api.nvim_set_keymap('n', lhs, ':'..rhs..' ', opts)
end


function keys.mapLua(lhs, rhs, opts)
  opts = vim.tbl_extend('force', keys.opts, opts or {})
  vim.api.nvim_set_keymap('n', lhs, ':lua '..rhs..'<cr>', opts)
end

function keys.mapBufKey(buf, mode, lhs, rhs, opts)
  opts = vim.tbl_extend('force', keys.opts, opts or {})
  print(vim.inspect(opts))
  vim.api.nvim_buf_set_keymap(buf, mode, lhs, rhs, opts)
end

function keys.mapBufLua(buf, lhs, rhs, opts)
  opts = vim.tbl_extend('force', keys.opts, opts or {})
  vim.api.nvim_buf_set_keymap(buf, 'n', lhs, ':lua '..rhs..'<cr>', opts)
end

return keys
