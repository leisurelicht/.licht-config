-- =================
-- path.lua --- path method
-- Author: MuCheng
-- =================
--
local Path = {}

Path.join = function(...)
    return table.concat(vim.tbl_flatten({...}), "/")
end

Path.is_exists = function(p)
    return vim.fn.filereadable(p) == 1
end

return Path
