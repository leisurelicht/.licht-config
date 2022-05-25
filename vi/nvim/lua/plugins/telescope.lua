-- =================
-- telescope.lua --- telescope init file
-- Author: MuCheng
-- =================
--
local ok, telescope = pcall(require, "telescope")
if not ok then
	vim.notify("Load telescope Failed", "warn")
	return
end

local Job = require("plenary.job")
local actions = require("telescope.actions")
local previewers = require("telescope.previewers")
local themes = require("telescope.themes")

local new_maker = function(filepath, bufnr, opts)
	filepath = vim.fn.expand(filepath)
	Job
		:new({
			command = "file",
			args = { "--mime-type", "-b", filepath },
			on_exit = function(j)
				local mime_type = vim.split(j:result()[1], "/")[1]
				if mime_type == "text" then
					previewers.buffer_previewer_maker(filepath, bufnr, opts)
				else
					-- maybe we want to write something to the buffer here
					vim.schedule(function()
						vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, { "BINARY" })
					end)
				end
			end,
		})
		:sync()
end

local function no_preview()
	return themes.get_dropdown({
		borderchars = {
			{ "─", "│", "─", "│", "┌", "┐", "┘", "└" },
			prompt = { "─", "│", " ", "│", "┌", "┐", "│", "│" },
			results = { "─", "│", "─", "│", "├", "┤", "┘", "└" },
			preview = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
		},
		width = 0.8,
		previewer = false,
		prompt_title = false,
	})
end

telescope.setup({
	defaults = {
		prompt_prefix = "🔍",
		file_sorter = require("telescope.sorters").get_fuzzy_file,
		generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
		path_display = { "truncate" },
		winblend = 0,
		border = {},
		borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
		use_less = true,
		set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
		file_previewer = require("telescope.previewers").vim_buffer_cat.new,
		grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
		qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
		buffer_previewer_maker = new_maker, -- Dont preview binaries
		mappings = {
			i = {
				["<esc>"] = actions.close,
			},
		},
	},
	pickers = {
		find_files = { theme = "dropdown" },
		oldfiles = { theme = "dropdown" },
		buffers = { theme = "dropdown" },
		marks = { theme = "dropdown" },
		commands = { theme = "dropdown" },
		command_history = { theme = "ivy" },
		search_history = { theme = "ivy" },
		git_commits = { theme = "ivy" },
		git_bcommits = { theme = "ivy" },
		git_branches = { theme = "ivy" },
		git_status = { theme = "ivy" },
		git_stash = { theme = "ivy" },
	},
	extensions = {
		file_browser = {
			theme = "ivy",
		},
		["ui-select"] = {
			no_preview(),
		},
	},
})

-- load extensions 
telescope.load_extension("fzf")
telescope.load_extension("notify")
telescope.load_extension("packer")
telescope.load_extension("neoclip")
telescope.load_extension("ui-select")
-- telescope.load_extension("project")
telescope.load_extension("projects")
-- telescope.load_extension("urlview")
telescope.load_extension("file_browser")


-- keybindings
local map = require("utils.mapping")

map.set("n", "<leader>ft","<CMD>Telescope<CR>", "Telescope List" )
map.set("n", "<leader>ff","<CMD>lua require('telescope.builtin').find_files()<CR>", "File" )
map.set("n", "<leader>fo","<CMD>lua require('telescope.builtin').oldfiles()<CR>", "Recently Opened File" )
map.set("n", "<leader>fw","<CMD>lua require('telescope.builtin').grep_string()<CR>", "Word" )
map.set("n", "<leader>fs","<CMD>lua require('telescope.builtin').live_grep()<CR>", "String" )
map.set("n", "<leader>fb","<CMD>lua require('telescope.builtin').buffers()<CR>", "Buffer" )
map.set("n", "<leader>fm","<CMD>lua require('telescope.builtin').marks()<CR>", "Marks" )
map.set("n", "<leader>fO","<CMD>lua require('telescope.builtin').vim_options<CR>", "Vim Option" )
map.set("n", "<leader>fc","<CMD>lua require('telescope.builtin').commands()<CR>", "Command" )
map.set("n", "<leader>fC","<CMD>lua require('telescope.builtin').AutoCommand()<CR>", "AutoCommand" )
map.set("n", "<leader>fH","<CMD>lua require('telescope.builtin').help_tags()<CR>", "Help Tags" )
map.set("n", "<leader>fp","<CMD>Telescope projects theme=dropdown<CR>", "Paster" )
map.set("n", "<leader>fn","<CMD>Telescope neoclip a extra=star,plus,b theme=dropdown<CR>", "Paster" )
map.set("n", "<leader>fP","<CMD>Telescope packer<CR>", "Packer Installed" )
map.set("n", "<leader>fN","<CMD>lua require('telescope').extensions.notify.notify()<CR>", "Notify" )
map.set("n", "<leader>fB","<CMD>Telescope file_browser<CR>", "File Browser" )
map.set("n", "<leader>fhc","<CMD>lua require('telescope.builtin').command_history()<CR>", "Command" )
map.set("n", "<leader>fhs","<CMD>lua require('telescope.builtin').search_history()<CR>", "Search" )
map.set("n", "<leader>fgf","<CMD>lua require('telescope.builtin').git_files()<CR>", "Files" )
map.set("n", "<leader>fgc","<CMD>lua require('telescope.builtin').git_commits()<CR>", "Commits" )
map.set("n", "<leader>fgb","<CMD>lua require('telescope.builtin').git_bcommits()<CR>", "Buffer's Commits" )
map.set("n", "<leader>fgr","<CMD>lua require('telescope.builtin').git_branches()<CR>", "Branches" )
map.set("n", "<leader>fgs","<CMD>lua require('telescope.builtin').git_status()<CR>", "Status" )
map.set("n", "<leader>fgh","<CMD>lua require('telescope.builtin').git_stash()<CR>", "Stash" )

