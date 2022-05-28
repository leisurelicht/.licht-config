-- =================
-- path.lua --- path method
-- Author: MuCheng
-- =================
--
local M = {}

M.join = function(...)
    return table.concat(vim.tbl_flatten({...}), "/")
end

M.is_exists = function(p)
    return vim.fn.filereadable(p) == 1
end

return M
