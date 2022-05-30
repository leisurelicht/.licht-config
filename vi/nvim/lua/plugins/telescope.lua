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

map.set("n", "<leader>fb", require("telescope.builtin").buffers, "Buffer")
map.set("n", "<leader>fB", "<CMD>Telescope file_browser<CR>", "File Browser")
map.set("n", "<leader>fc", require("telescope.builtin").commands, "Command")
map.set("n", "<leader>fC", require("telescope.builtin").autocommands, "AutoCommand")
map.set("n", "<leader>ff", require("telescope.builtin").find_files, "File")
map.set("n", "<leader>fH", require("telescope.builtin").help_tags, "Help Tags")
map.set("n", "<leader>fm", require("telescope.builtin").marks, "Marks")
map.set("n", "<leader>fN", "<CMD>Telescope notify theme=dropdown<CR>", "Notify")
map.set("n", "<leader>fo", require("telescope.builtin").oldfiles, "Recently Opened File")
map.set("n", "<leader>fO", require("telescope.builtin").vim_options, "Vim Option")
map.set("n", "<leader>fp", "<CMD>Telescope neoclip a extra=star,plus,b theme=dropdown<CR>", "Paster")
map.set("n", "<leader>fj", "<CMD>Telescope projects theme=dropdown<CR>", "Projects")
map.set("n", "<leader>fs", require("telescope.builtin").live_grep, "String")
map.set("n", "<leader>ft", require("telescope.builtin").builtin, "Telescope List")
map.set("n", "<leader>fw", require("telescope.builtin").grep_string, "Word")
map.set("n", "<leader>fhc", require("telescope.builtin").command_history, "Command")
map.set("n", "<leader>fhs", require("telescope.builtin").search_history, "Search")
map.set("n", "<leader>fgb", require("telescope.builtin").git_bcommits, "Buffer's Commits")
map.set("n", "<leader>fgc", require("telescope.builtin").git_commits, "Commits")
map.set("n", "<leader>fgf", require("telescope.builtin").git_files, "Files")
map.set("n", "<leader>fgh", require("telescope.builtin").git_stash, "Stash")
map.set("n", "<leader>fgr", require("telescope.builtin").git_branches, "Branches")
map.set("n", "<leader>fgs", require("telescope.builtin").git_status, "Status")
