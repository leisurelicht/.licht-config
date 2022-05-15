return {
    hooks = {
        ---@diagnostic disable-next-line: unused-local
        attach = function(client, bufnr)
            client.resolved_capabilities.document_formatting = false
        end
    },
    options = {
        root_dir = function()
            return vim.fn.getcwd()
        end,
        handlers = {
            -- If you want to disable pyright's diagnostic prompt, open the code below
            ---@diagnostic disable-next-line: unused-vararg
            ["textDocument/publishDiagnostics"] = function(...)
            end
        }
    }
}
