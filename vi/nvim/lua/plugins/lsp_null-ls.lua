-- =================
-- null-ls.lua --- null-ls config file
-- Author: MuCheng
-- =================
--
local ok, null_ls = pcall(require, "null-ls")
if not ok then
	vim.notify("Load null-ls Failed", "warn")
	return
end

null_ls.setup({
    debug = true,
	sources = {
		-- lua
		null_ls.builtins.diagnostics.luacheck,
		null_ls.builtins.formatting.stylua.with({
			"--indent-type=Spaces",
			"--indent-width=4",
		}),
		-- go
		null_ls.builtins.diagnostics.golangci_lint,
		null_ls.builtins.formatting.gofumpt,
		null_ls.builtins.formatting.goimports,
        null_ls.builtins.formatting.golines,
		-- sql
		null_ls.builtins.formatting.sqlformat,
		-- python
		null_ls.builtins.diagnostics.curlylint,
		null_ls.builtins.formatting.yapf,
		null_ls.builtins.formatting.autopep8,
		-- dockerfile
		-- null_ls.builtins.diagnostics.hadolint,
		-- markdown
		null_ls.builtins.diagnostics.markdownlint,
		-- shell
		null_ls.builtins.code_actions.shellcheck,
		null_ls.builtins.formatting.shfmt,
		-- frontend
		-- null_ls.builtins.formatting.prettier,
		-- make
		-- null_ls.builtins.diagnostics.checkmake,
		-- vim
		-- null_ls.builtins.diagnostics.vint,
	},
})
