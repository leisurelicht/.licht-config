-- =================
-- api.lua --- 函数别名
-- Author: MuCheng
-- =================
--
local Api = {}

Api.augroup = vim.api.nvim_create_augroup
Api.autocmd = vim.api.nvim_create_autocmd

Api.hi = {}

function Api.hi.set(name, opts)
	local command = "highlight " .. name
	for k, v in pairs(opts) do
		if k ~= "gui" then
			command = command .. " gui" .. k .. "=" .. v
		else
			command = command .. " " .. k .. "=" .. v
		end
	end
	vim.cmd(command)
end

function Api.hi.get(group, style)
	local opts = {}
	local output =  vim.fn.execute("highlight " .. group)
	local lines = vim.fn.trim(output)
	for k, v in lines:gmatch("(%a+)=(#?%w+)") do
		opts[k] = v
	end
	if style ~= "gui" then
		return opts["gui" .. style]
	end
	return opts[style]
end

return Api
