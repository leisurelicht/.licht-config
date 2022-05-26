-- =================
-- keybindings.lua --- lsp 快捷键
-- Author: MuCheng
-- =================
--
local map = require("utils.mapping")
local lspsaga_ok, _ = pcall(require, "lspsaga")
-- local telescope_ok, _ = pcall(require, "telescope")

map.set("n", "<leader>lI", "<CMD>LspInstallInfo<CR>", "Install Info")
if lspsaga_ok then
	map.set("n", "<leader>ll", "<CMD>Lspsaga show_line_diagnostics<CR>", "Line Diagnostic")
	map.set("n", "<leader>ln", "<CMD>Lspsaga diagnostic_jump_next<CR>", "Next Diagnostic")
	map.set("n", "<leader>lp", "<CMD>Lspsaga diagnostic_jump_prev<CR>", "Previous Diagnostic")
	map.set("n", "<leader>]d", "<CMD>Lspsaga diagnostic_jump_next<CR>", "Next Diagnostic Info")
	map.set("n", "<leader>[d", "<CMD>Lspsaga diagnostic_jump_prev<CR>", "Previous Diagnostic Info")
else
	map.set("n", "<leader>ll", "<CMD>lua vim.diagnostic.open_float()<CR>", "Line Diagnostic")
	map.set("n", "<leader>ln", "<CMD>lua vim.diagnostic.goto_prev()<CR>", "Next Diagnostic")
	map.set("n", "<leader>lp", "<CMD>lua vim.diagnostic.goto_prev()<CR>", "Previous Diagnostic")
	map.set("n", "<leader>]d", "<CMD>lua vim.diagnostic.goto_next()<CR>", "Next Diagnostic Info")
	map.set("n", "<leader>[d", "<CMD>lua vim.diagnostic.goto_prev()<CR>", "Previous Diagnostic Info")
end

local M = {}

M.register = function(_, bufnr)
	vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

	map.set("n", "<leader>la", vim.lsp.buf.code_action, "Code Action", { buffer = bufnr })
	map.set("n", "<leader>lF", vim.lsp.buf.formatting, "Formatting", { buffer = bufnr })
	map.set("n", "<leader>lwa", vim.lsp.buf.add_workspace_folder, "Add Folder", { buffer = bufnr })
	map.set("n", "<leader>lwr", vim.lsp.buf.remove_workspace_folder, "Remove Folder", { buffer = bufnr })
	map.set(
		"n",
		"<leader>lwl",
		"<CMD>print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>",
		"List Folders",
		{ buffer = bufnr }
	)

	map.set("v", "<leader>lF", vim.lsp.buf.range_formatting, "Foramtting", { buffer = bufnr })
	map.set("v", "<leader>la", vim.lsp.buf.range_code_action, "Code Action", { buffer = bufnr })

	if lspsaga_ok then
		map.set("n", "<leader>lr", "<CMD>Lspsaga rename<CR>", "Rename", { buffer = bufnr })
		map.set("n", "<leader>lh", "<CMD>Lspsaga hover_doc<CR>", "Hover", { buffer = bufnr })
		map.set("n", "<leader>lH", "<CMD>Lspsaga signature_help<CR>", "Signature Help", { buffer = bufnr })
		map.set("n", "<leader>lD", "<CMD>Lspsaga preview_definition<CR>", "Preview Definition", { buffer = bufnr })

		map.set(
			"n",
			"<C-u>",
			"<cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<CR>",
			"Scroll Up",
			{ buffer = bufnr }
		)
		map.set(
			"n",
			"<C-d>",
			"<cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>",
			"Scroll Down",
			{ buffer = bufnr }
		)
	else
		map.set("n", "<leader>lr", vim.lsp.buf.rename, "Rename", { buffer = bufnr })
		map.set("n", "<leader>lh", vim.lsp.buf.hover, "Hover", { buffer = bufnr })
		map.set("n", "<leader>lH", vim.lsp.buf.signature_help, "Signature Help", { buffer = bufnr })
	end

	local telescope_ok, _ = pcall(require, "telescope")
	if telescope_ok then
		map.set("n", "<leader>lf", "<CMD>Telescope lsp_references<CR>", "References", { buffer = bufnr })
		map.set("n", "<leader>ld", "<CMD>Telescope lsp_definitions<CR>", "Definition", { buffer = bufnr })
		map.set("n", "<leader>lt", "<CMD>Telescope lsp_type_definitions<CR>", "Type Definition", { buffer = bufnr })
		map.set("n", "<leader>li", "<CMD>Telescope lsp_implementations<CR>", "Implementation", { buffer = bufnr })
		map.set("n", "<leader>lg", "<CMD>Telescope diagnostics theme=dropdown<CR>", "Diagnostic", { buffer = bufnr })
		map.set(
			"n",
			"<leader>lsd",
			"<CMD>Telescope lsp_document_symbols theme=dropdown<CR>",
			"Document",
			{ buffer = bufnr }
		)
		map.set(
			"n",
			"<leader>lsw",
			"<CMD>Telescope lsp_workspace_symbols theme=dropdown<CR>",
			"WorkSpace",
			{ buffer = bufnr }
		)
		map.set(
			"n",
			"<leader>lsy",
			"<CMD>Telescope lsp_dynamic_workspace_symbols theme=dropdown<CR>",
			"Dynamically",
			{ buffer = bufnr }
		)
	else
		map.set("n", "<leader>lf", vim.lsp.buf.references, "References", { buffer = bufnr })
		map.set("n", "<leader>ld", vim.lsp.buf.definition, "Definition", { buffer = bufnr })
		map.set("n", "<leader>ll", vim.lsp.buf.type_definition, "Type Definition", { buffer = bufnr })
		map.set("n", "<leader>li", vim.lsp.buf.implementation, "Implementation", { buffer = bufnr })
		map.set("n", "<leader>lg", vim.diagnostic.setloclist, "Diagnostic", { buffer = bufnr })
	end
end

return M
