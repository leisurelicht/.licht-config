-- =================
-- str.lua --- 字符串处理
-- Author: MuCheng
-- =================
--

Str = {}

function Str.split(str, sep)
    local sep, fields = sep or ":", {}
    local pattern = string.format("([^%s]+)", sep)
    str:gsub(pattern, function (c) fields[#fields + 1] = c end)
    return fields
end

function Str.first_to_upper(str)
	return str:sub(1, 1):upper() .. str:sub(2)
end

function Str.starts_with(str, start)
    if #str < #start then
        return false
    end
    return str:sub(1, #start) == start
end

function Str.ends_with(str, end_str)
    if #str < #end_str then
        return false
    end
    return str:sub(-#end_str) == end_str
end

return Str

