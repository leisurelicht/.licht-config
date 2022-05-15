local api = require("utils.api")
return {
    hooks = {
        ---@diagnostic disable-next-line: unused-local
        attach = function(client, bufnr)
            api.autocmd(
                { "BufWritePre" },
                {
                pattern = { "<buffer>" },
                command = "lua vim.lsp.buf.formatting_sync()"
            })
        end
    },
    options = {
        root_dir = function()
            return vim.fn.getcwd()
        end
    }
}
