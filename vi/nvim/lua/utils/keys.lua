-- =================
-- key.lua --- 快捷键函数
-- Author: MuCheng
-- =================
--
local keys = {}

-- keys.smap = vim.api.nvim_set_keymap
-- keys.gmap = vim.api.nvim_get_keymap
-- keys.dmap = vim.api.nvim_del_keymap

-- key.bsmap = vim.api.nvim_buf_set_keymap
-- key.bgmap = vim.api.nvim_buf_get_keymap
-- key.bdmap = vim.api.nvim_buf_del_keymap

keys.opts = {noremap = true, silent = true}

local function checkOpts(opts)
  if opts == nil then
    opts = keys.opts
  elseif next(opts) == nil then
    opts = {}
  else
    opts = vim.tbl_extend("force", keys.opts, opts)
  end
  return opts
end

function keys.mapKey(mode, lhs, rhs, opts)
  opts = checkOpts(opts)
  vim.api.nvim_set_keymap(mode, lhs, rhs, opts)
end

function keys.mapCmd(lhs, rhs, opts)
  opts = checkOpts(opts)
  vim.api.nvim_set_keymap("n", lhs, ":" .. rhs .. "<cr>", opts)
end

function keys.mapCmdWait(lhs, rhs, opts)
  opts = checkOpts(opts)
  vim.api.nvim_set_keymap("n", lhs, ":" .. rhs .. " ", opts)
end

function keys.mapLua(lhs, rhs, opts)
  opts = checkOpts(opts)
  vim.api.nvim_set_keymap("n", lhs, ":lua " .. rhs .. "<cr>", opts)
end

function keys.mapBufKey(buf, mode, lhs, rhs, opts)
  opts = checkOpts(opts)
  vim.api.nvim_buf_set_keymap(buf, mode, lhs, rhs, opts)
end

function keys.mapBufLua(buf, lhs, rhs, opts)
  opts = checkOpts(opts)
  vim.api.nvim_buf_set_keymap(buf, "n", lhs, ":lua " .. rhs .. "<cr>", opts)
end

return keys
