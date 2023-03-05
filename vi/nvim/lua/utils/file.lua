-- =================
-- path.lua --- path method
-- Author: MuCheng
-- =================
--

local File =  {}

File.is_exist = function(file)
    return vim.fn.filereadable(file) == 1
end

File.is_dir = function(file)
    return vim.fn.isdirectory(file) == 1
end

return File
