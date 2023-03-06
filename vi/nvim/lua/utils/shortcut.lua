-- =================
-- shortcut.lua --- 自定义快捷方法
-- Author: MuCheng
-- =================
--
local ok, terminal = pcall(require, "toggleterm.terminal")
if not ok then
	vim.notify("Load Terminal Failed", "warn")
	return
end

local Terminal = terminal.Terminal

local map = require("utils.mapping")

Scut = {}

local lazygit = Terminal:new({
	cmd = "lazygit",
	dir = "git_dir",
	direction = "float",
	float_opts = {
		border = "curved", -- 'single' | 'double' | 'shadow' | 'curved' | ... other options supported by win open
	},
	-- function to run on opening the terminal
	on_open = function(term)
		vim.cmd("startinsert!")
		map.set("n", "q", "<CScutD>close<CR>", "Close Lazygit", { buffer = term.bufnr, silent = true })
	end,
	-- function to run on closing the terminal
	-- on_close = function(term)
	--   vim.cmd("Closing terminal")
	-- end
})

function Scut._Lazygit()
	lazygit:toggle({})
end

local htop = Terminal:new({ cmd = "htop", hidden = true })

function Scut._Htop()
	htop:toggle({})
end

function Scut._buf_path()
	local path = vim.fn.expand("%")
	print(path)
	return path
end

function Scut._project_path()
	print(vim.fn.getcwd())
	return vim.fn.getcwd()
end

function Scut._buf_full_path()
	local path = vim.fn.fnamemodify(vim.fn.expand("%"), ":p")
	print(path)
	return path
end

function Scut.get_project_name()
    local project_path = require("project_nvim.project").get_project_root()
    local project_name = Str.split(project_path, "/")
    return project_name[#project_name]
end

map.set("n", "<leader>uh", Scut._Htop, "Htop")
map.set("n", "<leader>up", Scut._buf_path, "Buffer Path")
map.set("n", "<leader>uo", Scut._buf_full_path, "Buffer Full Path")


return Scut
