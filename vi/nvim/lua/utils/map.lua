-- =================
-- mapping.lua
-- Note:
-- =================
--

local M = {}

function M.set(mode, lhs, rhs, opts)
  local keys = require("lazy.core.handler").handlers.keys
  ---@cast keys LazyKeysHandler
  -- do not create the keymap if a lazy keys handler exists
  if not keys.active[keys.parse({ lhs, mode = mode }).id] then
    opts = opts or {}
    opts.silent = opts.silent ~= false
    if opts.remap and not vim.g.vscode then
      opts.remap = nil
    end
    vim.keymap.set(mode, lhs, rhs, opts)
  end
end

function M.del(mode, lhs, opts)
  vim.keymap.del(mode, lhs, opts)
end

function M.has(mode, lhs, opts)
  local keymap = {}
  if opts and opts.buffer then
    keymap = vim.api.nvim_buf_get_keymap(opts.buffer, mode)
  else
    keymap = vim.api.nvim_get_keymap(mode)
  end
  for _, v in pairs(keymap) do
    if v.lhs == lhs then
      return true
    end
  end
  return false
end

function M.lazy(mode, lhs, rhs, opts)
  vim.api.nvim_create_autocmd("FileType", {
    group = vim.api.nvim_create_augroup("filetype_keymap", { clear = false }),
    pattern = { "*" },
    callback = function(event)
      if require("utils").unbind_key_buf(vim.bo[event.buf].filetype) then
        return
      end

      opts.buffer = event.buf
      M.set(mode, lhs, rhs, opts)
    end,
  })
end

return M
