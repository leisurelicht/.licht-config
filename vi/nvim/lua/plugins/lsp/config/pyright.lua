local function filter_publish_diagnostics(a, params, client_id, c, config)
	local new_index = 1

	---@diagnostic disable-next-line: redundant-parameter
	for _, diagnostic in ipairs(params.diagnostics) do
		if not vim.tbl_contains(c.filter_keywrod, diagnostic.message) then
			params.diagnostics[new_index] = diagnostic
			new_index = new_index + 1
		end
	end

	for i = new_index, #params.diagnostics do
		params.diagnostics[i] = nil
	end

	---@diagnostic disable-next-line: redundant-parameter
	vim.lsp.diagnostic.on_publish_diagnostics(a, params, client_id, c, config)
end

return {
	hooks = {
		---@diagnostic disable-next-line: unused-local
		attach = function(client, bufnr)
			client.resolved_capabilities.document_formatting = false
		end,
	},
	options = {
		root_dir = function()
			return vim.fn.getcwd()
		end,
		handlers = {
			-- If you want to disable pyright's diagnostic prompt, open the code below
			-- ["textDocument/publishDiagnostics"] = function(...) end,

			-- If you want to disable pyright from diagnosing unused parameters, turn on the function below
			["textDocument/publishDiagnostics"] = vim.lsp.with(filter_publish_diagnostics, {
				filter_keywrod = {
					'"kwargs" is not accessed',
					'"args" is not accessed',
				},
			}),
		},
		settings = {
			python = {
				analysis = {
					typeCheckingMode = "basic", -- off, basic, strict
					useLibraryCodeForTypes = true,
					autoImportCompletions = true,
					diagnosticSeverityOverrides = {
						reportUndefinedVariable = "error",
						reportMissingTypeStubs = "none",
						reportIncompleteStub = "none",
						reportInvalidStubStatement = "none",
					},
				},
			},
		},
	},
}
