-- =================
-- path.lua --- path method
-- Author: MuCheng
-- =================
--
local Path = {}

Path.join = function(...)
    return table.concat(vim.tbl_flatten({...}), "/")
end

return Path
