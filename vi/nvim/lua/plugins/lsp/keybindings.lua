-- =================
-- keybindings.lua --- lsp 快捷键
-- Author: MuCheng
-- =================
--
local keys = require("utils.keys")
local wk = require("which-key")

wk.register({
	l = {
		name = "+LSP",
		I = { "<CMD>LspInstallInfo<CR>", "Install Info" },
	},
}, { prefix = "<leader>" })

wk.register({
	l = { name = "+LSP" },
}, { mode = "v", prefix = "<leader>" })

local M = {}

M.register = function(_, bufnr)
	vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

	local lspsaga_ok, _ = pcall(require, "lspsaga")
	if lspsaga_ok then
		wk.register({
			-- ["lr"] = { "<CMD>Lspsaga rename<CR>", "Rename" },
			-- ["la"] = { "<CMD>Lspsaga code_action<CR>", "Code Action" },
			["lh"] = { "<CMD>Lspsaga hover_doc<CR>", "Hover" },
			["lH"] = { "<CMD>Lspsaga signature_help<CR>", "Signature Help" },
			["lD"] = { "<CMD>Lspsaga preview_definition<CR>", "Preview Definition" },
			["ll"] = { "<CMD>Lspsaga show_line_diagnostics<CR>", "Line Diagnostic" },
			["ln"] = { "<CMD>Lspsaga diagnostic_jump_next<CR>", "Next Diagnostic" },
			["lp"] = { "<CMD>Lspsaga diagnostic_jump_prev<CR>", "Previous Diagnostic" },
		}, { prefix = "<leader>" })
		wk.register({
			["la"] = { ":<C-U>Lspsaga range_code_action<CR>", "Code Action" },
		}, { mode = "v", prefix = "<leader>" })
		wk.register({
			["]d"] = { "<CMD>Lspsaga diagnostic_jump_next<CR>", "Next Diagnostic Info" },
			["[d"] = { "<CMD>Lspsaga diagnostic_jump_prev<CR>", "Previous Diagnostic Info" },
		})

		keys.mapKey("n", "<C-p>", "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<CR>")
		keys.mapKey("n", "<C-n>", "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>")
	else
		wk.register({
			["lh"] = { "<CMD>lua vim.lsp.buf.hover()<CR>", "Hover" },
			["lH"] = { "<CMD>lua vim.lsp.buf.signature_help()<CR>", "Signature Help" },
			["ll"] = { "<CMD>lua vim.diagnostic.open_float()<CR>", "Line Diagnostic" },
			["ln"] = { "<CMD>lua vim.diagnostic.goto_prev()<CR>", "Next Diagnostic" },
			["lp"] = { "<CMD>lua vim.diagnostic.goto_prev()<CR>", "Previous Diagnostic" },
		}, { prefix = "<leader>", buffer = bufnr })
		wk.register({
			["]d"] = { "<CMD>lua vim.diagnostic.goto_next()<CR>", "Next Diagnostic Info" },
			["[d"] = { "<CMD>lua vim.diagnostic.goto_prev()<CR>", "Previous Diagnostic Info" },
		})
		wk.register({
			["la"] = { "<CMD>lua vim.lsp.buf.range_code_action()<CR>", "Code Action" },
		}, { mode = "v", prefix = "<leader>" })
	end

	local telescope_ok, _ = pcall(require, "telescope")
	if telescope_ok then
		wk.register({
			["lf"] = { "<CMD>Telescope lsp_references<CR>", "References" },
			["ld"] = { "<CMD>Telescope lsp_definitions<CR>", "Definition" },
			["lt"] = { "<CMD>Telescope lsp_type_definitions<CR>", "Type Definition" },
			["li"] = { "<CMD>Telescope lsp_implementations<CR>", "Implementation" },
			["lg"] = { "<CMD>Telescope diagnostics theme=dropdown<CR>", "Diagnostic" },
			["ls"] = {
				name = "+Symbols",
				d = { "<CMD>Telescope lsp_document_symbols theme=dropdown<CR>", "Document" },
				w = { "<CMD>Telescope lsp_workspace_symbols theme=dropdown<CR>", "WorkSpace" },
				y = { "<CMD>Telescope lsp_dynamic_workspace_symbols theme=dropdown<CR>", "Dynamically" },
			},
		}, { prefix = "<leader>", buffer = bufnr })
	else
		wk.register({
			["lf"] = { "<CMD>lua vim.lsp.buf.references()<CR>", "References" },
			["ld"] = { "<CMD>lua vim.lsp.buf.definition()<CR>", "Definition" },
			["ll"] = { "<CMD>lua vim.lsp.buf.type_definition()<CR>", "Type Definition" },
			["li"] = { "<CMD>lua vim.lsp.buf.implementation()<CR>", "Implementation" },
			["lg"] = { "<CMD>lua vim.diagnostic.setloclist()<CR>", "Diagnostic" },
		}, { prefix = "<leader>", buffer = bufnr })
	end

	wk.register({
		["la"] = { "<CMD>lua vim.lsp.buf.code_action()<CR>", "Code Action" },
		["lr"] = { "<CMD>lua vim.lsp.buf.rename()<CR>", "Rename" },
		["lF"] = { "<CMD>lua vim.lsp.buf.formatting()<CR>", "Formatting" },
		["lw"] = {
			name = "+WorkSpace",
			a = { "<CMD>lua vim.lsp.buf.add_workspace_folder()<CR>", "Add Folder" },
			r = { "<CMD>lua vim.lsp.buf.remove_workspace_folder()<CR>", "Remove Folder" },
			l = { "<CMD>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>", "List Folders" },
		},
	}, { prefix = "<leader>", buffer = bufnr })

	wk.register({
		["lF"] = { "<CMD>lua vim.lsp.buf.range_formatting()<CR>", "Foramtting" },
	}, { mode = "v", prefix = "<leader>" })
end

return M
